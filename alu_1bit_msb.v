module alu_1bit_msb(
output v,
output set,
output c_out,
output r,
output g,
output p,
input a,
input b,
input less_i,
input c_in,
input [2:0] ALUop
);


wire wr1,wr2, wr3, wr4, wr5, wr6, wr7, wr8, wr9, wr10, wr11, wr11_, wr12; 

wire wr00, wr01, wr02;

//If msb two bit is 1, then substraction must be done
and and1 (wr00, ALUop[2], ALUop[1]);

// The less than condition is checked. If ALUop is 100, then substraction must be done.
nor for_less_than1 (wr01, ALUop[1], ALUop[0]);
and for_less_than2 (wr02, ALUop[2], wr01);


or is_substraction(wr1, wr00, wr02);



//If substruction will be done, then b must be inverse.
xor xor1 (wr2, b, wr1);

and and2 (wr3, wr2, a);

or or1 (wr4, wr2, a);

not not1 (wr5, wr3);

and and3 (wr6, wr5, wr4);

and and4 (wr7, wr6, c_in);

or or_out (c_out, wr3, wr7);

not not2 (wr8, wr7);

or or2 (wr9, wr6, c_in);

and and5 (wr10, wr8, wr9);

not not3 (wr11, wr4); //to make nor

//assign g = wr3; //assign is forbidden
xor xor2 (g, wr3, 1'b0);

//assign p = wr4; //assign is forbidden
xor xor3 (p, wr4, 1'b0);



// to find V (overflow)
or or_msb1 (wr11_, wr3, wr7);
xor xor_msb1 (wr12, wr11_, c_in);  
xor xor_msb1_1 (v, wr11_, c_in); //i did this because assign is forbidden.

xor xor_msb2 (set, wr10, wr12);



mux_4x1_1bit mux1(
 .out(r),
 .in0(wr3), //and
 .in1(wr4), //or
 .in2(wr6), //xor
 .in3(wr11), //nor
 .in4(less_i), //lessthan
 .in5(wr10), //add
 .in6(wr10), //sub
 .in7(wr10), //mod
 .sel(ALUop[2:0])  
);




endmodule