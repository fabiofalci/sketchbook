class Ant {
  int x;
  int y;
  int direction;

  public Ant() {
    x = int(random(width));
    y = int(random(height));
    direction = int(random(4));
  }

  boolean samePosition(Ant otherAnt) {
     return x == otherAnt.x && y == otherAnt.y; 
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
    int pix = x + y * image.width;
    image.pixels[pix] = col;

    moveForward();
  }
}
