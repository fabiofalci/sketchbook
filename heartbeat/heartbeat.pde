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
    strokeWeight(1);

    if (frameCount % 40 == 0) {
        heart.pump();
    }

    Position current = new Position(x, heart.position + height / 2);
    if (history.isEmpty()) {
        point(current.x, current.y);
    } else {
        Position previous = history.getFirst();
        if (previous.y != current.y) {
            line(previous.x, previous.y, current.x, current.y);
        } else {
            point(current.x, current.y);
        }
    }

    history.addFirst(current);

    if (history.size() > length) {
        stroke(0);
        strokeWeight(2);
        Position removed = history.removeLast();
        Position last = history.getLast();
        line(removed.x, removed.y, last.x, last.y);
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

    int JUMP = -40;

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
            position = abs(JUMP) / 2;
            justJumped = false;
        } else {
            position = 0;
        }
    }

    void pump() {
        position = JUMP;
    }

}