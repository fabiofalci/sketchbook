int SQUARE_SIZE = 70;
int BORDER = 10;

void setup() {
    size(900, 700);
}

void draw() {
    noFill();
    strokeWeight(2);
    // drawVariousRect();
    drawOneRectAndLines();
}

void drawOneRectAndLines() {
    int columns = (width - (BORDER + BORDER)) / SQUARE_SIZE;
    int rows = (height - (BORDER + BORDER)) / SQUARE_SIZE;

    for (int i=0 ; i < rows + 1; i++) {
        line(BORDER, BORDER + SQUARE_SIZE * i, BORDER + SQUARE_SIZE * columns, BORDER + SQUARE_SIZE * i);
    }
    for (int i=0 ; i < columns + 1; i++) {
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