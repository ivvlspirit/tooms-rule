/*

Created by Ivan Vlahov
u/spiritcs

If you want to share anything made using this program,
please give me credit by linking my Youtube channel
and the video link below:

https://www.youtube.com/user/ivanvlahov922
https://youtu.be/d8HiUGOvYXM

*/


// the number of rows and columns
int rows = 1080;
int cols = 1920;

int rectWidth, rectHeight;

int grid[][] = new int[cols][rows];
int newGrid[][] = new int[cols][rows];

// set to true if you want the values of the top and the right border to change randomly,
// set to false if you want them to stay the same whole time
boolean generateMore = true;

void setup() {
	size(1920, 1080);

	frameRate(60);

	rectWidth = width/cols;
	rectHeight = height/rows;

	for(int i=0; i<cols; i++){
		for(int j=0; j<rows; j++){
			grid[i][j] = 2*floor(random(2))-1;
		}
	}

	noStroke();
}

void draw() {

	for(int i=0; i<cols; i++){
		for(int j=0; j<rows; j++){
			if(grid[i][j]==1) fill(#9b5094);
			else fill(#fff4ec);
			rect(rectWidth*i, rectHeight*j, rectWidth, rectHeight);
		}
	}

	for(int i=0; i<cols; i++){
		for(int j=0; j<rows; j++){
			if((i==cols-1 || j==0) && generateMore) newGrid[i][j] = 2*floor(random(2))-1;
			else if((i==cols-1 || j==0) && !generateMore) newGrid[i][j] = grid[i][j];
			else newGrid[i][j] = (grid[i][j]+grid[i+1][j]+grid[i][j-1])>0 ? 1 : -1;
		}
	}

	for(int i=0; i<cols; i++){
		arrayCopy(newGrid[i], grid[i]);
	}
}

// pressing the spacebar will toggle the top and the right border randomization
void keyPressed() {
	if(key==' ') generateMore ^= true;
}