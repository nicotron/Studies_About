Bank[] banks, rankings;
int index;

void setup () {
  size(1200, 600);

  Table tabla = loadTable("data.csv", "header");
  banks = new Bank[tabla.getRowCount()];
  for (int i = 0; i < tabla.getRowCount(); i++) {
	// Creamos un nuevo objeto del tipo TableRow con la información de cada fila
    TableRow row = tabla.getRow(i);

    // Con esas variables construyo un objeto
    banks[i] = new Bank(row.getString("CorredorHom"),row.getInt("Jan_12"),row.getInt("Feb_12"),row.getInt("Mar_12"),row.getInt("Apr_12"),row.getInt("May_12"),row.getInt("Jun_12"),row.getInt("Jul_12"),row.getInt("Aug_12"),row.getInt("Sep_12"),row.getInt("Oct_12"),row.getInt("Nov_12"),row.getInt("Dec_12"),row.getInt("Jan_13"),row.getInt("Feb_13"),row.getInt("Mar_13"),row.getInt("Apr_13"),row.getInt("May_13"),row.getInt("Jun_13"),row.getInt("Jul_13"),row.getInt("Aug_13"),row.getInt("Sep_13"),row.getInt("Oct_13"),row.getInt("Nov_13"),row.getInt("Dec_13"),row.getInt("Jan_14"),row.getInt("Feb_14"),row.getInt("Mar_14"),row.getInt("Apr_14"),row.getInt("May_14"),row.getInt("Jun_14"),row.getInt("Jul_14"),row.getInt("Aug_14"),row.getInt("Sep_14"),row.getInt("Oct_14"),row.getInt("Nov_14"),row.getInt("Dec_14"),row.getInt("Jan_15"),row.getInt("Feb_15"),row.getInt("Mar_15"),row.getInt("Apr_15"),row.getInt("May_15"),row.getInt("Jun_15"),row.getInt("Jul_15"),row.getInt("Aug_15"),row.getInt("Sep_15"),row.getInt("Oct_15"),row.getInt("Nov_15"),row.getInt("Dec_15"),row.getInt("Jan_16"),row.getInt("Feb_16"),row.getInt("Mar_16"),row.getInt("Apr_16"),row.getInt("May_16"),row.getInt("Jun_16"),row.getInt("Jul_16"),row.getInt("Aug_16"),row.getInt("Sep_16"),row.getInt("Oct_16"),row.getInt("Nov_16"),row.getInt("Dec_16"),row.getInt("Jan_17"),row.getInt("Feb_17"),row.getInt("Mar_17"),row.getInt("Apr_17"),row.getInt("May_17"),row.getInt("Jun_17"),row.getInt("Jul_17"),row.getInt("Aug_17"),row.getInt("Sep_17"),row.getInt("Oct_17"),row.getInt("Nov_17"),row.getInt("Dec_17"),row.getInt("Jan_18"),row.getInt("Feb_18"),row.getInt("Mar_18"),row.getInt("Apr_18"),row.getInt("May_18"),row.getInt("Jun_18"),row.getInt("Jul_18"),row.getInt("Aug_18"),row.getInt("Sep_18"),row.getInt("Oct_18"),row.getInt("Nov_18"),row.getInt("Dec_18"),row.getInt("Jan_19"),row.getInt("Feb_19"),row.getInt("Mar_19"),row.getInt("Apr_19"), i);
  }

  tabla = loadTable("dataRanking.csv");
  rankings = new Bank[tabla.getRowCount()];

  for (int i = 0; i < tabla.getRowCount(); i++) {
    TableRow row = tabla.getRow(i);
    int[] ranks = new int [row.getColumnCount()-1];
    // println(ranks.length);

    for (int j = 0; j < ranks.length; j ++) {
      ranks[j] = row.getInt(j+1);
      // println(row.getString(j) + " " + row.getInt(j+1) + " " + j);
    }

    // println(row.getColumnCount());
    rankings[i] = new Bank(ranks, row.getString(0));
    // noLoop();
  }
  // println(banks.length, rankings.length);
}

void draw() {
  background(253);
  // fill(253, 150);
  // rect(0,0,width,height);
  // float amt = map(frameCount%90, 0, 90, 0.1, 1);
  float amt = 1;
  // println(frameCount%90);


  if (index > 87) { index = 0;}
  if(frameCount%90 == 0) {
    index++; amt=0;
  }


  for(int i = 0; i < banks.length; i++) {
    banks[i].title();
    banks[i].time(index);
    banks[i].money(index, amt);
    // lerp(start, stop, amt)
    banks[i].y = lerp(banks[i].y, map(rankings[i].ranks[index], 0, 13, 0, 600), 0.06);
  }
}

void keyPressed() {}