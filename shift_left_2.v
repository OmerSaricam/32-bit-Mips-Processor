module shift_left_2 (
output [31:0] shifted_address,
input [31:0] address
);


xor xor0 (shifted_address[0], 1'b0, 1'b0);
xor xor1 (shifted_address[1], 1'b0, 1'b0);
xor xor2 (shifted_address[2], 1'b0, address[0]);
xor xor3 (shifted_address[3], 1'b0, address[1]);
xor xor4 (shifted_address[4], 1'b0, address[2]);
xor xor5 (shifted_address[5], 1'b0, address[3]);
xor xor6 (shifted_address[6], 1'b0, address[4]);
xor xor7 (shifted_address[7], 1'b0, address[5]);
xor xor8 (shifted_address[8], 1'b0, address[6]);
xor xor9 (shifted_address[9], 1'b0, address[7]);
xor xor10 (shifted_address[10], 1'b0, address[8]);
xor xor11 (shifted_address[11], 1'b0, address[9]);
xor xor12 (shifted_address[12], 1'b0, address[10]);
xor xor13 (shifted_address[13], 1'b0, address[11]);
xor xor14 (shifted_address[14], 1'b0, address[12]);
xor xor15 (shifted_address[15], 1'b0, address[13]);
xor xor16 (shifted_address[16], 1'b0, address[14]);
xor xor17 (shifted_address[17], 1'b0, address[15]);
xor xor18 (shifted_address[18], 1'b0, address[16]);
xor xor19 (shifted_address[19], 1'b0, address[17]);
xor xor20 (shifted_address[20], 1'b0, address[18]);
xor xor21 (shifted_address[21], 1'b0, address[19]);
xor xor22 (shifted_address[22], 1'b0, address[20]);
xor xor23 (shifted_address[23], 1'b0, address[21]);
xor xor24 (shifted_address[24], 1'b0, address[22]);
xor xor25 (shifted_address[25], 1'b0, address[23]);
xor xor26 (shifted_address[26], 1'b0, address[24]);
xor xor27 (shifted_address[27], 1'b0, address[25]);
xor xor28 (shifted_address[28], 1'b0, address[26]);
xor xor29 (shifted_address[29], 1'b0, address[27]);
xor xor30 (shifted_address[30], 1'b0, address[28]);
xor xor31 (shifted_address[31], 1'b0, address[29]);


endmodule