#!/usr/bin/env python3
"""Build fixed cyborg-factory hardware plus its original fill/color/drain cycle.

Requires Pillow. Reuses the accepted AI master and original shadow; does not
write preview media. Layer coordinates match the factory3 prototype contract.
"""
from pathlib import Path
from PIL import Image, ImageDraw, ImageChops

ROOT = Path(__file__).resolve().parents[2]
OUT = ROOT / 'graphics/entity'
MASTER = ROOT / 'docs/artwork/ai-redraw-0.5.1/fabrik-bio-icon-source.png'
CROP = (75, 61, 1179, 1182)
SIZE = (188, 216)
LIQUID_CROP = (132, 575, 1124, 890)
# Original sixteen states: fill, process green to pink, drain. Values describe
# visible fill depth; RGB means were sampled from the original left vat.
LEVELS = [0, .035, .23, .60, .90, 1, 1, 1, 1, 1, 1, 1, 1, .82, .28, .015]
COLORS = [(33,111,22)] * 7 + [(44,109,29), (73,102,44), (110,89,62),
          (141,74,78), (167,66,92), (176,63,98), (154,54,82), (103,39,54), (111,70,76)]


def build():
    master = Image.open(MASTER).convert('RGBA')
    body = master.copy()
    openings = []
    textures = []
    for center in [355, 890]:
        opening = Image.new('L', master.size)
        ImageDraw.Draw(opening).ellipse((center - 218, 580, center + 218, 888), fill=255)
        surface = Image.new('L', master.size)
        ImageDraw.Draw(surface).ellipse((center - 215, 618, center + 215, 888), fill=255)
        texture = master.copy()
        texture.putalpha(ImageChops.multiply(texture.getchannel('A'), surface))
        textures.append(texture.crop((center - 218, 575, center + 218, 890)))
        openings.append(opening)
        # Remove the filled green surface completely; keep the shaded steel rim.
        for y in range(580, 889):
            for x in range(center - 218, center + 219):
                r, g, b, a = master.getpixel((x, y))
                if opening.getpixel((x, y)) and g > r * 1.15 and g > b * 1.15:
                    shade = 8 + round(g * .035)
                    body.putpixel((x, y), (shade, shade + 1, shade, a))
        # The original drained vats expose two small wall ports. Their upper
        # portions remain above the surface; rising liquid hides the lower ones.
        draw = ImageDraw.Draw(body)
        for y, radius in [(620, 17), (724, 15)]:
            draw.ellipse((center-radius, y-22, center+radius, y+22), fill=(74,76,72,255))
            draw.arc((center-radius, y-22, center+radius, y+22), 180, 300, fill=(141,144,134,255), width=4)
            draw.ellipse((center-radius+6, y-15, center+radius-6, y+14), fill=(10,12,10,255))
    base = Image.new('RGBA', (256,256))
    base.paste(body.crop(CROP).resize(SIZE, Image.Resampling.LANCZOS), (2,16))
    base.save(OUT / 'fab-bio-base.png')
    old = Image.open(OUT / 'fab-bio-sheet.png').convert('RGBA').crop((0,0,128,128))
    shadow = Image.new('RGBA', old.size)
    shadow.putdata([(0,0,0,a) if r == g == b == 0 else (0,0,0,0) for r,g,b,a in old.getdata()])
    shadow.resize((256,256), Image.Resampling.LANCZOS).save(OUT / 'fab-bio-shadow.png')
    sheet = Image.new('RGBA', (169 * 16,61))
    for n, (level, color) in enumerate(zip(LEVELS, COLORS)):
        frame = Image.new('RGBA', master.size)
        if level:
            for center, original, opening in zip([355,890], textures, openings):
                liquid = original.copy()
                liquid.putdata([(*[min(255, round(g * channel / 111)) for channel in color], a)
                                for r,g,b,a in original.getdata()])
                layer = Image.new('RGBA', master.size)
                layer.paste(liquid, (center-218, 575 + round((1-level)*270)))
                layer.putalpha(ImageChops.multiply(layer.getchannel('A'), opening))
                frame.alpha_composite(layer)
        sheet.paste(frame.crop(LIQUID_CROP).resize((169,61), Image.Resampling.LANCZOS), (169*n,0))
    sheet.save(OUT / 'fab-bio-liquid.png')


if __name__ == '__main__':
    build()
