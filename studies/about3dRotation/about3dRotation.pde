import peasy.*;
import controlP5.*;

/*
Study number: 1 - November 2018 - Nicolás Troncoso - Designer
*/

// How nested rotation woks
// -----------------------------------------------------------------------------

// Interaction
PeasyCam cam;
ControlP5 cp5;

Particle p;

void setup() {
    smooth();
    size(1920, 950, P3D);
    p = new Particle();
    cam = new PeasyCam(this, 1000);
}

void draw() {
    background(p.gray);
    p.axis();
    p.dot();
    p.lines();

}
