#!/usr/bin/env python3
"""Build ammunition-factory layers from the accepted AI master (requires Pillow).

Run from any directory. Original animation supplies the rear marker's trajectory
and occlusion, and the ground shadow. No preview media is written to the repo.
"""
import math
from pathlib import Path
from PIL import Image, ImageDraw

ROOT = Path(__file__).resolve().parents[2]
OUT = ROOT / 'graphics/entity'
MASTER = ROOT / 'docs/artwork/ai-redraw-0.5.1/fabrik-ammo-icon-source.png'
CROP = (67, 63, 1159, 1196)
PLACEMENT = (2, 16)
SIZE = (192, 216)
FRAMES = 16


def build():
    master = Image.open(MASTER).convert('RGBA')
    old = Image.open(OUT / 'fab-ammo-sheet.png').convert('RGBA')
    clean = master.copy()
    # Remove the fixed rear orange marker. Adjacent metal continues its rim;
    # the original trajectory below supplies the moving marker instead.
    clean.paste(master.crop((648, 90, 690, 143)).transpose(Image.Transpose.FLIP_LEFT_RIGHT), (602, 90))
    # Keep the front drum's geometry and lighting stationary. Replace its two
    # orange strips with adjacent metal before drawing projected moving strips.
    for box in [(609, 920, 644, 991), (611, 1095, 644, 1135)]:
        x0, y0, x1, y1 = box
        clean.paste(master.crop((x1 + 2, y0, x1 + 2 + x1 - x0, y1)), (x0, y0))
    # Remove the four fixed upper markers by sampling neighboring metal at
    # the same projected radius. The face, hole and lighting never rotate.
    for box in [(600, 333, 642, 364), (704, 397, 739, 440),
                (601, 472, 642, 500), (504, 397, 541, 440)]:
        for y in range(box[1], box[3]):
            for x in range(box[0], box[2]):
                dx, dy = (x - 620) / 100, (y - 417) / 68
                c, sn = math.cos(math.pi / 4), math.sin(math.pi / 4)
                sample = (round(620 + 100 * (dx * c - dy * sn)),
                          round(417 + 68 * (dx * sn + dy * c)))
                clean.putpixel((x, y), master.getpixel(sample))
    body = Image.new('RGBA', (256, 256))
    body.paste(clean.crop(CROP).resize(SIZE, Image.Resampling.LANCZOS), PLACEMENT)
    body.save(OUT / 'fab-ammo-base.png')
    shadow = Image.new('RGBA', (128, 128))
    shadow.putdata([(0, 0, 0, a) if r == g == b == 0 else (0, 0, 0, 0)
                    for r, g, b, a in old.crop((0, 0, 128, 128)).getdata()])
    shadow.resize((256, 256), Image.Resampling.LANCZOS).save(OUT / 'fab-ammo-shadow.png')
    upper = Image.new('RGBA', (44 * FRAMES, 35))
    for n in range(FRAMES):
        frame = Image.new('RGBA', (250, 182))
        draw = ImageDraw.Draw(frame)
        def upper_point(angle, radius):
            return (124 + 100 * radius * math.sin(angle),
                    94 - 68 * radius * math.cos(angle))
        for marker in range(4):
            angle = marker * math.pi / 2 - n * math.tau / FRAMES
            a, b = angle - 0.15, angle + 0.15
            draw.polygon([upper_point(a, 0.87), upper_point(b, 0.87),
                          upper_point(b, 1.14), upper_point(a, 1.14)], fill=(249, 145, 12, 255))
            draw.line([upper_point(a, 0.9), upper_point(b, 0.9)],
                      fill=(255, 225, 116, 255), width=3)
        upper.paste(frame.resize((44, 35), Image.Resampling.LANCZOS), (44 * n, 0))
    upper.save(OUT / 'fab-ammo-upper.png')
    # Front cylinder: project markings onto its curved side and fixed front
    # face. Rotating the whole shaded crop also rotates depth and bends the drum.
    front = Image.new('RGBA', (44 * FRAMES, 41))
    def point(angle, radius=1, depth=0):
        return (127 + 114 * radius * math.sin(angle),
                135 - 68 * radius * math.cos(angle) - depth)
    for n in range(FRAMES):
        frame = Image.new('RGBA', (252, 215))
        draw = ImageDraw.Draw(frame)
        for marker, angle in enumerate([n * math.tau / FRAMES, n * math.tau / FRAMES + math.pi]):
            a, b = angle - 0.115, angle + 0.115
            depth = 60 if marker == 0 else 14
            if math.cos(angle) > 0:
                draw.polygon([point(a, depth=depth), point(b, depth=depth),
                              point(b), point(a)], fill=(233, 126, 8, 255))
                draw.line([point(a, depth=depth - 2), point(b, depth=depth - 2)], fill=(255, 223, 103, 255), width=3)
            draw.polygon([point(a, 0.90), point(b, 0.90),
                          point(b, 1.08), point(a, 1.08)], fill=(255, 163, 15, 255))
            draw.line([point(a, 0.94), point(b, 0.94)], fill=(255, 225, 119, 255), width=2)
        front.paste(frame.resize((44, 41), Image.Resampling.LANCZOS), (44 * n, 0))
    front.save(OUT / 'fab-ammo-front.png')
    rear = Image.new('RGBA', (44 * FRAMES, 32))
    for n in range(FRAMES):
        crop = old.crop((128 * n + 43, 7, 128 * n + 65, 23))
        mask = Image.new('L', crop.size)
        mask.putdata([a if r > 140 and g > 65 and b < 140 and r > b * 1.6 else 0
                      for r, g, b, a in crop.getdata()])
        box = mask.getbbox()
        if box:
            frame = Image.new('RGBA', crop.size)
            marker = master.crop((608, 96, 638, 129)).resize(
                (box[2] - box[0], box[3] - box[1]), Image.Resampling.LANCZOS)
            frame.paste(marker, box[:2])
            frame.putalpha(mask)
            rear.paste(frame.resize((44, 32), Image.Resampling.LANCZOS), (44 * n, 0))
    rear.save(OUT / 'fab-ammo-rear.png')


if __name__ == '__main__':
    build()
