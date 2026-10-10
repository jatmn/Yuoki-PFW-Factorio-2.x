#!/usr/bin/env python3
"""Build vehicle-factory layers from the accepted AI master (requires Pillow).

The original sheet supplies motion and shadow. Fixed shaded drums carry paired
projected blue cutouts; the copper housing occludes the rear drum. No previews.
"""
import math
from pathlib import Path
from PIL import Image, ImageDraw, ImageChops

ROOT = Path(__file__).resolve().parents[2]
OUT = ROOT / 'graphics/entity'
MASTER = ROOT / 'docs/artwork/ai-redraw-0.5.1/fabrik-trucks-icon-source.png'
CROP = (114, 80, 1107, 1141)
SIZE = (200, 216)
REGIONS = {'upper': (44, 61, 93, 99), 'front': (38, 168, 101, 223),
           'rear': (42, 15, 99, 64)}
FRAMES = 16


def placed(image):
    canvas = Image.new('RGBA', (256, 256))
    canvas.paste(image.crop(CROP).resize(SIZE, Image.Resampling.LANCZOS), (2, 16))
    return canvas


def build():
    master = Image.open(MASTER).convert('RGBA')
    clean = master.copy()
    # Continue the metal across the complete axial recess, including its lip.
    for x0, y0, x1, y1 in [(427, 84, 465, 113), (421, 860, 483, 947),
                           (421, 1025, 483, 1073)]:
        for y in range(y0, y1):
            left, right = master.getpixel((x0 - 1, y)), master.getpixel((x1, y))
            for x in range(x0, x1):
                t = (x - x0 + 1) / (x1 - x0 + 1)
                clean.putpixel((x, y), tuple(round(a * (1 - t) + b * t) for a, b in zip(left, right)))
    for box in [(424, 317, 472, 353), (518, 380, 552, 416),
                (424, 448, 472, 482), (343, 378, 381, 416)]:
        for y in range(box[1], box[3]):
            for x in range(box[0], box[2]):
                dx, dy = (x - 448) / 87, (y - 397) / 65
                c = math.sqrt(0.5)
                clean.putpixel((x, y), master.getpixel((round(448 + 87 * (dx - dy) * c),
                                                       round(397 + 65 * (dx + dy) * c))))
    placed(clean).save(OUT / 'fab-trucks-base.png')
    old = Image.open(OUT / 'fab-trucks-sheet.png').convert('RGBA').crop((0, 0, 128, 128))
    shadow = Image.new('RGBA', old.size)
    shadow.putdata([(0, 0, 0, a) if r == g == b == 0 else (0, 0, 0, 0) for r, g, b, a in old.getdata()])
    shadow.resize((256, 256), Image.Resampling.LANCZOS).save(OUT / 'fab-trucks-shadow.png')

    for name, box in REGIONS.items():
        width, height = box[2] - box[0], box[3] - box[1]
        sheet = Image.new('RGBA', (width * FRAMES, height))
        visible = Image.new('L', master.size, 255)
        if name == 'rear':
            visible = Image.new('L', master.size)
            # Exposed strip behind the copper ring; never paint over the ring,
            # left tower or the foreground bracket. Both indicators share it.
            ImageDraw.Draw(visible).polygon([
                (429, 86), (461, 89), (558, 139), (590, 177), (590, 306),
                (560, 306), (560, 253), (574, 216), (568, 175),
                (549, 145), (506, 119), (464, 111), (429, 111)], fill=255)

        def point(angle, radius=1, depth=0):
            if name == 'upper':
                return (448 + 87 * radius * math.sin(angle), 397 - 65 * radius * math.cos(angle))
            center_y = 993 if name == 'front' else 245
            return (453 + 108 * radius * math.sin(angle), center_y - 58 * radius * math.cos(angle) - depth)

        for n in range(FRAMES):
            frame = Image.new('RGBA', master.size)
            draw = ImageDraw.Draw(frame)
            count = 4 if name == 'upper' else 2
            for marker in range(count):
                angle = marker * math.tau / count + n * math.tau / FRAMES * (-1 if name == 'upper' else 1)
                angle = (angle + math.pi) % math.tau - math.pi
                if name != 'upper':
                    extent = 66 if name == 'front' else 85
                    for half_width, depth, color, lip in [
                        (0.17, extent + 5, (16, 20, 28, 255), True),
                        (0.11, extent, (22, 120, 252, 255), False),
                    ]:
                        a, b = max(angle - half_width, -math.pi / 2), min(angle + half_width, math.pi / 2)
                        if a < b:
                            polygon = [point(a, depth=depth), point(b, depth=depth), point(b), point(a)]
                            draw.polygon(polygon, fill=color)
                            if lip:
                                draw.line(polygon + polygon[:1], fill=(108, 114, 125, 255), width=3)
                for half_width, inner, outer, color, lip in [
                    (0.20, 0.83, 1.13, (16, 20, 28, 255), True),
                    (0.14, 0.90, 1.04, (32, 151, 255, 255), False),
                ]:
                    a, b = angle - half_width, angle + half_width
                    polygon = [point(a, inner), point(b, inner), point(b, outer), point(a, outer)]
                    draw.polygon(polygon, fill=color)
                    if lip:
                        draw.line(polygon + polygon[:1], fill=(108, 114, 125, 255), width=3)
                    else:
                        draw.line([point(a, 0.94), point(b, 0.94)], fill=(149, 233, 255, 255), width=2)
            frame.putalpha(ImageChops.multiply(frame.getchannel('A'), visible))
            sheet.paste(placed(frame).crop(box), (width * n, 0))
        sheet.save(OUT / ('fab-trucks-' + name + '.png'))


if __name__ == '__main__':
    build()
