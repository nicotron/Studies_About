PVector center;
void setup() {
    size(800, 600);
    noCursor();
    center = new PVector(width/2, height/2);
}

void draw() {
    background(253);

    // math --------------------------------------------------------------------
    PVector mouse = new PVector(mouseX, mouseY);
    // operación entre vector, modificar el valor de mouse, restando center
    mouse.sub(center);
    float angle = mouse.heading();
    // v1 using v.heading() to rotate perpendicular to a v0(mouse)
    PVector v1 = new PVector(mouse.x, mouse.y);
    float degre = degrees(angle); // raw from -PI PI to degrees
    float convertion = map(degre, -180, 180, 0, 360);
    float v1RotationAngle_90 = angle;

    // set magnitude of vector for GUI
    mouse.setMag(50);
    v1.setMag(50);

     v1.rotate(radians(-90));

    // math results visualized--------------------------------------------------
    // placing the modified vector in the position of the subtractor
    // a light blue line inside push and pop matrices
    pushMatrix();
    translate(center.x, center.y);
    stroke(#0B0B0A); strokeWeight(3);
    line(0,0, mouse.x, mouse.y);
    // line rotated v1 copy of mouse vector
    stroke(#F53724); strokeWeight(3);
    line(0,0, v1.x, v1.y);
    popMatrix();

    // center point
    strokeWeight(5);    stroke(#334827);
    point(center.x, center.y);

    // v.heading text
    fill(51);
    text("v.heading() "+angle, center.x, center.y-5);
    // v.heading in degrees
    text("degrees("+degre+")", center.x, center.y-25);
    text("convertion("+convertion+")", center.x, center.y-50);
    text("v1RotationAngle_90("+ v1RotationAngle_90 +")", center.x, center.y-75);

    // GUI mouse cursor
    pushMatrix();
    // translate(center.x, center.y);
    noStroke(); fill(#0B0B0A, 90);
    ellipse(mouseX, mouseY, 20, 20);
    popMatrix();
}
