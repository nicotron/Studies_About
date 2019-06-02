// Visualizing a day with rich graphics driven by atributes in data

Day[] days;
Day[] dots;
Day d;
int num, value;

void setup(){
  fullScreen();
  Table tabla = loadTable("data.csv", "header");
  days = new Day[tabla.getRowCount()];
  for (int i = 0; i < tabla.getRowCount(); i++) {
	// Creamos un nuevo objeto del tipo TableRow con la información de cada fila
    TableRow row = tabla.getRow(i);

    // Con esas variables construyo un objeto
    days[i] = new Day(row.getFloat("A"),row.getFloat("S"),row.getFloat("T"),row.getFloat("Max TemperatureC"),row.getFloat("Mean TemperatureC"),row.getFloat("Min TemperatureC"),row.getFloat("Dew PointC"),row.getFloat("MeanDew PointC"),row.getFloat("Min DewpointC"),row.getFloat("Max Humidity"),row.getFloat("Mean Humidity"),row.getFloat("Min Humidity"),row.getFloat("Max Sea Level PressurehPa"),row.getFloat("Mean Sea Level PressurehPa"),row.getFloat("Min Sea Level PressurehPa"),row.getFloat("Max VisibilityKm"),row.getFloat("Mean VisibilityKm"),row.getFloat("Min VisibilitykM"),row.getFloat("Max Wind SpeedKm/h"),row.getFloat("Mean Wind SpeedKm/h"),row.getFloat("Max Gust SpeedKm/h"),row.getFloat("Precipitationmm"),row.getFloat("CloudCover"),row.getFloat("Events"),row.getFloat("WindDirDegrees"));
  }


  for (int i = 0; i < days.length; i ++) {
    if(days[i].s==8 && days[i].t==18) {
      //8,18,32,29,27,24,23,22,84,67,48,1014,1012,1010,31,11,10,39,26,55,0.00,2,,83
      // println(days[i].maxTemperatureC);
      d = days[i];
    }
  }


  // lista complemetaría de objetos de otro constructor
  dots = new Day[500];
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
  if(frameCount%130 == 0) {num++;}
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
