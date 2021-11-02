int SQUARE_SIZE = 70;
int BORDER = 10;

void setup() {
    size(900, 700);
}

void draw() {
    noFill();
    strokeWeight(2);
    drawVariousRect();

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