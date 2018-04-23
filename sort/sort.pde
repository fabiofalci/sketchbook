
Bubble bubble;

Quick quick;

int BOTTOM_MARGIN = 600;
int LEFT_MARGIN = 30;
int ARRAY_LENGTH = 300;

PImage screen;

void setup() {
  size(900, 700);
  //frameRate(10);

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
  bubble.sort();
  quick.sort();

  screen.loadPixels();
  clearScreen();
  bubble.drawArray(LEFT_MARGIN);
  quick.drawArray(LEFT_MARGIN + ARRAY_LENGTH + LEFT_MARGIN * 2);
  screen.updatePixels();
  image(screen, 0, 0);

  if (bubble.done && quick.done) {
    noLoop();
  }
}

void clearScreen() {
  for (int i = 0; i < screen.pixels.length; i++) {
    screen.pixels[i] = color(255);
  }
}
