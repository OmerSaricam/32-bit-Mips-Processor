module cla_4bit(
output c_out,
output [3:0] r,
output g,   
output p,
input [3:0] a,
input [3:0] b,
input [3:0] less_i,
input c_in,
input [2:0] ALUop
);

    

    wire wr1, wr2, wr3, wr4, wr5, wr6, wr7, wr8, wr9, wr10, wr11, wr12, wr13, wr14, wr15, wr16, wr17, wr18, wr19, wr20, wr21, wr22, wr23, wr24, wr25, wr26;

    //There is no need for c_outs coming out of Alu's. I will send them to the dead wires
    wire dead1, dead2, dead3, dead4;

    wire c1,c2,c3,c4;

    wire p0,p1,p2,p3;
    wire g0,g1,g2,g3;

    alu_1bit alu0(
    .c_out(dead1),
    .r(r[0]),
    .g(g0),
    .p(p0),
    .a(a[0]),
    .b(b[0]),
    .less_i(less_i[0]),
    .c_in(c_in),
    .ALUop(ALUop)  //2:0
    );

    // c1 = g0 + p0.c0
    and and1 (wr1, p0, c_in);
    or or1 (c1, g0, wr1);


    alu_1bit alu1(
    .c_out(dead2),
    .r(r[1]),
    .g(g1),
    .p(p1),
    .a(a[1]),
    .b(b[1]),
    .less_i(less_i[1]),
    .c_in(c1),
    .ALUop(ALUop)  //2:0
    );


    //c2 = g1 + p1.c1 = g1 + p1.g0 + p1.p0.c0
    and and2 (wr2, p0, c_in);
    and and3 (wr3, p1, wr2);

    and and4 (wr4, p1, g0);

    or or2 (wr5, g1, wr4);
    or or3 (c2, wr5, wr3);


    alu_1bit alu2(
    .c_out(dead3),
    .r(r[2]),
    .g(g2),
    .p(p2),
    .a(a[2]),
    .b(b[2]),
    .less_i(less_i[2]),
    .c_in(c2),
    .ALUop(ALUop)  //2:0
    );

    //c3 = g2 + p2.c2 = g2 + p2g1 + p2p1g0 + p2p1p0c0

    and and5 (wr6, p0, c_in);
    and and6 (wr7, p1, p2);
    and and7 (wr8, wr6, wr7);

    and and8 (wr9, p1, g0);
    and and9 (wr10, p2, wr9);

    and and10 (wr11, p2, g1);

    or or3_ (wr12, wr10, wr8);
    or or4 (wr13, wr11, g2);
    or or5 (c3, wr12, wr13);
    



    alu_1bit alu3(
    .c_out(dead4),  
    .r(r[3]),
    .g(g3),
    .p(p3),
    .a(a[3]),
    .b(b[3]),
    .less_i(less_i[3]),
    .c_in(c3),
    .ALUop(ALUop)  //2:0
    );


    //c4 = g3 + p3.c3 = g3 + p3g2 + p3p2g1 + p3p2p1g0 + p3p2p1p0c0

    
    and and11 (wr14, p3, p2);
    and and12 (wr15, p1, p0);
    and and13 (wr16, wr14, wr15);
    and and14 (wr17, wr16, c_in);

    and and15 (wr18, p1, g0);
    and and16 (wr19, p3, p2);
    and and17 (wr20, wr18, wr19);

    and and18 (wr21, p2, g1);
    and and19 (wr22, p3, wr21);

    and and20 (wr23, p3, g2);

    or or6 (wr24, g3, wr23);
    or or7 (wr25, wr22, wr20);
    or or8 (wr26, wr24, wr25);
    or or9 (c_out, wr26, wr17);  //Burada hesaplanan c4. Yani alu3'ten çıkan carry. Yani c_out.


    //now, we must calculate the p_3:0 and g_3:0 values for this 4 bit cla. 
    
    //G3:0 = g3 + p3g2 + p3p2g1 + p3p2p1g0
    xor xor1 (g, wr26, 1'b0);

    //P3:0 = p3p2p1p0
    xor xor2 (p, wr16, 1'b0);


endmodule