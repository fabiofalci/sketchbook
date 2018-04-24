import java.util.*;


int x;
int y;
int length;
Heart heart;
Deque<Position> history;


void setup() {
    size(900, 700);
    background(0);

    heart = new Heart();
    history = new LinkedList();
    x = 0;
    y = height / 2;
    length = 300;
}

void draw() {
    stroke(255);

    if (frameCount % 40 == 0) {
        heart.pump();
    }

    history.addFirst(new Position(x, heart.position + height / 2));

    point(x,  heart.position + height / 2);

//    if (up) {
//        line(x - 1, y, x, y - JUMP);
//    } else if (middle) {
//        line(x - 1, y - JUMP, x, y);
//    } else if (down) {
//        line(x - 1, y, x, y + JUMP / 2);
//    } else if (down) {
//        line(x - 1, y + JUMP / 2, x, y);
//    } else {
//        point(x,  y);
//    }

    if (history.size() > length) {
        stroke(0);
        Position lastPosition = history.removeLast();
        point(lastPosition.x, lastPosition.y);
    }

    x += 1;
    if (x >= width) {
        x = 0;
    }
    heart.reset();
}

class Position {
    int x;
    int y;

    Position(int x, int y) {
        this.x = x;
        this.y = y;
    }
}

class Heart {

    int JUMP = 40;

    int position;
    boolean justJumped;

    Heart() {
        position = 0;
    }

    void reset() {
        if (position == JUMP) {
            justJumped = true;
            position = 0;
        } else if (justJumped) {
            position = JUMP / 2;
        } else {
            position = 0;
        }
    }

    void pump() {
        position = -JUMP;
    }

}