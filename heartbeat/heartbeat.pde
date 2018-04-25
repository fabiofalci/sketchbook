import java.util.*;


int JUMP = -40;
int PACE = 2;
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

    float maxLength = width / PACE;
    length = int(maxLength * 0.9);
}

void draw() {
    stroke(255);
    strokeWeight(2);

    if (frameCount % 70 == 0) {
        heart.pump();
    }

    Position current = new Position(x, heart.position + height / 2);
    Position previous;
    if (!history.isEmpty()) {
        previous = history.getFirst();
        if (previous.x > current.x) {
            previous = current;
        }
    } else {
        previous = current;
    }


    line(previous.x, previous.y, current.x, current.y);

    history.addFirst(current);

    if (history.size() > length) {
        stroke(0);
        strokeWeight(3);
        Position removed = history.removeLast();
        line(removed.x - 1, JUMP + height / 2 - 10, removed.x, abs(JUMP) + height / 2);
    }

    x += PACE;
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