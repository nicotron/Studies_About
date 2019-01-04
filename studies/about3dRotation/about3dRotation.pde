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
float raduis, rotationX, rotationY, rotationZ, rotationX2, rotationY2, rotationZ2,
    step;
int radio;

void setup() {
    smooth();
    // ortho();
    size(920, 950, P3D);
    p = new Particle();
    cam = new PeasyCam(this, 200);
    cam.rotateZ(radians(-45));
    cam.rotateX(radians(-60));

    // ControlP5 Settings
    cp5 = new ControlP5(this);
    cp5.setAutoDraw(false);
    cp5.setColorCaptionLabel(color(#D36D94)); // title
    cp5.setColorValueLabel(color(#D36D94)); // value
    cp5.setColorForeground(color(#3C2F49, 80)); // fill
    cp5.setColorBackground(color(#3C2F49, 80)); // empty
    cp5.setColorActive(color(#F92A3A)); // selection

    float posx = width *.25;
    int posy = 50;
    int step = 26;
    int tall = 20;
    int wide = 200;
    cp5.addSlider("radio").setValue(50).setRange(0, 360).setPosition(posx, posy).setSize(wide, tall).setColorValue(0);
    posy += step;
    cp5.addSlider("rotationX").setRange(0, 360).setPosition(posx, posy).setSize(wide, tall).setColorValue(0);
    posy += step;
    cp5.addSlider("rotationY").setRange(0, 360).setPosition(posx, posy).setSize(wide, tall).setColorValue(0);
    posy += step;
    cp5.addSlider("rotationZ").setRange(0, 360).setPosition(posx, posy).setSize(wide, tall).setColorValue(0);
    posy += step;
    cp5.addSlider("rotationX2").setRange(0, 360).setPosition(posx, posy).setSize(wide, tall).setColorValue(0);
    posy += step;
    cp5.addSlider("rotationY2").setRange(0, 360).setPosition(posx, posy).setSize(wide, tall).setColorValue(0);
    posy += step;
    cp5.addSlider("rotationZ2").setRange(0, 360).setPosition(posx, posy).setSize(wide, tall).setColorValue(0);
    posy += step;
    cp5.addSlider("step").setRange(0, 60).setPosition(posx, posy).setSize(wide, tall).setColorValue(0);
    posy += step;
}

void draw() {
    background(p.gray, 10);

    p.axis(0);
    p.dot(0);
    p.circleRadius(radio);
    p.knowingAxis(rotationX, rotationY, rotationZ, rotationX2, rotationY2, rotationZ2, radio);

    p.axis(step);
    p.dot(step);
    p.knowingAxis(rotationX, rotationY, rotationZ, rotationX2, rotationY2, rotationZ2, radio);
    // p.circleRadius(radio);

    p.connect(0, step);



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
