module mux_2x1_32bit(
input [31:0] data_0, //cla
input [31:0] data_1, //mod
input sel,
output [31:0] out
);
//If sel is 1, then out become data_1

wire notSel;

wire [31:0] wr1, wr2;

not not0 (notSel, sel);

and and1 (wr1[0], data_0[0], notSel);
and and2 (wr1[1], data_0[1], notSel);
and and3 (wr1[2], data_0[2], notSel);
and and4 (wr1[3], data_0[3], notSel);
and and5 (wr1[4], data_0[4], notSel);
and and6 (wr1[5], data_0[5], notSel);
and and7 (wr1[6], data_0[6], notSel);
and and8 (wr1[7], data_0[7], notSel);
and and9 (wr1[8], data_0[8], notSel);
and and10 (wr1[9], data_0[9], notSel);
and and11 (wr1[10], data_0[10], notSel);
and and12 (wr1[11], data_0[11], notSel);
and and13 (wr1[12], data_0[12], notSel);
and and14 (wr1[13], data_0[13], notSel);
and and15 (wr1[14], data_0[14], notSel);
and and16 (wr1[15], data_0[15], notSel);
and and17 (wr1[16], data_0[16], notSel);
and and18 (wr1[17], data_0[17], notSel);
and and19 (wr1[18], data_0[18], notSel);
and and20 (wr1[19], data_0[19], notSel);
and and21 (wr1[20], data_0[20], notSel);
and and22 (wr1[21], data_0[21], notSel);
and and23 (wr1[22], data_0[22], notSel);
and and24 (wr1[23], data_0[23], notSel);
and and25 (wr1[24], data_0[24], notSel);
and and26 (wr1[25], data_0[25], notSel);
and and27 (wr1[26], data_0[26], notSel);
and and28 (wr1[27], data_0[27], notSel);
and and29 (wr1[28], data_0[28], notSel);
and and30 (wr1[29], data_0[29], notSel);
and and31 (wr1[30], data_0[30], notSel);
and and32 (wr1[31], data_0[31], notSel);




and and1_ (wr2[0], data_1[0], sel);
and and2_ (wr2[1], data_1[1], sel);
and and3_ (wr2[2], data_1[2], sel);
and and4_ (wr2[3], data_1[3], sel);
and and5_ (wr2[4], data_1[4], sel);
and and6_ (wr2[5], data_1[5], sel);
and and7_ (wr2[6], data_1[6], sel);
and and8_ (wr2[7], data_1[7], sel);
and and9_ (wr2[8], data_1[8], sel);
and and10_ (wr2[9], data_1[9], sel);
and and11_ (wr2[10], data_1[10], sel);
and and12_ (wr2[11], data_1[11], sel);
and and13_ (wr2[12], data_1[12], sel);
and and14_ (wr2[13], data_1[13], sel);
and and15_ (wr2[14], data_1[14], sel);
and and16_ (wr2[15], data_1[15], sel);
and and17_ (wr2[16], data_1[16], sel);
and and18_ (wr2[17], data_1[17], sel);
and and19_ (wr2[18], data_1[18], sel);
and and20_ (wr2[19], data_1[19], sel);
and and21_ (wr2[20], data_1[20], sel);
and and22_ (wr2[21], data_1[21], sel);
and and23_ (wr2[22], data_1[22], sel);
and and24_ (wr2[23], data_1[23], sel);
and and25_ (wr2[24], data_1[24], sel);
and and26_ (wr2[25], data_1[25], sel);
and and27_ (wr2[26], data_1[26], sel);
and and28_ (wr2[27], data_1[27], sel);
and and29_ (wr2[28], data_1[28], sel);
and and30_ (wr2[29], data_1[29], sel);
and and31_ (wr2[30], data_1[30], sel);
and and32_ (wr2[31], data_1[31], sel);





or or1 (out[0], wr1[0], wr2[0]);
or or2 (out[1], wr1[1], wr2[1]);
or or3 (out[2], wr1[2], wr2[2]);
or or4 (out[3], wr1[3], wr2[3]);
or or5 (out[4], wr1[4], wr2[4]);
or or6 (out[5], wr1[5], wr2[5]);
or or7 (out[6], wr1[6], wr2[6]);
or or8 (out[7], wr1[7], wr2[7]);
or or9 (out[8], wr1[8], wr2[8]);
or or10 (out[9], wr1[9], wr2[9]);
or or11 (out[10], wr1[10], wr2[10]);
or or12 (out[11], wr1[11], wr2[11]);
or or13 (out[12], wr1[12], wr2[12]);
or or14 (out[13], wr1[13], wr2[13]);
or or15 (out[14], wr1[14], wr2[14]);
or or16 (out[15], wr1[15], wr2[15]);
or or17 (out[16], wr1[16], wr2[16]);
or or18 (out[17], wr1[17], wr2[17]);
or or19 (out[18], wr1[18], wr2[18]);
or or20 (out[19], wr1[19], wr2[19]);
or or21 (out[20], wr1[20], wr2[20]);
or or22 (out[21], wr1[21], wr2[21]);
or or23 (out[22], wr1[22], wr2[22]);
or or24 (out[23], wr1[23], wr2[23]);
or or25 (out[24], wr1[24], wr2[24]);
or or26 (out[25], wr1[25], wr2[25]);
or or27 (out[26], wr1[26], wr2[26]);
or or28 (out[27], wr1[27], wr2[27]);
or or29 (out[28], wr1[28], wr2[28]);
or or30 (out[29], wr1[29], wr2[29]);
or or31 (out[30], wr1[30], wr2[30]);
or or32 (out[31], wr1[31], wr2[31]);




endmodule


