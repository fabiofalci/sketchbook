
Bubble bubble;

Quick quick;

int BOTTOM_MARGIN = 600;
int LEFT_MARGIN = 30;
int ARRAY_LENGTH = 200;

PFont f;

PImage screen;

void setup() {
  size(900, 700);
  frameRate(120);
  f = createFont("Arial", 20, true);

  int[] array = new int[ARRAY_LENGTH];
  for (int i=0; i < array.length; i++) {
    array[i] = int(random(500));
  }

  int[] bubbleArray = new int[array.length];
  System.arraycopy(array, 0, bubbleArray, 0, array.length);
  int[] quickArray = new int[array.length];
  System.arraycopy( array, 0, quickArray, 0, array.length );
  bubble = new Bubble(bubbleArray);
  quick = new Quick(quickArray);

  screen = createImage(width, height, RGB);

  screen.loadPixels();
  clearScreen();
  bubble.drawArray(LEFT_MARGIN);
  quick.drawArray(LEFT_MARGIN + ARRAY_LENGTH + LEFT_MARGIN * 2);
  screen.updatePixels();
}

void draw() {
  if (!bubble.done) bubble.sort();
  if (!quick.done) quick.sort();

  screen.loadPixels();
  clearScreen();
  bubble.drawArray(LEFT_MARGIN);
  quick.drawArray(LEFT_MARGIN + ARRAY_LENGTH + LEFT_MARGIN * 2);
  screen.updatePixels();
  image(screen, 0, 0);

  if (bubble.done && quick.done) {
    noLoop();
  }
  //println(frameRate);


  fill(0);
  rect(5, 5, 120, 20);
  textFont(f, 16);
  fill(255);
  text("Steps " + frameCount, 10, 20);
}

void clearScreen() {
  for (int i = 0; i < screen.pixels.length; i++) {
    screen.pixels[i] = color(255);
  }
}

float scaleColor(float value) {
  return (value / 500) * (180 - 1) + 1;
}
