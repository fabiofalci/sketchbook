class Bubble {
  int[] array;
  int index;
  int length;
  boolean swapped;
  public Bubble(int[] array) {
    this.array = array;
    index = 0;
    length = array.length;
    swapped = false;
  }

  void sort() {
    if (array[index] > array[index + 1]) {
      int swap = array[index]; 
      array[index] = array[index + 1];
      array[index + 1] = swap;
      swapped = true;
    }

    index++;

    if (index + 1 == length) {
      length--;
      if (!swapped) {
        noLoop();
      }

      index = 0;
      swapped = false;
    }
  }

  void drawArray(int leftMargin) {
    for (int i = 0; i < array.length; i++) {
      int elem = BOTTOM_MARGIN;
      color c = color(0);
      if (i == index) {
        c = color(255, 0, 0);
      }
      for (int j = 0; j < array[i]; j++) {
        int column = leftMargin + i + (--elem) * screen.width;
        screen.pixels[column] = c;
      }
    }
  }
}
