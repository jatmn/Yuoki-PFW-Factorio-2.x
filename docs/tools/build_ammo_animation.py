#!/usr/bin/env python3
"""Build ammunition-factory layers from the accepted AI master (requires Pillow).

Run from any directory. Original animation supplies the motion reference and ground shadow.
Both drums use paired projected cutouts; the rear housing masks the hidden portions. No preview media is written to the repo.
"""
import math
from pathlib import Path
from PIL import Image, ImageDraw, ImageChops

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
    # Reconstruct continuous metal beneath the complete rear/front cutouts,
    # not just their orange centers. Interpolate across the narrow axial strip
    # instead of copying an offset piece of curved rim (which leaves a notch).
    for box in [(594, 85, 651, 158), (600, 912, 650, 998), (604, 1091, 650, 1144)]:
        x0, y0, x1, y1 = box
        for y in range(y0, y1):
            left = master.getpixel((x0 - 1, y))
            right = master.getpixel((x1, y))
            for x in range(x0, x1):
                t = (x - x0 + 1) / (x1 - x0 + 1)
                clean.putpixel((x, y), tuple(round(a * (1 - t) + b * t)
                                            for a, b in zip(left, right)))
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
    # Both drums carry the same pair of opposing cutouts. Build the whole
    # recessed assembly in one projection, then occlude the rear with its housing.
    for name, center_y, depth in [('front', 135, 60), ('rear', 129, 45)]:
        source_height = 215 if name == 'front' else 216
        sheet = Image.new('RGBA', (44 * FRAMES, 41))
        visible = Image.new('L', (252, source_height), 255)
        if name == 'rear':
            visible = Image.new('L', (252, source_height))
            # Boundary of the exposed rear drum in the accepted master; the
            # left tower and central housing cover the rest of the rotation.
            outline = [(576, 84), (697, 84), (756, 150), (756, 280),
                       (705, 251), (654, 239), (581, 237), (568, 212),
                       (554, 189), (538, 166), (556, 145), (576, 126)]
            ImageDraw.Draw(visible).polygon([(x - 500, y - 84) for x, y in outline], fill=255)

        def point(angle, radius=1, axial_depth=0):
            return (127 + 114 * radius * math.sin(angle),
                    center_y - 68 * radius * math.cos(angle) - axial_depth)

        for n in range(FRAMES):
            frame = Image.new('RGBA', (252, source_height))
            draw = ImageDraw.Draw(frame)
            for marker in range(2):
                angle = n * math.tau / FRAMES + marker * math.pi
                angle = (angle + math.pi) % math.tau - math.pi
                # Clip the side strip at the cylinder's visible horizon, so it
                # narrows continuously instead of popping off at a half-turn.
                for half_width, extent, color, lip in [
                    (0.165, depth + 5, (18, 20, 24, 255), True),
                    (0.115, depth, (233, 126, 8, 255), False),
                ]:
                    a = max(angle - half_width, -math.pi / 2)
                    b = min(angle + half_width, math.pi / 2)
                    if a < b:
                        polygon = [point(a, axial_depth=extent), point(b, axial_depth=extent),
                                   point(b), point(a)]
                        draw.polygon(polygon, fill=color)
                        if lip:
                            draw.line(polygon + polygon[:1], fill=(106, 109, 115, 255), width=3)
                for half_width, inner, outer, color, lip in [
                    (0.165, 0.84, 1.07, (18, 20, 24, 255), True),
                    (0.115, 0.90, 1.02, (255, 163, 15, 255), False),
                ]:
                    a, b = angle - half_width, angle + half_width
                    polygon = [point(a, inner), point(b, inner), point(b, outer), point(a, outer)]
                    draw.polygon(polygon, fill=color)
                    if lip:
                        draw.line(polygon + polygon[:1], fill=(106, 109, 115, 255), width=3)
                    else:
                        draw.line([point(a, 0.94), point(b, 0.94)], fill=(255, 225, 119, 255), width=2)
            frame.putalpha(ImageChops.multiply(frame.getchannel('A'), visible))
            sheet.paste(frame.resize((44, 41), Image.Resampling.LANCZOS), (44 * n, 0))
        sheet.save(OUT / ('fab-ammo-' + name + '.png'))


if __name__ == '__main__':
    build()
