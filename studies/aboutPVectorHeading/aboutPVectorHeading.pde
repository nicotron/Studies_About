// import peasy.*;
//
// PeasyCam cam;
// PVector center;
//
// void setup() {
//     size(800, 600);
//     noCursor();
//     center = new PVector(width/2, height/2);
//     // center = new PVector(0, 0); // for cam translation
//
//     // cam setup
//     // cam = new PeasyCam(this, 200);
//     // cam.rotateZ(radians(-45));
//     // cam.rotateX(radians(-60));
// }
//
// void draw() {
//     background(253);
//
//     // math --------------------------------------------------------------------
//     PVector mouse = new PVector(mouseX, mouseY);
//     // operación entre vector, modificar el valor de mouse, restando center
//     mouse.sub(center);
//     float angle = mouse.heading();
//     // v1 using v.heading() to rotate perpendicular to a v0(mouse)
//     PVector v1 = new PVector(mouse.x, mouse.y);
//     float degre = degrees(angle); // raw from -PI PI to degrees
//     float convertion = map(degre, -180, 180, 0, 360);
//     float v1RotationAngle_90 = angle;
//
//     // set magnitude of vector for GUI
//     mouse.setMag(50);
//     v1.setMag(50);
//
//     v1.rotate(radians(-90));
//
//     // math results visualized--------------------------------------------------
//     // placing the modified vector in the position of the subtractor
//     // a light blue line inside push and pop matrices
//     pushMatrix();
//     translate(center.x, center.y);
//     stroke(#0B0B0A); strokeWeight(3);
//     line(0,0, mouse.x, mouse.y);
//     // line rotated v1 copy of mouse vector
//     stroke(#F53724);
//     strokeWeight(3);
//     line(0, 0, v1.x, v1.y);
//     popMatrix();
//
//     // center point
//     strokeWeight(5);
//     stroke(#334827);
//     point(center.x, center.y);
//
//     // v.heading text
//     fill(51);
//     text("v.heading() "+angle, center.x, center.y-5);
//     // v.heading in degrees
//     text("degrees("+degre+")", center.x, center.y-25);
//     text("convertion("+convertion+")", center.x, center.y-50);
//     text("v1RotationAngle_90("+ v1RotationAngle_90 +")", center.x, center.y-75);
//
//     // GUI mouse cursor
//     pushMatrix();
//     // translate(center.x, center.y);
//     noStroke(); fill(#0B0B0A, 90);
//     ellipse(mouseX, mouseY, 20, 20);
//     popMatrix();
// }


// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Angle Between Two Vectors
// Using the dot product to compute the angle between two vectors

void setup() {
  size(640, 360);
}

void draw() {
  background(255);

  // A "vector" (really a point) to store the mouse position and screen center position
  PVector mouseLoc = new PVector(mouseX, mouseY);
  PVector centerLoc = new PVector(width/2, height/2);

  // Aha, a vector to store the displacement between the mouse and center
  PVector v = PVector.sub(mouseLoc, centerLoc);
  v.normalize();
  v.mult(75);

  PVector xaxis = new PVector(75, 0);
  // Render the vector
  drawVector(v, centerLoc, 1.0);
  drawVector(xaxis, centerLoc, 1.0);


  float theta = PVector.angleBetween(v, xaxis);

  fill(0);
  text(int(degrees(theta)) + " degrees\n" + theta + " radians", 10, 160);
}

// Renders a vector object 'v' as an arrow and a position 'loc'
void drawVector(PVector v, PVector pos, float scayl) {
  pushMatrix();
  float arrowsize = 6;
  // Translate to position to render vector
  translate(pos.x, pos.y);
  stroke(0);
  strokeWeight(2);
  // Call vector heading function to get direction (pointing up is a heading of 0)
  rotate(v.heading2D());
  // Calculate length of vector & scale it to be bigger or smaller if necessary
  float len = v.mag()*scayl;
  // Draw three lines to make an arrow
  line(0, 0, len, 0);
  line(len, 0, len-arrowsize, +arrowsize/2);
  line(len, 0, len-arrowsize, -arrowsize/2);
  popMatrix();
}
