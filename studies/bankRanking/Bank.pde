class Bank {
  // Variables
  String bank;
  // String[] trees = { "ash", "oak" };
  String[] time = {"jan 12","feb 12","mar 12","apr 12","may 12","jun 12","jul 12","aug 12","sep 12","oct 12","nov 12","dec 12","jan 13","feb 13","mar 13","apr 13","may 13","jun 13","jul 13","aug 13","sep 13","oct 13","nov 13","dec 13","jan 14","feb 14","mar 14","apr 14","may 14","jun 14","jul 14","aug 14","sep 14","oct 14","nov 14","dec 14","jan 15","feb 15","mar 15","apr 15","may 15","jun 15","jul 15","aug 15","sep 15","oct 15","nov 15","dec 15","jan 16","feb 16","mar 16","apr 16","may 16","jun 16","jul 16","aug 16","sep 16","oct 16","nov 16","dec 16","jan 17","feb 17","mar 17","apr 17","may 17","jun 17","jul 17","aug 17","sep 17","oct 17","nov 17","dec 17","jan 18","feb 18","mar 18","apr 18","may 18","jun 18","jul 18","aug 18","sep 18","oct 18","nov 18","dec 18","jan 19","feb 19","mar 19","apr 19" };
  int[] amount, ranks;
  int jan_12, feb_12, mar_12, apr_12, may_12, jun_12, jul_12, aug_12, sep_12, oct_12, nov_12, dec_12, jan_13, feb_13, mar_13, apr_13, may_13, jun_13, jul_13, aug_13, sep_13, oct_13, nov_13, dec_13, jan_14, feb_14, mar_14, apr_14, may_14, jun_14, jul_14, aug_14, sep_14, oct_14, nov_14, dec_14, jan_15, feb_15, mar_15, apr_15, may_15, jun_15, jul_15, aug_15, sep_15, oct_15, nov_15, dec_15, jan_16, feb_16, mar_16, apr_16, may_16, jun_16, jul_16, aug_16, sep_16, oct_16, nov_16, dec_16, jan_17, feb_17, mar_17, apr_17, may_17, jun_17, jul_17, aug_17, sep_17, oct_17, nov_17, dec_17, jan_18, feb_18, mar_18, apr_18, may_18, jun_18, jul_18, aug_18, sep_18, oct_18, nov_18, dec_18, jan_19, feb_19, mar_19, apr_19,  i;
  float x,  y,  xvel,  yvel;

  Bank(String bank,  int jan_12,  int feb_12,  int mar_12,  int apr_12,  int may_12,  int jun_12,  int jul_12,  int aug_12,  int sep_12,  int oct_12,  int nov_12,  int dec_12,  int jan_13,  int feb_13,  int mar_13,  int apr_13,  int may_13,  int jun_13,  int jul_13,  int aug_13,  int sep_13,  int oct_13,  int nov_13,  int dec_13,  int jan_14,  int feb_14,  int mar_14,  int apr_14,  int may_14,  int jun_14,  int jul_14,  int aug_14,  int sep_14,  int oct_14,  int nov_14,  int dec_14,  int jan_15,  int feb_15,  int mar_15,  int apr_15,  int may_15,  int jun_15,  int jul_15,  int aug_15,  int sep_15,  int oct_15,  int nov_15,  int dec_15,  int jan_16,  int feb_16,  int mar_16,  int apr_16,  int may_16,  int jun_16,  int jul_16,  int aug_16,  int sep_16,  int oct_16,  int nov_16,  int dec_16,  int jan_17,  int feb_17,  int mar_17,  int apr_17,  int may_17,  int jun_17,  int jul_17,  int aug_17,  int sep_17,  int oct_17,  int nov_17,  int dec_17,  int jan_18,  int feb_18,  int mar_18,  int apr_18,  int may_18,  int jun_18,  int jul_18,  int aug_18,  int sep_18,  int oct_18,  int nov_18,  int dec_18,  int jan_19,  int feb_19,  int mar_19,  int apr_19,  int i) {
    // Inicialize the variables
    this.bank = bank;
    amount = new int[88];
    amount[0] = jan_12;
    amount[1] = feb_12;
    amount[2] = mar_12;
    amount[3] = apr_12;
    amount[4] = may_12;
    amount[5] = jun_12;
    amount[6] = jul_12;
    amount[7] = aug_12;
    amount[8] = sep_12;
    amount[9] = oct_12;
    amount[10] = nov_12;
    amount[11] = dec_12;
    amount[12] = jan_13;
    amount[13] = feb_13;
    amount[14] = mar_13;
    amount[15] = apr_13;
    amount[16] = may_13;
    amount[17] = jun_13;
    amount[18] = jul_13;
    amount[19] = aug_13;
    amount[20] = sep_13;
    amount[21] = oct_13;
    amount[22] = nov_13;
    amount[23] = dec_13;
    amount[24] = jan_14;
    amount[25] = feb_14;
    amount[26] = mar_14;
    amount[27] = apr_14;
    amount[28] = may_14;
    amount[29] = jun_14;
    amount[30] = jul_14;
    amount[31] = aug_14;
    amount[32] = sep_14;
    amount[33] = oct_14;
    amount[34] = nov_14;
    amount[35] = dec_14;
    amount[36] = jan_15;
    amount[37] = feb_15;
    amount[38] = mar_15;
    amount[39] = apr_15;
    amount[40] = may_15;
    amount[41] = jun_15;
    amount[42] = jul_15;
    amount[43] = aug_15;
    amount[44] = sep_15;
    amount[45] = oct_15;
    amount[46] = nov_15;
    amount[47] = dec_15;
    amount[48] = jan_16;
    amount[49] = feb_16;
    amount[50] = mar_16;
    amount[51] = apr_16;
    amount[52] = may_16;
    amount[53] = jun_16;
    amount[54] = jul_16;
    amount[55] = aug_16;
    amount[56] = sep_16;
    amount[57] = oct_16;
    amount[58] = nov_16;
    amount[59] = dec_16;
    amount[60] = jan_17;
    amount[61] = feb_17;
    amount[62] = mar_17;
    amount[63] = apr_17;
    amount[64] = may_17;
    amount[65] = jun_17;
    amount[66] = jul_17;
    amount[67] = aug_17;
    amount[68] = sep_17;
    amount[69] = oct_17;
    amount[70] = nov_17;
    amount[71] = dec_17;
    amount[72] = jan_18;
    amount[73] = feb_18;
    amount[74] = mar_18;
    amount[75] = apr_18;
    amount[76] = may_18;
    amount[77] = jun_18;
    amount[78] = jul_18;
    amount[79] = aug_18;
    amount[80] = sep_18;
    amount[81] = oct_18;
    amount[82] = nov_18;
    amount[83] = dec_18;
    amount[84] = jan_19;
    amount[85] = feb_19;
    amount[86] = mar_19;
    amount[87] = apr_19;
    this.i = i;
    this.x = 10;
    this.y = map(i,  1,  13,  height*.1,  height*.9);
  }

  Bank(int[] ranks, String bankName) {
    this.ranks = ranks;
    this.bank = bankName;
    // println(this.ranks.length);
    for (int i = 0; i < ranks.length; i ++) {
      // print(ranks[i] + " ");
      // this.x = 10;
      // this.y = map(this.ranks[i],  1,  13,  height*.1,  height*.9);
    }
    // -------------------------------------------------------------

  }

  //  description
  void title() {
    textSize(10);
    fill(0);
    textAlign(LEFT);
    text(this.bank, x, y);
  }

  // time
  void time (int index) {
    textSize(40);
    textAlign(RIGHT);
    text(time[index], width*0.95, height*.9);
  }

  // money
  void money (int index, float amt) {
    float star = amount[index]*0.00008;
    float stop = amount[index]*0.0002;
    noStroke();
    fill(51);
    pushMatrix();
    translate(x+100, y);

    rect(0, 0, lerp(star, stop, amt), -10);
    textSize(10);
    textAlign(LEFT);
    text(amount[index], lerp(star, stop, amt) + 5, 0);
    popMatrix();
  }

  // ranking
  void ranking (int index) {
    this.x = 10;
    this.y = map(this.ranks[index],  1,  13,  height*.1,  height*.9);
  }
}
