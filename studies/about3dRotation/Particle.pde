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
        ellipse(0, 0, raduis * 2, raduis * 2);
        popMatrix();
    }

    // line
    void lines(int amt, float rotationX, float rotationY) {
        PVector todot = new PVector(0, 0, rotationY);
        for (int j = 0; j < 1; j++) {
            float a = map(j, 0, 6 - 1, 0, TWO_PI);
            float raduisx = 100 * cos(a);
            float raduisy = 100 * sin(a);
            PVector scale = new PVector(raduisx, raduisy, 0);

            strokeWeight(2);
            stroke(red);
            pushMatrix();
            line(pos.x, pos.y, pos.z, scale.x, scale.y, scale.z);
            line(pos.x, pos.y, pos.z, todot.x, todot.y, todot.z);
            popMatrix();

            // PVector direction = PVector.sub(scale, pos);
            // rotate(direction.heading());
            pushMatrix();
            translate(scale.x, scale.y, scale.z);
            strokeWeight(10);
            point(0,0,0);
            rotateZ(radians(-90));
            rotateZ(scale.heading());
            // line(0,0,0, 100, 0, 0);
            // rotateX(radians(rotationY));
            text(scale.dot(todot), 0, 0, 0);
            rotateX(scale.dot(todot)*0.001);
            for (int i = 0; i < 12; i++) {
                float angle = map(i, 0, 12, 0, amt);
                pushMatrix();
                rotateY(radians(angle));
                pushMatrix();
                rotateZ(radians(rotationX));
                strokeWeight(5);
                // line(0,0,0, scale.x, scale.y, scale.z);
                line(0, 0, 0, 50, 0, 0);
                popMatrix();
                popMatrix();
            }
            popMatrix();
        }
    }

    // spine
    void spine(int amt, float rotationX, float rotationY, float rotationZ) {
        translate(pos.x, pos.y, pos.z);
        pushMatrix();
        rotateY(radians(rotationY));
        rotateZ(radians(rotationZ));
        for (int i = 0; i < 6; i++) {
            float angle = map(i, 0, 6, 0, 360);
            // rotateX(radians(rotationX));
            pushMatrix();
            rotateX(radians(angle));
            strokeWeight(4);
            stroke(blue);
            line(0, 0, 0, raduis, 0, 0);
            popMatrix();
        }
        popMatrix();
    }
}
