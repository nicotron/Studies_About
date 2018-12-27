PVector center;
void setup() {
    size(800, 600);
    center = new PVector(width/2, height/2);
}

void draw() {
    background(#EEF1F5);
    // translate(width/2, height/2);

    // PVector center = new PVector(width/2, height/2);
    PVector mouse = new PVector(mouseX, mouseY);

    // lines from center, mouse vector
    strokeWeight(4);
    stroke(#5C9927);line(0, 0, center.x, center.y);
    stroke(#CA2D29);line(0, 0, mouse.x, mouse.y);

    // center point
    strokeWeight(5);    stroke(251);    point(center.x, center.y);

    fill(251);
    textSize(5);
    float x = map(mouseX, 0, width, 2, width-40);
    float y = map(mouseY, 0, height, 20, height-2);
    text(mouseX + " - " + mouseY, x, y);


    // darkgreen line of line conecting the two vectors
    // NOT a Vector
    stroke(#334827);    strokeWeight(4);
    line(center.x, center.y, mouse.x, mouse.y);


    // operación entre vector, modificar el valor de mouse, restando center
    mouse.sub(center);
    // a green line from the vector's result moditication
    strokeWeight(4);    stroke(0, 255, 5);
    line(0,0, mouse.x, mouse.y);

    // placing the modified vector in the position of the subtractor
    // a light blue line inside push and pop matrices
    pushMatrix();
    translate(center.x, center.y);
    stroke(#F5150B); strokeWeight(1);
    line(0,0, mouse.x, mouse.y);
    popMatrix();
}
