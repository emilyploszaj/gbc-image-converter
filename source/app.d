import imaged.image;
import std.algorithm;
import std.conv;
import std.stdio;

void main(){
	IMGError imgError = IMGError();
	Image img = load("image.png", imgError);
	int[] colors = [
		0, 80, 160, 255
	];
	int width = img.width;
	int height = img.height;
	width /= 8;
	height /= 8;
	int[16][] tiles;
	int[][] tilemap;
	tilemap.length = height;
	for(int h = 0; h < height; h++){
		tilemap[h].length = width;
		for(int w = 0; w < width; w++){
			int[16] tile;
			for(int i = 0; i < 8; i++){
				for(int j = 0; j < 8; j++){
					Pixel p = img.getPixel(w * 8 + i, h * 8 + j);
					int c = p.r;
					if(c != p.g || c != p.b){
						writeln("invalid color (not grayscale)");
						return;
					}
					c = colors.countUntil(c).to!int;
					if(c == -1){
						writeln("invalid color");
						return;
					}
					tile[j * 2] |= (1 & c) << (7 - i);
					tile[j * 2 + 1] |= ((2 & c) << (7 - i)) >> 1;
				}
			}
			int i = tiles.countUntil(tile).to!int;
			if(i < 0){
				tilemap[h][w] = tiles.length.to!int;
				tiles ~= tile;
			}else tilemap[h][w] = i;
		}
	}
	import std.string;
	import std.array;
	tiles.map!(l => l.array.map!(t => "0x" ~ (t < 16 ? "0" : "") ~ t.to!string(16) ~ ", ").join("").array).array.each!writeln;
	writeln(tilemap.map!(l => l.map!(t => t.to!string ~ ", ").join("").array).join("\n").array);
}
