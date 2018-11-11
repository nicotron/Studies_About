class Particle {
    PVector pos, acc, vel;
    color bg, fill, stroke, gray, blue, cyan, red, purple;
    float raduis;

    Particle() {
        gray = color(231, 237, 244);
        blue = color(31, 9, 191);
        cyan = color(20, 219, 241);
        red = color(196, 15, 69);
        purple = color(55, 4, 78);
        pos = new PVector(0, 0, 0);
        acc = new PVector(0, 0, 0);
        vel = new PVector(0, 0, 0);
        raduis = 100;
    }
    void movement() {
        vel.add(acc);
        pos.add(vel);
    }
    void dot() {
        strokeWeight(5);
        stroke(red);
        point(pos.x, pos.y, pos.z);
    }

    // axis
    void axis() {
        stroke(purple);
        noFill();
        pushMatrix();
        translate(pos.x, pos.y, pos.z);
        strokeWeight(0.1);
        strokeCap(ROUND);
        line(-5000, 0, 0, 5000, 0, 0); // X axis
        line(0, -5000, 0, 0, 5000, 0); // Y axis
        strokeWeight(2);
        ellipse(0, 0, raduis*2, raduis*2);
        popMatrix();
    }

    // line
    void lines() {
        PVector scale = new PVector(raduis, 0, 0);
        strokeWeight(5);
        stroke(red);
        pushMatrix();
        line(pos.x, pos.y,  pos.z, scale.x, scale.y, scale.z);
        popMatrix();

    }

    // spine
    void spine (int amt, float rotationX,  float rotationY, float rotationZ) {
      for (int i = 0; i < amt; i ++) {
        // code
      }
    }
}
