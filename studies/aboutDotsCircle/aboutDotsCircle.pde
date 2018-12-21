import peasy.*;
import controlP5.*;

/*
Study number: 2 - December 2018 - Nicolás Troncoso - Designer
*/

// Description needed
// -----------------------------------------------------------------------------

void setup() {
    size(1600, 900);
    //Inicialize variables
}

void draw() {
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
