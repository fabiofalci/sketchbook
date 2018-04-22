
int[][] grid;
int x;
int y;
int direction;

int D_UP = 0;
int D_RIGHT = 1;
int D_DOWN = 2;
int D_LEFT = 3;

int WHITE = 0;
int BLACK = 1;

PImage ant;

PFont f; 
int steps;
int stepsPerFrame;

void setup() {
  size(900, 700); 

  grid = new int[width][height];
  x = width / 2;
  y = height / 2;
  direction = D_UP;

  ant = createImage(width, height, RGB);
  ant.loadPixels();
  for (int i = 0; i < ant.pixels.length; i++) {
    ant.pixels[i] = color(255);
  }
  ant.updatePixels();

  f = createFont("Arial", 20, true);
  steps = 0;
  stepsPerFrame = 1200;
}

void moveRight() {
  direction++;
  if (direction > 3) {
    direction = D_UP;
  }
}

void moveLeft() {
  direction--;
  if (direction < 0) {
    direction = D_LEFT;
  }
}

void moveForward() {
  if (direction == D_UP) {
    y--;
  } else if (direction == D_RIGHT) {
    x++;
  } else if (direction == D_DOWN) {
    y++;
  } else if (direction == D_LEFT) {
    x--;
  }

  if (x > width - 1) {
    x = 0;
  } else if (x < 0) {
    x = width - 1;
  }

  if (y > height - 1) {
    y = 0;
  } else if (y < 0) {
    y = height - 1;
  }
}

void move() {
  int state = grid[x][y];
  if (state == WHITE) {
    grid[x][y] = BLACK;
    moveRight();
  } else if (state == BLACK) {
    grid[x][y] = WHITE;
    moveLeft();
  }

  color col = color(255);
  if (grid[x][y] == 1) {
    col = color(0);
  }
  int pix = x + y * ant.width;
  ant.pixels[pix] = col;

  moveForward();
}

void draw() {
  background(255);

  ant.loadPixels();


  for (int i = 0; i < stepsPerFrame; i++) {
    move();
  }
  
  ant.updatePixels();
  image(ant,0,0);

  //loadPixels();
  //for (int i = 0; i < width; i++) {
  //  for (int j = 0; j < height; j++) {
  //    int pix = i + j * width;
  //    if (grid[i][j] == WHITE) {
  //      pixels[pix] = color(255);
  //    } else { // black
  //      pixels[pix] = color(0);
  //    }
  //  }
  //}
  //updatePixels();

  fill(0);
  rect(5, 5, 120, 20);

  steps += stepsPerFrame;
  textFont(f, 16);                  
  fill(255);                         
  text("Steps " + steps, 10, 20);
  
  saveFrame("frames/#####.tif");
}
