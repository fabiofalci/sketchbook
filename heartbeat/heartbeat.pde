

int x;
int length;
int y;

void setup() {
    size(900, 700);

    x = 10;
    length = 300;
    y = height / 2;
}

void draw() {
    background(0);

    stroke(255);

    boolean outOfBounds = x + length > width;

    line(x, y, outOfBounds ? width : x + length, y);

    if (outOfBounds) {
        line(0, y, x + length - width, y);
        ellipse(x + length - width, y, 5, 5);
    } else {
        ellipse(x + length, y, 5, 5);
    }


    x += 3;

    if (x >= width) {
        x = 0;
    }
}