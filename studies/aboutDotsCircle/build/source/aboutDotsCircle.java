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

public class aboutDotsCircle extends PApplet {




/*
Study number: 2 - December 2018 - Nicolás Troncoso - Designer
*/

// Description needed
// -----------------------------------------------------------------------------

public void setup() {
    
    //Inicialize variables
}

public void draw() {
    background(253);
    translate(width/2, height/2);
    for (int i = 0; i < 10; i++) {
        float r = map(i, 0, 10, 1, mouseX);
        for (int j = 0; j < r; j ++) {
            float angle = map(j, 0, r, 0, TWO_PI);
            float x = r * sin(angle);
            float y = r * cos(angle);
            strokeWeight(5);
            stroke(51);
            point(x, y);
        }
    }
}
class Particle {
    PVector pos, acc, vel;
    int bg, fill, stroke, gray, blue, cyan, red, purple;
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
    public void movement() {
        vel.add(acc);
        pos.add(vel);
    }
    public void dot() {
        strokeWeight(5);
        stroke(red);
        point(pos.x, pos.y, pos.z);
    }

    // axis
    public void axis() {
        stroke(purple);
        noFill();
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
            rotateX(scale.dot(todot)*0.001f);
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
  public void settings() {  size(1600, 900); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "aboutDotsCircle" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
