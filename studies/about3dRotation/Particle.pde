class Particle {
    PVector pos, acc, vel;
    color bg, fill, stroke, gray, blue, cyan, red, purple;

    Particle() {
        gray = color(231, 237, 244);
        blue = color(31, 9, 191);
        cyan = color(20, 219, 241);
        red = color(196, 15, 69);
        purple = color(55, 4, 78);
        pos = new PVector(0, 0, 0);
        acc = new PVector(0, 0, 0);
        vel = new PVector(0, 0, 0);
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

    /*
    knowingAxis to make:
    a wire wheel of lines rotating perpendicular to the line between it's and
    the floor below

    */
    void knowingAxis(float rotationX, float rotationY, float rotationZ,
        float rotationX2, float rotationY2, float rotationZ2) {
        PVector r = raduis(100);
        circleRadius(r);

        pushMatrix();
        rotateX(radians(rotationX));
        rotateY(radians(rotationY));
        rotateZ(radians(rotationZ));

        pushMatrix();
        translate(r.x, r.y, r.z);
        rotateX(radians(rotationX2));
        rotateY(radians(rotationY2));
        rotateZ(radians(rotationZ2));
        pivot();
        PVector l = new PVector(r.x/2, 0, 0);
        stroke(purple);
        line(r.x, r.y, r.z, l.x, l.y, l.z);

        popMatrix();
        popMatrix();
    }

    void pivot(){
        strokeWeight(5);
        float l = 35;
        stroke(255, 0, 0);line(0,0,0, l, 0, 0);
        stroke(0, 255, 0);line(0,0,0, 0, l, 0);
        stroke(0, 0, 255);line(0,0,0, 0, 0, l);
    }

    void pointRaduis(PVector r) {
        strokeWeight(8);
        stroke(blue);
        point(r.x, r.y, r.z);
    }
    void circleRadius(PVector r){
        strokeWeight(1);
        stroke(51);
        ellipse(pos.x, pos.y, r.x, r.x);
    }

    // given a float, return a 3d vector for raduis 2d
    PVector raduis(float r) {
        PVector v = new PVector(r, 0, 0);
        return v;
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
        for (int j = 0; j < 6; j++) {
            float a = map(j, 0, 6 - 1, 0, TWO_PI);
            float raduisx = 100 * cos(a);
            float raduisy = 100 * sin(a);
            PVector position = new PVector(raduisx, raduisy, 0);

            strokeWeight(4);
            stroke(red);
            line(pos.x, pos.y, pos.z, position.x, position.y, position.z);
            strokeWeight(2);
            stroke(blue);

            pushMatrix();
            translate(position.x, position.y, position.z); // translate to every point

            rotateZ(radians(-90)); // rotate
            rotateZ(position.heading());
            for (int i = 0; i < 5; i++) {
                float angle = map(i, 0, 4, 0, 360);
                pushMatrix();
                rotateY(radians(angle));
                pushMatrix();
                rotateZ(radians(rotationX));
                strokeWeight(5);
                // line(0,0,0, position.x, position.y, position.z);
                line(0, 0, 0, 20, 0, 0);
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
