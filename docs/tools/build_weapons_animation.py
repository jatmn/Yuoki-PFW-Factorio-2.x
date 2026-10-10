#!/usr/bin/env python3
"""Build weapons-factory layers using the accepted ammunition reference (Pillow).

Fixed shaded geometry; projected green cutouts move with their lights. The
original workbench stays stationary. Run from any directory; no previews saved.
"""
import math
from pathlib import Path
from PIL import Image, ImageDraw

ROOT = Path(__file__).resolve().parents[2]
OUT = ROOT / 'graphics/entity'
MASTER = ROOT / 'docs/artwork/ai-redraw-0.5.1/fabrik-weapons-icon-source.png'
CROP = (99, 58, 1101, 1166)
SIZE = (196, 216)
FRAMES = 16


def build():
    master = Image.open(MASTER).convert('RGBA')
    clean = master.copy()
    # Remove the whole front cutouts, including their dark mounts. Continue
    # the curved metal across each narrow axial strip, without shifted rim copies.
    for x0, y0, x1, y1 in [(396, 865, 444, 952), (384, 1037, 465, 1086)]:
        for y in range(y0, y1):
            left, right = master.getpixel((x0 - 1, y)), master.getpixel((x1, y))
            for x in range(x0, x1):
                t = (x - x0 + 1) / (x1 - x0 + 1)
                clean.putpixel((x, y), tuple(round(a * (1 - t) + b * t) for a, b in zip(left, right)))
    # Sample unmarked metal halfway between the upper rotor's four markers.
    # Copying too small an angle can accidentally copy another green edge.
    for box in [(391, 317, 439, 343), (486, 375, 519, 412),
                (391, 447, 439, 471), (312, 375, 343, 412)]:
        for y in range(box[1], box[3]):
            for x in range(box[0], box[2]):
                dx, dy = (x - 415) / 89, (y - 394) / 64
                c = math.sqrt(0.5)
                clean.putpixel((x, y), master.getpixel((round(415 + 89 * (dx - dy) * c),
                                                       round(394 + 64 * (dx + dy) * c))))
    body = Image.new('RGBA', (256, 256))
    body.paste(clean.crop(CROP).resize(SIZE, Image.Resampling.LANCZOS), (2, 16))
    body.save(OUT / 'fab-weapons-base.png')
    old = Image.open(OUT / 'fab-weapons-sheet.png').convert('RGBA').crop((0, 0, 128, 128))
    shadow = Image.new('RGBA', old.size)
    shadow.putdata([(0, 0, 0, a) if r == g == b == 0 else (0, 0, 0, 0) for r, g, b, a in old.getdata()])
    shadow.resize((256, 256), Image.Resampling.LANCZOS).save(OUT / 'fab-weapons-shadow.png')

    # Source crops map to fixed world positions; only cutouts are animated.
    for name, width, height in [('upper', 44, 32), ('front', 46, 43)]:
        source_size = (225, 166) if name == 'upper' else (237, 222)
        sheet = Image.new('RGBA', (width * FRAMES, height))
        def point(angle, radius=1, depth=0):
            if name == 'upper':
                return (112 + 89 * radius * math.sin(angle), 84 - 64 * radius * math.cos(angle))
            return (117 + 104 * radius * math.sin(angle), 136 - 57 * radius * math.cos(angle) - depth)
        for n in range(FRAMES):
            frame = Image.new('RGBA', source_size)
            draw = ImageDraw.Draw(frame)
            count = 4 if name == 'upper' else 2
            for marker in range(count):
                angle = marker * math.tau / count + n * math.tau / FRAMES * (-1 if name == 'upper' else 1)
                angle = (angle + math.pi) % math.tau - math.pi
                if name == 'front':
                    for half_width, depth, color, lip in [
                        (0.16, 65, (16, 20, 18, 255), True),
                        (0.10, 60, (72, 228, 13, 255), False),
                    ]:
                        a, b = max(angle - half_width, -math.pi / 2), min(angle + half_width, math.pi / 2)
                        if a < b:
                            polygon = [point(a, depth=depth), point(b, depth=depth), point(b), point(a)]
                            draw.polygon(polygon, fill=color)
                            if lip:
                                draw.line(polygon + polygon[:1], fill=(100, 108, 101, 255), width=3)
                for half_width, inner, outer, color, lip in [
                    (0.20, 0.83, 1.13, (16, 20, 18, 255), True),
                    (0.14, 0.90, 1.04, (96, 250, 17, 255), False),
                ]:
                    a, b = angle - half_width, angle + half_width
                    polygon = [point(a, inner), point(b, inner), point(b, outer), point(a, outer)]
                    draw.polygon(polygon, fill=color)
                    if lip:
                        draw.line(polygon + polygon[:1], fill=(100, 108, 101, 255), width=3)
                    else:
                        draw.line([point(a, 0.94), point(b, 0.94)], fill=(179, 255, 121, 255), width=2)
            sheet.paste(frame.resize((width, height), Image.Resampling.LANCZOS), (width * n, 0))
        sheet.save(OUT / ('fab-weapons-' + name + '.png'))


if __name__ == '__main__':
    build()
