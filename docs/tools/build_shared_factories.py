#!/usr/bin/env python3
"""Build four factories from one neutral left module, masks and swappable right sides.

Requires Pillow. Edit docs/data/factory-palettes.json, then run this script to
regenerate palette Lua and matching icons. AI masters stay intact; original shadows are read from the 0.4.15 Git import.
"""
import hashlib
import json
import math
import io
import subprocess
from pathlib import Path
from PIL import Image, ImageDraw, ImageChops, ImageFilter

ROOT = Path(__file__).resolve().parents[2]
OUT = ROOT / 'graphics/entity'
ORIGINAL_COMMIT = "103efa8acc74ab86b282b5388f64f333d06660dd"
ART = ROOT / 'docs/artwork/ai-redraw-0.5.1'
PALETTES = json.loads((ROOT / 'docs/data/factory-palettes.json').read_text())
CROP = (94, 51, 672, 1178)
REGIONS = {'upper': (43, 61, 97, 109), 'front': (36, 171, 103, 236),
           'rear': (41, 15, 105, 70), 'opening-glow': (45, 28, 99, 138)}


def placed(im):
    out = Image.new('RGBA', (256, 256))
    out.paste(im.crop(CROP).resize((110, 216), Image.Resampling.LANCZOS), (2, 16))
    return out


def tint(im, color):
    channels = [im.getchannel(i).point(lambda v: round(v * factor))
                for i, factor in enumerate(color)]
    return Image.merge('RGBA', (*channels, im.getchannel('A')))


