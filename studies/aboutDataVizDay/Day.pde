class Day  {
  float a, s, t, maxTemperatureC, meanTemperatureC, minTemperatureC, dewPointC, meanDewPointC, minDewpointC, maxHumidity, meanHumidity, minHumidity, maxSeaLevelPressurehPa, meanSeaLevelPressurehPa, minSeaLevelPressurehPa, maxVisibilityKm, meanVisibilityKm, minVisibilitykm, maxWindSpeedKm, meanWindSpeedKm, maxGustSpeedKmh, precipitationmm, cloudCover, events, windDirDegrees;
  float x, y, xv, yv;

  color[] pallete = {#CF5991,#FCB79D,#FEEEDA,#646BD9};

  Day(float a, float s, float t, float maxTemperatureC, float meanTemperatureC, float minTemperatureC, float dewPointC, float meanDewPointC, float minDewpointC, float maxHumidity, float meanHumidity, float minHumidity, float maxSeaLevelPressurehPa, float meanSeaLevelPressurehPa, float minSeaLevelPressurehPa, float maxVisibilityKm, float meanVisibilityKm, float minVisibilitykm, float maxWindSpeedKm, float meanWindSpeedKm, float maxGustSpeedKmh, float precipitationmm, float cloudCover, float events, float windDirDegrees) {
    this.a = a;
    this.s = s;
    this.t = t;
    // this.maxTemperatureC = map(maxTemperatureC, 0, 10, 0, 50);
    this.maxTemperatureC = maxTemperatureC;
    this.meanTemperatureC = map(meanTemperatureC, 0, 10, 0, 50);
    this.minTemperatureC = map(minTemperatureC, 0, 10, 0, 50);
    this.dewPointC = dewPointC;
    this.meanDewPointC = meanDewPointC;
    this.minDewpointC = minDewpointC;
    this.maxHumidity = maxHumidity;
    this.meanHumidity = meanHumidity;
    this.minHumidity = minHumidity;
    // this.maxSeaLevelPressurehPa = map(maxSeaLevelPressurehPa, 0, 1000, 0, 250);
    this.maxSeaLevelPressurehPa = maxSeaLevelPressurehPa;
    this.meanSeaLevelPressurehPa = map(meanSeaLevelPressurehPa, 0, 1000, 0, 250);
    this.minSeaLevelPressurehPa = map(minSeaLevelPressurehPa, 0, 1000, 0, 250);
    this.maxVisibilityKm = maxVisibilityKm;
    this.meanVisibilityKm = meanVisibilityKm;
    this.minVisibilitykm = minVisibilitykm;
    this.maxWindSpeedKm = maxWindSpeedKm;
    this.meanWindSpeedKm = meanWindSpeedKm;
    this.maxGustSpeedKmh = maxGustSpeedKmh;
    this.precipitationmm = precipitationmm;
    this.cloudCover = cloudCover;
    this.events = events;
    this.windDirDegrees = windDirDegrees;

    // graphcis
    textAlign(CENTER);

  }

  Day() {
    this.x = random(width);
    this.y = random(height);
    this.xv = random(-2,2);
    this.yv = 0;
  }

  //  description
  void year() {
    textSize(20);
    fill(pallete[0]);
    text(int(a), width/2, height*.1);
  }

  void mes(){
    textSize(45);
    fill(pallete[1]);
    text("Septiembre", width/2, height*.2);
  }

  void dia(){
    textAlign(CENTER);
    textSize(250);
    fill(pallete[2], 180);
    text(int(t), width/2, height*.5 + 125);
  }








  void temp() {
      stroke(pallete[0]);
      strokeWeight(300);
      pushMatrix();
      translate(width/2, height/2);
      line(-350, this.minTemperatureC, 350, this.maxTemperatureC);
      popMatrix();

      pushMatrix();
      textSize(15);
      translate(width/2, height*.8);
      text("Temperatura", 0, 0);
      popMatrix();
  }

  // humidity
  void humidity () {
    stroke(pallete[1]);
    strokeWeight(300);
    pushMatrix();
    translate(width/2, height/2);
    line(-350, this.minHumidity, 350, this.maxHumidity);
    popMatrix();

    pushMatrix();
    textSize(15);
    translate(width/2, height*.8);
    text("Humedad", 0, 0);
    popMatrix();
  }

  // seaLevel
  void seaLevel () {
    stroke(pallete[2]);
    strokeWeight(300);
    pushMatrix();
    translate(width/2, height/2);
    line(-350, this.minSeaLevelPressurehPa, 350, this.maxSeaLevelPressurehPa);
    popMatrix();

    pushMatrix();
    textSize(15);
    translate(width/2, height*.8);
    text("Sea Level", 0, 0);
    popMatrix();
  }

  // wind
  void wind () {
    stroke(pallete[2]);
    strokeWeight(300);
    pushMatrix();
    translate(width/2, height/2);
    line(-350, this.maxWindSpeedKm, 350, this.maxGustSpeedKmh);
    popMatrix();

    pushMatrix();
    textSize(15);
    translate(width/2, height*.8);
    text("Wind", 0, 0);
    popMatrix();
  }

  // precipitation
  void precipitation () {
    fill(pallete[3]);
    noStroke();
    pushMatrix();
    translate(width/2, height/2);
    ellipse(0, 0, this.precipitationmm, this.precipitationmm);
    popMatrix();

    pushMatrix();
    textSize(15);
    translate(width/2, height*.8);
    text("Precipitación", 0, 0);
    popMatrix();
  }

  // cover
  void cover () {
  }

  // windDir
  void windDir () {

  }

  // show
  void show () {
    strokeWeight(5);
    stroke(pallete[2]);
    point(x, y);

  }

  // vel
  void vel () {
    x += xv;
    y += yv;
  }

  // borde
  void borde () {
    if(x < 0) x = width;
    if(x > width) x = 0;
    if(y < 0) y = height;
    if(y > height) y = 0;
  }
}
