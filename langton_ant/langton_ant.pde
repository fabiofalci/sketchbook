
int[][] grid;
Ant[] ants;

int D_UP = 0;
int D_RIGHT = 1;
int D_DOWN = 2;
int D_LEFT = 3;

int WHITE = 0;
int BLACK = 1;

PImage image;

PFont f; 
int steps;
int stepsPerFrame;

void setup() {
  size(900, 700); 
  //fullScreen();

  grid = new int[width][height];

  ants = new Ant[2];
  for (int i = 0; i < ants.length; i++) {
    ants[i] = new Ant();
  }

  image = createImage(width, height, RGB);
  image.loadPixels();
  for (int i = 0; i < image.pixels.length; i++) {
    image.pixels[i] = color(255);
  }
  image.updatePixels();

  f = createFont("Arial", 20, true);
  steps = 0;
  stepsPerFrame = 1200;
}

void draw() {
  background(255);

  image.loadPixels();

  for (int i = 0; i < stepsPerFrame; i++) {
    for (Ant ant : ants) {
      ant.move();
    }

    //if (ant2.samePosition(ant1)) {
    // noLoop(); 
    //}
  }

  image.updatePixels();
  image(image, 0, 0);

  fill(0);
  rect(5, 5, 120, 20);

  steps += stepsPerFrame;
  textFont(f, 16);                  
  fill(255);                         
  text("Steps " + steps, 10, 20);

  //saveFrame("frames/#####.tif");
}
