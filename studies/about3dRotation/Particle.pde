class Particle {
    PVector pos, acc, vel;
    color bg, fill, stroke, gray, blue, cyan, red, purple;
    PVector[] coordenates = new PVector[2];
    PVector[] points = new PVector[2];

    Particle() {
        gray = color(21, 27, 24);
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
    void dot(PVector v) {
        // pos.z = step;
        strokeWeight(5);
        stroke(gray);
        point(v.x, v.y, v.z);
    }

    /*
    knowingAxis to make:
    a wire wheel of lines rotating perpendicular to the line between it's and
    the floor below

    */
    void knowingAxis(float rotationX, float rotationY, float rotationZ,
        float rotationX2, float rotationY2, float rotationZ2, float _r) {
        PVector r = raduis(_r);
        // circleRadius(r.x);

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
        PVector l = new PVector(50, 0, 0);
        stroke(purple, 90);
        strokeWeight(5);
        // line(r.x, r.y, r.z, r.x + l.x, r.y, r.z);
        line(0, 0, 0, l.x, r.y, r.z);
        popMatrix();
        popMatrix();
    }


    // connect two points and make a Vector
    void connect(float ground, float step, float r0, float r1) {
        PVector v0 = new PVector(pos.x, pos.y, ground);
        PVector v1 = new PVector(pos.x, pos.y, step);

        coordenates[0] = v0;
        coordenates[1] = v1;

        PVector vRadio0 = raduis(r0);
        PVector vRadio1 = raduis(r1);
        points[0] = vRadio0.add(v0);
        points[1] = vRadio1.add(v1);
    }

    // vector2vector
    void point2vector() {
        PVector p0 = points[0];
        PVector p1 = points[1];

        stroke(purple);
        strokeWeight(10);
        point(p0.x, p0.y, p0.z);
        point(p1.x, p1.y, p1.z);
    }

    // linesVector
    void linesVector(PVector v) {
        stroke(255, 0, 0, 90);
        strokeWeight(.4);
        line(0, 0, 0, v.x, v.y, v.z);
    }


    // theVector
    void theVector(float mag) {
        PVector v0 = new PVector(points[0].x, points[0].y, points[0].z);
        PVector v1 = new PVector(points[1].x, points[1].y, points[1].z);
        PVector v2 = PVector.sub(v1, v0);
        PVector v3 = new PVector(v2.y, v2.z);

        v3.rotate(radians(-90));
        v2.setMag(mag);

        pushMatrix();
            translate(v0.x, v0.y, v0.z);
            stroke(cyan);
            strokeWeight(4);
            line(0, 0, 0, v2.x, v2.y, v2.z);
            stroke(blue);
            line(0, 0, 0, v3.x, v3.y, 10);

        popMatrix();

    }

    // linesFromVector
    void linesFromVector(float mag) {
        PVector v0 = new PVector(points[0].x, points[0].y, points[0].z);
        PVector v1 = new PVector(points[1].x, points[1].y, points[1].z);

        // a red line from the raw arrays
        stroke(red);
        strokeWeight(1);
        line(v0.x, v0.y, v0.z, v1.x, v1.y, v1.z);

        // copy the raw arrays to semag and use
        PVector vc0 = new PVector();
        vc0 = v0.copy();
        vc0.setMag(mag);
        PVector vc1 = new PVector();
        vc1 = v1.copy();
        vc1.setMag(mag);

        // a line and two points from-to small-big
        strokeWeight(2);
        stroke(cyan);
        line(v0.x, v0.y, v0.z, vc0.x, vc0.y, vc0.z);
        strokeWeight(10);
        point(v0.x, v0.y, v0.z);
        strokeWeight(15);
        point(vc0.x, vc0.y, vc0.z);

        strokeWeight(2);
        stroke(blue);
        line(v1.x, v1.y, v1.z, vc1.x, vc1.y, vc1.z);
        strokeWeight(10);
        point(v1.x, v1.y, v1.z);
        strokeWeight(15);
        point(vc1.x, vc1.y, vc1.z);
    }

    // data of the arrays
    void data() {
        fill(51);
        textSize(10);
        text("c 0: " + coordenates[0], 50, height / 2);
        text("c 1: " + coordenates[1], 50, height / 2 + 10);
        text("p 0: " + points[0], 50, height / 2 + 20);
        text("p 1: " + points[1], 50, height / 2 + 30);
    }

    void pivot() {
        strokeWeight(2);
        float l = 20;
        stroke(255, 0, 0);
        line(0, 0, 0, l, 0, 0);
        stroke(0, 255, 0);
        line(0, 0, 0, 0, l, 0);
        stroke(0, 0, 255);
        line(0, 0, 0, 0, 0, l);
    }

    void pointRaduis(PVector r) {
        strokeWeight(8);
        stroke(blue);
        point(r.x, r.y, r.z);
    }

    void circleRadius(PVector v) {
        strokeWeight(1);
        stroke(51, 100);
        noFill();
        // ellipse(pos.x, pos.y, r * 2, r * 2);
        // PVector v0 = coordenates[index];
        pushMatrix();
        translate(0, 0, v.z);
        ellipse(0, 0, v.x * 2, v.x * 2);
        popMatrix();
    }

    // given a float, return a 3d vector for raduis 2d
    PVector raduis(float r) {
        PVector v = new PVector(r, 0, 0);
        return v;
    }
    // axis
    void axis(PVector v) {
        stroke(purple, 10);
        noFill();
        pushMatrix();
        translate(v.x, v.y, v.z);
        strokeWeight(0.1);
        strokeCap(ROUND);
        line(-5000, 0, 0, 5000, 0, 0); // X axis
        line(0, -5000, 0, 0, 5000, 0); // Y axis
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
