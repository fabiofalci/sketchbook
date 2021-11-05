float t = 0;

void setup() {
    size(1000, 1000);
}

void draw() {
    background(20);
    stroke(255);
    strokeWeight(5);

    translate(width / 2, height / 2);

    // line(x1(t), y1(t), x2(t), y2(t));
    for (int i=0; i < 15; i++) {
        stroke(random(0, 255), random(0, 255), random(0, 255));
        // point(x2(t + i), y2(t + i));
        // point(x1(t + i), y1(t + i));
        // line(x1(t + i), y1(t + i), x2(t + i), y2(t + i));
        line(randomFunction(t + i), randomFunction(t + i), randomFunction(t + i), randomFunction(t + i));
    }

    t++;
}

float x1(float t) {
    return sin(t / 12) * 100 + sin(t / 10) * mouseX;
}

float y1(float t) {
    return cos(t / 13) * 150;
}

float x2(float t) {
    return sin(t / 15) * 100 + sin(t / 11) * mouseY; 
}

float y2(float t) {
    return cos(t / 17) * 200;
}

float randomFunction(float t) {
    return cos(t / random(7, 13)) * mouseX + sin(t / random(8, 14)) * mouseY;
}