def build():
    master = Image.open(ART / 'fabrik-equip-icon-source.png').convert('RGBA')
    vehicle = Image.open(ART / 'fabrik-trucks-icon-source.png').convert('RGBA')
    # Reuse the corrected complete cylinder; no new cylinder redraw per factory.
    mask = Image.new('L', master.size)
    ImageDraw.Draw(mask).polygon([(332, 934), (340, 886), (386, 860), (443, 842),
        (515, 844), (561, 866), (576, 910), (577, 1009), (568, 1059),
        (547, 1090), (510, 1116), (453, 1128), (399, 1111), (360, 1086), (335, 1044)], fill=255)
    mask = mask.filter(ImageFilter.GaussianBlur(1))
    patch = Image.new('RGBA', master.size)
    patch.paste(vehicle, (-7, 29))
    shifted_mask = Image.new('L', master.size)
    shifted_mask.paste(mask, (-7, 29))
    clean = Image.composite(patch, master, shifted_mask)
    # Erase the old front indicator below the former, incomplete drum as well.
    # The replacement fully covers it. Rear and upper lamps need clean metal.
    for x0, y0, x1, y1 in [(431, 85, 471, 121)]:
        for y in range(y0, y1):
            a, b = clean.getpixel((x0 - 1, y)), clean.getpixel((x1, y))
            for x in range(x0, x1):
                t = (x - x0 + 1) / (x1 - x0 + 1)
                clean.putpixel((x, y), tuple(round(v * (1 - t) + w * t) for v, w in zip(a, b)))
    for box in [(422, 319, 480, 352), (529, 380, 564, 429),
                (421, 451, 479, 483), (334, 378, 377, 430)]:
        for y in range(box[1], box[3]):
            for x in range(box[0], box[2]):
                dx, dy = (x - 450) / 96, (y - 403) / 66
                c = math.sqrt(.5)
                clean.putpixel((x, y), master.getpixel((round(450 + 96 * (dx - dy) * c),
                                                       round(403 + 66 * (dx + dy) * c))))
    # Separate neutral material masks. Brightness retains texture; tint selects
    # the material color independently from the body and moving lamps.
    ring_mask = Image.new('L', master.size)
    d = ImageDraw.Draw(ring_mask)
    for outer, inner in [((326, 95, 576, 282), (378, 124, 527, 223)),
                         ((326, 516, 576, 703), (378, 549, 527, 644))]:
        d.ellipse(outer, fill=255); d.ellipse(inner, fill=0)
    body = Image.new('RGBA', master.size)
    masks = {name: Image.new('RGBA', master.size) for name in ['trim', 'rings', 'panels']}
    for y in range(CROP[1], CROP[3]):
        for x in range(CROP[0], CROP[2]):
            r, g, b, a = clean.getpixel((x, y))
            value = max(r, g, b)
            body.putpixel((x, y), (value, value, value, a))
            name = None
            if ring_mask.getpixel((x, y)) and max(r,g,b)-min(r,g,b) < 65:
                name = 'rings'
            elif r > g * 1.18 and r > b * 1.5:
                name = 'trim'
            elif b > r * 1.25 and b > g * 1.10:
                name = 'panels'
            if name:
                masks[name].putpixel((x, y), (value, value, value, a))
    placed(body).crop((2, 16, 112, 232)).save(OUT / 'factory-left-base.png')
    for name, im in masks.items():
        placed(im).crop((2, 16, 112, 232)).save(OUT / f'factory-left-{name}.png')
    # Cutouts and white light masks share exactly the same projection. Tint is
    # applied only to lights, leaving recesses, metal rims and lighting neutral.
    for name in ['upper', 'front', 'rear']:
        box = REGIONS[name]; w, h = box[2]-box[0], box[3]-box[1]
        sheets = [Image.new('RGBA', (w*16, h)) for _ in range(2)]
        visible = Image.new('L', master.size, 255)
        if name == 'rear':
            visible = Image.new('L', master.size)
            ImageDraw.Draw(visible).polygon([(431,85),(473,89),(579,142),(609,177),
                (609,312),(577,312),(577,264),(587,220),(579,170),(550,132),
                (507,109),(471,118),(431,118)], fill=255)
        def point(angle, radius=1, depth=0):
            if name == 'upper':
                return (450+96*radius*math.sin(angle),403-66*radius*math.cos(angle))
            if name == 'front':
                return (451+104*radius*math.sin(angle),1047-90*radius*math.cos(angle)-depth)
            return (453+116*radius*math.sin(angle),250-68*radius*math.cos(angle)-depth)
        for n in range(16):
            parts = [Image.new('RGBA', master.size) for _ in range(2)]
            draws = [ImageDraw.Draw(im) for im in parts]
            count = 4 if name == 'upper' else 2
            for marker in range(count):
                angle = marker*math.tau/count + n*math.tau/16*(-1 if name == 'upper' else 1)
                angle = (angle+math.pi)%math.tau-math.pi
                if name != 'upper':
                    depth = 60 if name == 'front' else 75
                    for i, half, extent in [(0,.17,depth+5),(1,.11,depth)]:
                        a,b=max(angle-half,-math.pi/2),min(angle+half,math.pi/2)
                        if a < b:
                            poly=[point(a,depth=extent),point(b,depth=extent),point(b),point(a)]
                            draws[i].polygon(poly,fill=(18,20,24,255) if i==0 else (220,220,220,255))
                            if i==0:draws[i].line(poly+poly[:1],fill=(110,110,110,255),width=3)
                for i,half,inner,outer in [(0,.20,.83,1.13),(1,.14,.90,1.04)]:
                    a,b=angle-half,angle+half
                    poly=[point(a,inner),point(b,inner),point(b,outer),point(a,outer)]
                    draws[i].polygon(poly,fill=(18,20,24,255) if i==0 else (240,240,240,255))
                    if i==0:draws[i].line(poly+poly[:1],fill=(110,110,110,255),width=3)
                    else:draws[i].line([point(a,.94),point(b,.94)],fill='white',width=2)
            for i,im in enumerate(parts):
                im.putalpha(ImageChops.multiply(im.getchannel('A'),visible))
                sheets[i].paste(placed(im).crop(box),(w*n,0))
        for suffix,sheet in zip(['cutouts','lights'],sheets):
            sheet.save(OUT/f'factory-left-{name}-{suffix}.png')
    # Optional processing glow in the two openings; independent of metal/rings.
    box=REGIONS['opening-glow'];w,h=box[2]-box[0],box[3]-box[1]
    sheet=Image.new('RGBA',(w*16,h))
    levels=[0,0,0,.5,1,1,1,1,1,1,1,.65,0,0,0,0]
    for n,level in enumerate(levels):
        im=Image.new('RGBA',master.size);d=ImageDraw.Draw(im)
        for cx,cy in [(450,179),(450,602)]:
            d.ellipse((cx-59,cy-28,cx+59,cy+31),fill=(235,235,235,round(220*level)))
            d.ellipse((cx-43,cy-19,cx+43,cy+23),fill=(255,255,255,round(230*level)))
        sheet.paste(placed(im).crop(box),(w*n,0))
    sheet.save(OUT/'factory-left-opening-glow.png')
    # Right sides are replaceable independently of the common module.
    for name, crop in [('weapons',(609,58,1101,1166)),('trucks',(637,80,1107,1141)),
                       ('equip',(672,51,1153,1178))]:
        Image.open(ART/f'fabrik-{name}-icon-source.png').convert('RGBA').crop(crop).resize(
            (92,216),Image.Resampling.LANCZOS).save(OUT/f'factory-{name}-right.png')
    build_component_right()
    # Per-variant original shadows; component shadows follow the cell buildup.
    for name in PALETTES:
        original=Image.open(io.BytesIO(subprocess.check_output(
            ['git', '-C', str(ROOT), 'show', f'{ORIGINAL_COMMIT}:graphics/entity/fab-{name}-sheet.png']))).convert('RGBA')
        count=16 if name=='comp' else 1
        sheet=Image.new('RGBA',(256*count,256))
        for n in range(count):
            f=original.crop((128*n,0,128*(n+1),128))
            f.putdata([(0,0,0,a) if r==g==b==0 else (0,0,0,0) for r,g,b,a in f.getdata()])
            if name=='comp':f=component_ground_shadow(f)
            sheet.paste(f.resize((256,256),Image.Resampling.LANCZOS),(256*n,0))
        sheet.save(OUT/f'fab-{name}-shadow.png')
    # Generated palette table: data-stage tints and authoring previews use one input.
    def lua(value):
        if value is False:return 'false'
        if isinstance(value,list):return '{'+', '.join(str(v) for v in value)+'}'
        if isinstance(value,str):return json.dumps(value)
        return str(value)
    lines=['-- Generated by docs/tools/build_shared_factories.py; edit docs/data/factory-palettes.json.','return {']
    for name,p in PALETTES.items():
        lines.append('  '+name+' = {'+', '.join(k+' = '+lua(v) for k,v in p.items())+'},')
    (ROOT/'prototypes/factory-palettes.lua').write_text('\n'.join(lines+['}'])+'\n')
    for name in PALETTES:
        icon = render(name,12 if name=='comp' else 0,shadow=False)
        icon.resize((64,64),Image.Resampling.LANCZOS).save(OUT/f'fabrik-{name}-icon.png')
    # Keep the existing provenance/validation manifest in sync with palette edits.
    manifest_path = ROOT / 'docs/data/ai-redraw-0.5.1.json'
    manifest = json.loads(manifest_path.read_text())
    module = manifest['shared_factory_module']
    module['palettes']['sha256'] = hashlib.sha256((ROOT / module['palettes']['path']).read_bytes()).hexdigest()
    entries = list(module['outputs'])
    for animation in manifest['layered_animations']:
        if animation['prototype'] in {p['prototype'] for p in PALETTES.values()}:
            entries.extend(animation['outputs'])
    for entry in entries:
        path = ROOT / entry['path']
        entry['sha256'] = hashlib.sha256(path.read_bytes()).hexdigest()
        entry['dimensions'] = list(Image.open(path).size)
    for entry in manifest['redraws']:
        if 'shared_module_derivative' in entry:
            entry['sha256'] = hashlib.sha256((ROOT / entry['path']).read_bytes()).hexdigest()
    manifest_path.write_text(json.dumps(manifest, indent=2) + '\n')


