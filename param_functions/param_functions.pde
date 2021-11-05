float t = 0;

void setup() {
    background(20);

    size(1000, 1000);
}

void draw() {
    stroke(255);
    strokeWeight(5);

    translate(width / 2, height / 2);

    // line(x1(t), y1(t), x2(t), y2(t));
    point(x2(t), y2(t));

    t++;
}

float x1(float t) {
    return t;
}

float y1(float t) {
    return sin(t);
}

float x2(float t) {
    return sin(t / 50) * 400 + sin(t / 20) * 90;
}

float y2(float t) {
    return cos(t / 50) * 400;
}