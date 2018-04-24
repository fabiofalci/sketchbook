

int x;
int length;
int JUMP = 40;

boolean up;
boolean middle;
boolean down;
boolean normal;

void setup() {
    size(900, 700);
    background(0);

    x = 0;
    length = 300;
    up = false;
    middle = false;
    down = false;
    normal = false;
}

void draw() {
    stroke(255);

    int y = height / 2;

    if (frameCount % 40 == 0) {
        up = true;
    }

    if (up) {
        line(x - 1, y, x, y - JUMP);
    } else if (middle) {
        line(x - 1, y - JUMP, x, y);
    } else if (down) {
        line(x - 1, y, x, y + JUMP / 2);
    } else if (down) {
        line(x - 1, y + JUMP / 2, x, y);
    } else {
        point(x,  y);
    }

    stroke(0);
    int lastPosition = x - length;
    if (lastPosition < 0) {
        lastPosition += width;
    }
    point(lastPosition, y);

    x += 1;
    if (x >= width) {
        x = 0;
    }
    if (up) {
        up = false;
        middle = true;
    } else if (middle) {
        middle = false;
        down = true;
    } else if (down) {
        down = false;
        normal = true;
    } else if (normal) {
        normal = false;
    }
}