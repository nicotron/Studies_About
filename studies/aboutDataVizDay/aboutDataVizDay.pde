// Visualizing a day with rich graphics driven by atributes in data

Day[] days;
Day[] dots;
Day d;
int num, value;

void setup(){
  fullScreen();
  // size(100,100);
  Table tabla = loadTable("data.csv", "header");
  days = new Day[tabla.getRowCount()];
  for (int i = 0; i < tabla.getRowCount(); i++) {
	// Creamos un nuevo objeto del tipo TableRow con la información de cada fila
    TableRow row = tabla.getRow(i);

    // Con esas variables construyo un objeto
    days[i] = new Day(row.getFloat("A"),row.getFloat("S"),row.getFloat("T"),row.getFloat("Max TemperatureC"),row.getFloat("Mean TemperatureC"),row.getFloat("Min TemperatureC"),row.getFloat("Dew PointC"),row.getFloat("MeanDew PointC"),row.getFloat("Min DewpointC"),row.getFloat("Max Humidity"),row.getFloat("Mean Humidity"),row.getFloat("Min Humidity"),row.getFloat("Max Sea Level PressurehPa"),row.getFloat("Mean Sea Level PressurehPa"),row.getFloat("Min Sea Level PressurehPa"),row.getFloat("Max VisibilityKm"),row.getFloat("Mean VisibilityKm"),row.getFloat("Min VisibilitykM"),row.getFloat("Max Wind SpeedKm/h"),row.getFloat("Mean Wind SpeedKm/h"),row.getFloat("Max Gust SpeedKm/h"),row.getFloat("Precipitationmm"),row.getFloat("CloudCover"),row.getFloat("Events"),row.getFloat("WindDirDegrees"));
  }
  for (int i = 0; i < days.length; i ++) {
    // if(days[i].ast.equals("2015-1-1")) {
    if(days[i].s==9 && days[i].t==18) {
//2015,9,18,33,30,27,26,24,24,84,72,55,1010,1008,1005,31,14,10,39,29,55,0.00,2,,78
      println(days[i].maxSeaLevelPressurehPa);
      d = days[i];
    }
  }
  // lista complemetaría de objetos de otro constructor
  dots = new Day[1010];
  for (int i = 0; i < dots.length; i ++) {
    dots[i] = new Day();
  }

}

void draw() {
  background(0);

  // general
  d.year();
  d.mes();


  for (int i = 0; i < value; i ++) {
    dots[i].show();
    dots[i].vel();
    dots[i].borde();
  }

  if (num > 3) { num = 0;}
  if(frameCount%60 == 0) {num++;}
  // details
  switch(num) {
      case 0:
        d.temp();
        value = int(d.maxTemperatureC);
      break;
      case 1:
        d.humidity();
        value = int(d.maxHumidity);
      break;
      case 2:
        d.seaLevel();
        value = int(d.maxSeaLevelPressurehPa);
      break;
      case 3:
        d.windDir();
        value = int(d.maxWindSpeedKm);
      break;
      // case 3: d.precipitation();  break;
      // case 4: d.wind();  break;
      // case 5: d.cover();  break;

    }
    
    d.dia();
}
