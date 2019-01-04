import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import peasy.*; 
import controlP5.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class about3dRotation extends PApplet {




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

public void setup() {
    
    // ortho();
    
    p = new Particle();
    cam = new PeasyCam(this, 200);
    cam.rotateZ(radians(-45));
    cam.rotateX(radians(-60));

    // ControlP5 Settings
    cp5 = new ControlP5(this);
    cp5.setAutoDraw(false);
    cp5.setColorCaptionLabel(color(0xffD36D94)); // title
    cp5.setColorValueLabel(color(0xffD36D94)); // value
    cp5.setColorForeground(color(0xff3C2F49, 80)); // fill


    cp5.setColorBackground(color(0xff3C2F49, 80)); // empty
    cp5.setColorActive(color(0xffF92A3A)); // selection

    float posx = width *.25f;
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

public void draw() {
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
class Particle {
    PVector pos, acc, vel;
    int bg, fill, stroke, gray, blue, cyan, red, purple;
    PVector [] coordenates = new PVector[2];

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
    public void movement() {
        vel.add(acc);
        pos.add(vel);
    }
    public void dot(float step) {
        pos.z = step;
        strokeWeight(5);
        stroke(red);
        point(pos.x, pos.y, pos.z);
    }

    /*
    knowingAxis to make:
    a wire wheel of lines rotating perpendicular to the line between it's and
    the floor below

    */
    public void knowingAxis(float rotationX, float rotationY, float rotationZ,
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
                stroke(purple, 90); strokeWeight(5);
                // line(r.x, r.y, r.z, r.x + l.x, r.y, r.z);
                line(0,0,0, l.x, r.y, r.z);
            popMatrix();
        popMatrix();
    }


    // connect
    public void connect (float ground, float step) {

    }
    public void pivot(){
        strokeWeight(2);
        float l = 20;
        stroke(255, 0, 0);line(0,0,0, l, 0, 0);
        stroke(0, 255, 0);line(0,0,0, 0, l, 0);
        stroke(0, 0, 255);line(0,0,0, 0, 0, l);
    }

    public void pointRaduis(PVector r) {
        strokeWeight(8);
        stroke(blue);
        point(r.x, r.y, r.z);
    }
    public void circleRadius(float r){
        strokeWeight(1);
        stroke(51);
        ellipse(pos.x, pos.y, r*2, r*2);
    }

    // given a float, return a 3d vector for raduis 2d
    public PVector raduis(float r) {
        PVector v = new PVector(r, 0, 0);
        return v;
    }
    // axis
    public void axis(float step) {
        // change z parameter in pos vector
        pos.z = step;

        stroke(purple); noFill();
        pushMatrix();
            translate(pos.x, pos.y, pos.z);
            strokeWeight(0.1f);
            strokeCap(ROUND);
            line(-5000, 0, 0, 5000, 0, 0); // X axis
            line(0, -5000, 0, 0, 5000, 0); // Y axis
            strokeWeight(2);
            ellipse(0, 0, raduis * 2, raduis * 2);
        popMatrix();
    }

    // line
    public void lines(int amt, float rotationX, float rotationY) {
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
    public void spine(int amt, float rotationX, float rotationY, float rotationZ) {
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
  public void settings() {  size(920, 950, P3D);  smooth(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "about3dRotation" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
