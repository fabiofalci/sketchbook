class Quick {
  int[] array;
  int index;

  public Quick(int[] array) {
    this.array = array;
    index = 0;
  }

  void sort() {
    
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
