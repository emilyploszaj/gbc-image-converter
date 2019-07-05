# gbc-image-converter
This is a small and simple program to generate some larger sets of tile data from an image for use on the Game Boy or Game Boy Color.

## Usage
This program can be easily built with dub and used by placing a 200x180 pixel file called "image.png" in the same folder as the executable. This file should only contain the 4 different RGB color values #000000, #505050, #A0A0A0, and #FFFFFF. It is important to stay bellow the 256 Game Boy tile limit during the design phase. An 8x8 tile grid in your image editing program of choice is recommended. Console output consists of tile data followed by tilemap data. Both have numbers prefixed by 0x for easy copy paste into C applications.

## Development
gbc-image-converter is "finished", no updates are planned as it works for what it was intended.