def build_component_right():
    """Fixed platform and six identical cells, extracted from the accepted master.

    Frame pairs add back-left, back-right, middle-left, middle-right, front-left,
    front-right; frame15 clears, matching fab-comp-sheet.png. No shaded body rotates.
    """
    source = Image.open(ART/'fabrik-comp-icon-source.png').convert('RGBA')
    crop = (615,61,1077,1151)
    def module(im):
        return im.crop(crop).resize((92,216),Image.Resampling.LANCZOS)
    # Extend an exposed floor tile under the cells; retain the master's bottom rim.
    platform = Image.new('RGBA',source.size)
    platform.paste(source.crop((615,1025,1077,1151)),(615,1025))
    tile = source.crop((641,954,749,1047))
    platform.paste(tile.resize((462,645),Image.Resampling.LANCZOS),(615,380))
    d=ImageDraw.Draw(platform)
    for x in [616,760,1069]:
        d.line((x,380,x,1050),fill=(43,24,16,255),width=5)
        d.line((x+4,380,x+4,1050),fill=(135,72,38,255),width=2)
    for y in [380,605,830]:
        d.line((615,y,1076,y),fill=(43,24,16,255),width=5)
        d.line((615,y+4,1076,y+4),fill=(135,72,38,255),width=2)
    module(platform).save(OUT/'factory-comp-right.png')
    # The unobscured front-right cell supplies the same complete model everywhere.
    mask=Image.new('L',source.size)
    ImageDraw.Draw(mask).polygon([
        (921,721),(947,721),(949,735),(974,740),(995,753),(1011,771),
        (1020,793),(1031,815),(1035,843),(1034,941),(1029,969),
        (1017,989),(994,1006),(963,1019),(930,1024),(895,1018),
        (867,1005),(850,984),(840,957),(839,845),(843,817),
        (851,791),(865,768),(886,748),(920,736)],fill=255)
    cell=source.copy();cell.putalpha(ImageChops.multiply(source.getchannel('A'),mask))
    cell=cell.crop((837,719,1038,1027))
    sheet=Image.new('RGBA',(92*16,216))
    positions=[(628,272),(838,322),(660,446),(838,555),(628,615),(838,719)]
    for n in range(16):
        frame=Image.new('RGBA',source.size)
        count=0 if n==15 else min(n//2,6)
        for position in positions[:count]:frame.alpha_composite(cell,position)
        shaded=component_cast_shadows(frame,platform,positions[:count],crop,cell)
        sheet.paste(shaded,(92*n,0))
    sheet.save(OUT/'factory-comp-cells.png')


def component_ground_shadow(frame):
    """Keep the two connected ground shadows, not black details inside old cells."""
    pixels=frame.load()
    remaining={(x,y) for y in range(128) for x in range(128) if pixels[x,y][3]}
    groups=[]
    while remaining:
        seed=remaining.pop();group={seed};pending=[seed]
        while pending:
            x,y=pending.pop()
            for point in [(x-1,y),(x+1,y),(x,y-1),(x,y+1)]:
                if point in remaining:
                    remaining.remove(point);group.add(point);pending.append(point)
        groups.append(group)
    keep=set().union(*sorted(groups,key=len,reverse=True)[:2])
    for y in range(128):
        for x in range(128):
            if (x,y) not in keep:pixels[x,y]=(0,0,0,0)
    return frame


def component_cast_shadows(cells,platform,positions,crop,cell):
    """Bake directional occlusion onto receiving cells/floor, never empty space.

    Approximate the accepted cells as upright cylinders in an orthographic scene.
    Depth projects at 1/2 scale; screen y also includes the cell's height. Rays
    toward the upper-left light test only material above the receiving surface,
    so equal-height caps cannot cast a pasted silhouette across each other.
    """
    size=(184,432)  # twice runtime resolution for soft, stable shadow boundaries
    visible=cells.crop(crop).resize(size,Image.Resampling.LANCZOS)
    if not positions:return visible.resize((92,216),Image.Resampling.LANCZOS)
    floor=platform.crop(crop).resize(size,Image.Resampling.LANCZOS)
    receiving=ImageChops.lighter(visible.getchannel('A'),floor.getchannel('A'))
    shade=Image.new('L',size);sp=shade.load();alpha=cell.getchannel('A').load();rp=receiving.load()
    radius,height=96,195
    centers=[(x+100,(y+260)*2) for x,y in positions]
    light_x,light_depth=-1.2,-1.0
    a=light_x**2+light_depth**2
    for v in range(size[1]):
        y=crop[1]+(v+.5)*(crop[3]-crop[1])/size[1]
        for u in range(size[0]):
            if rp[u,v]<128:continue
            x=crop[0]+(u+.5)*(crop[2]-crop[0])/size[0]
            owner=None;z=0
            # Frontmost opaque cell owns this pixel; cylindrical depth gives its
            # surface height. The floor is the receiver when no cell is present.
            for i,(px,py) in enumerate(positions):
                if px<=x<px+201 and py<=y<py+308:
                    # Sample the shared complete cell before overlap/compositing.
                    sx=int(x-px);sy=int(y-py)
                    if alpha[sx,sy]>128:
                        owner=i
                        front=.5*math.sqrt(max(0,radius**2-(x-px-100)**2))
                        z=max(0,min(height,py+260+front-y))
            depth=(y+z)*2
            for i,(cx,cy) in enumerate(centers):
                if i==owner:continue
                dx,dy=x-cx,depth-cy
                b=2*(dx*light_x+dy*light_depth)
                discriminant=b*b-4*a*(dx*dx+dy*dy-radius**2)
                if discriminant<0:continue
                root=math.sqrt(discriminant)
                enter=(-b-root)/(2*a);leave=(-b+root)/(2*a)
                if leave>1 and max(enter,1)<height-z:
                    sp[u,v]=105;break
    shade=ImageChops.multiply(shade.filter(ImageFilter.GaussianBlur(.8)),receiving)
    overlay=Image.new('RGBA',size,(0,0,0,0));overlay.putalpha(shade)
    visible.alpha_composite(overlay)
    return visible.resize((92,216),Image.Resampling.LANCZOS)


def render(name,n,shadow=True, palette=None):
    """Authoring preview of the same layers/positions used by factory_visuals.lua."""
    p=PALETTES[name] if palette is None else palette
    out=Image.new('RGBA',(256,256))
    def add(filename,w,h,x,y,animated=False,color=None):
        im=Image.open(OUT/filename).convert('RGBA')
        if animated:im=im.crop((n*w,0,(n+1)*w,h))
        if color:im=tint(im,color)
        out.alpha_composite(im,(x,y))
    if shadow:add(f'fab-{name}-shadow.png',256,256,0,0,name=='comp')
    add(f'factory-{name}-right.png',92,216,112,16)
    if name=='comp':add('factory-comp-cells.png',92,216,112,16,True)
    add('factory-left-base.png',110,216,2,16)
    for material in ['trim','rings','panels']:add(f'factory-left-{material}.png',110,216,2,16,color=p[material])
    for rotor in ['upper','front','rear']:
        x,y,x1,y1=REGIONS[rotor]
        for suffix in ['cutouts','lights']:
            add(f'factory-left-{rotor}-{suffix}.png',x1-x,y1-y,x,y,True,p['lights'] if suffix=='lights' else None)
    if p['opening_glow']:
        x,y,x1,y1=REGIONS['opening-glow'];add('factory-left-opening-glow.png',x1-x,y1-y,x,y,True,p['opening_glow'])
    return out


if __name__=='__main__':
    build()
