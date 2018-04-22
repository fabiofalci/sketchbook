class Ant {
  int x;
  int y;
  int direction;

  public Ant() {
    x = int(random(width));
    y = int(random(height));
    direction = int(random(4));
  }
}
