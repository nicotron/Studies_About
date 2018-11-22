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
float raduis, rotationX, rotationY, rotationZ;
int amt;

void setup() {
    smooth();
    // ortho();
    size(1920, 950, P3D);
    p = new Particle();
    cam = new PeasyCam(this, 500);

    // ControlP5 Settings
    cp5 = new ControlP5(this);
    cp5.setAutoDraw(false);
    cp5.setColorCaptionLabel(color(#D36D94)); // title
    cp5.setColorValueLabel(color(#D36D94)); // value
    cp5.setColorForeground(color(#3C2F49, 80)); // fill
    cp5.setColorBackground(color(#3C2F49, 80)); // empty
    cp5.setColorActive(color(#F92A3A)); // selection

    int posx = 750;   int posy = 50;    int step = 26;    int tall = 20;    int wide = 200;
    cp5.addSlider("amt").setRange(0, 360).setPosition(posx, posy).setSize(wide, tall).setColorValue(0); posy += step;
    cp5.addSlider("rotationX").setRange(0, 60).setPosition(posx, posy).setSize(wide, tall).setColorValue(0); posy += step;
    cp5.addSlider("rotationY").setRange(0, 360).setPosition(posx, posy).setSize(wide, tall).setColorValue(0); posy += step;
    cp5.addSlider("rotationZ").setRange(0, 360).setPosition(posx, posy).setSize(wide, tall).setColorValue(0); posy += step;
}

void draw() {
    background(p.gray);
    p.axis();
    p.dot();
    p.lines(amt, rotationX, rotationY);
    // p.spine(amt, rotationX, rotationY, rotationZ);

    // GUI
    hint(DISABLE_DEPTH_TEST);
    cam.beginHUD();
    cp5.draw();
    cam.endHUD();
    hint(ENABLE_DEPTH_TEST);
    // Using the GUI do not affect the view
    if (cp5.isMouseOver()) {
        cam.setActive(false);
    } else {
        cam.setActive(true);
    }
}
