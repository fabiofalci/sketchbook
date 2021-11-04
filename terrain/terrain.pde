int SQUARE_SIZE = 70;
int BORDER = 10;
int count = 0;
boolean countUp = true;


void setup() {
//    size(900, 700);
    size(900, 700, P3D);
}

void draw() {
    background(255);
    noFill();
    strokeWeight(2);
//    drawVariousRect();
//    drawOneRectAndLines2D();
    drawOneRectAndLines3D();
}

void drawOneRectAndLines3D() {
    int columns = (width - (BORDER + BORDER)) / SQUARE_SIZE;
    int rows = (height - (BORDER + BORDER)) / SQUARE_SIZE;

    // -1330

    for (int i=0 ; i < rows + 1; i++) {
        int z = -(rows - i) * SQUARE_SIZE + count;
        line(BORDER, BORDER + SQUARE_SIZE * i, z, BORDER + SQUARE_SIZE * columns, BORDER + SQUARE_SIZE * i, z);
    }
    for (int i=0 ; i < columns + 1; i++) {
        int z = -rows * SQUARE_SIZE + count;
        line(BORDER + SQUARE_SIZE * i, BORDER, z, BORDER + SQUARE_SIZE * i, BORDER + SQUARE_SIZE * rows, 0);
    }

    if (count == 1000) {
        countUp = false;
    } else if (count == 0) {
        countUp = true;
    }
    if (countUp) {
        count++;
    } else {
        count--;
    }
}

void drawOneRectAndLines2D() {
    int columns = (width - (BORDER + BORDER)) / SQUARE_SIZE;
    int rows = (height - (BORDER + BORDER)) / SQUARE_SIZE;

    for (int i=0 ; i < rows + 1; i++) {
        // 10, 10 + 70 * 0, 10 + 70 * 9, 10 + 70 * 0 = 10, 10, 640, 10
        // 10, 10 + 70 * 1, 10 + 70 * 9, 10 + 70 * 1 = 10, 80, 640, 80
        line(BORDER, BORDER + SQUARE_SIZE * i, BORDER + SQUARE_SIZE * columns, BORDER + SQUARE_SIZE * i);
    }
    for (int i=0 ; i < columns + 1; i++) {
        // 10 + 70 * 0, 10, 10 + 70 * 0, 10 + 70 * 12 = 10, 10, 10, 850
        // 10 + 70 * 1, 10, 10 + 70 * 1, 10 + 70 * 12 = 80, 10, 80, 850
        line(BORDER + SQUARE_SIZE * i, BORDER, BORDER + SQUARE_SIZE * i, BORDER + SQUARE_SIZE * rows);
    }
}

void drawVariousRect() {
    int columns = (width - (BORDER + BORDER)) / SQUARE_SIZE;
    int rows = (height - (BORDER + BORDER)) / SQUARE_SIZE;
    for (int i=0 ; i < columns; i++) {
        for (int j=0 ; j < rows; j++) {
            rect(BORDER + SQUARE_SIZE * i, BORDER + SQUARE_SIZE * j, SQUARE_SIZE, SQUARE_SIZE);
        }
    }
}
