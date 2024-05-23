module alu(
input [31:0]  alu_src1,
input [31:0] alu_src2,
input [2:0] alu_ctr, //ALUop
//input CLK,
//input reset,
output zero_bit,
output [31:0] alu_result
);

wire wr1, wr00, wr01, wr02, wr03;
wire v_holder, c_out_holder;
wire [31:0] cla_result;

//If substraction, lessthan or mod operation will be done, then 1 must be given to to c_in input of cla_. 
//If msb two bit is 1, then substraction must be done
and and1 (wr00, alu_ctr[2], alu_ctr[1]);

// The less than condition is checked. If alu_ctr is 100, then substraction must be done.
nor for_less_than1 (wr01, alu_ctr[1], alu_ctr[0]);
and for_less_than2 (wr02, alu_ctr[2], wr01);

or is_substraction(wr1, wr00, wr02);



cla_32bit cla_(
.v(v_holder),
.c_out(c_out_holder),
.r(cla_result),
.a( alu_src1),
.b(alu_src2),
.less_i(32'b0),
.c_in(wr1),
.ALUop(alu_ctr)
);



nor nor1(zero_bit, cla_result[0], cla_result[1], cla_result[2], cla_result[3], cla_result[4], cla_result[5], cla_result[6], cla_result[7], cla_result[8], cla_result[9], cla_result[10], cla_result[11], cla_result[12], cla_result[13], cla_result[14], cla_result[15], cla_result[16], cla_result[17], cla_result[18], cla_result[19], cla_result[20], cla_result[21], cla_result[22], cla_result[23], cla_result[24], cla_result[25], cla_result[26], cla_result[27], cla_result[28], cla_result[29], cla_result[30], cla_result[31] );
//nor #(.A_WIDTH(32)) nor1 (zero_bit, cla_result[31:0]);


xor xor0 (alu_result[0], 1'b0, cla_result[0]);
xor xor1 (alu_result[1], 1'b0, cla_result[1]);
xor xor2 (alu_result[2], 1'b0, cla_result[2]);
xor xor3 (alu_result[3], 1'b0, cla_result[3]);
xor xor4 (alu_result[4], 1'b0, cla_result[4]);
xor xor5 (alu_result[5], 1'b0, cla_result[5]);
xor xor6 (alu_result[6], 1'b0, cla_result[6]);
xor xor7 (alu_result[7], 1'b0, cla_result[7]);
xor xor8 (alu_result[8], 1'b0, cla_result[8]);
xor xor9 (alu_result[9], 1'b0, cla_result[9]);
xor xor10 (alu_result[10], 1'b0, cla_result[10]);
xor xor11 (alu_result[11], 1'b0, cla_result[11]);
xor xor12 (alu_result[12], 1'b0, cla_result[12]);
xor xor13 (alu_result[13], 1'b0, cla_result[13]);
xor xor14 (alu_result[14], 1'b0, cla_result[14]);
xor xor15 (alu_result[15], 1'b0, cla_result[15]);
xor xor16 (alu_result[16], 1'b0, cla_result[16]);
xor xor17 (alu_result[17], 1'b0, cla_result[17]);
xor xor18 (alu_result[18], 1'b0, cla_result[18]);
xor xor19 (alu_result[19], 1'b0, cla_result[19]);
xor xor20 (alu_result[20], 1'b0, cla_result[20]);
xor xor21 (alu_result[21], 1'b0, cla_result[21]);
xor xor22 (alu_result[22], 1'b0, cla_result[22]);
xor xor23 (alu_result[23], 1'b0, cla_result[23]);
xor xor24 (alu_result[24], 1'b0, cla_result[24]);
xor xor25 (alu_result[25], 1'b0, cla_result[25]);
xor xor26 (alu_result[26], 1'b0, cla_result[26]);
xor xor27 (alu_result[27], 1'b0, cla_result[27]);
xor xor28 (alu_result[28], 1'b0, cla_result[28]);
xor xor29 (alu_result[29], 1'b0, cla_result[29]);
xor xor30 (alu_result[30], 1'b0, cla_result[30]);
xor xor31 (alu_result[31], 1'b0, cla_result[31]);



// mod mod_(
// .a(A),
// .b(B),
// .reset(reset),
// .CLK(CLK),
// .result(mod_result)
// );

//If ALUop is 111, then sel of mux must be 1.
// and and2 (wr03, wr00, ALUop[0]);

// mux_2x1_32bit mux_32bit(
// .data_0(cla_result), //cla
// .data_1(mod_result), //mod
// .sel(wr03),
// .out(Result)
// );


endmodule