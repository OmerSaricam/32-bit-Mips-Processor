
module cla_32bit(
output v,
output c_out,
output [31:0] r,
input [31:0] a,
input [31:0] b,
input [31:0] less_i,
input c_in,
input [2:0] ALUop
);

    wire wr1, wr2, wr3, wr4, wr5, wr6, wr7, wr8, wr9, wr10, wr11, wr12, wr13, wr14, wr15, wr16, wr17, wr18, wr19, wr20, wr21, wr22, wr23, wr24, wr25, wr26, wr27, wr28, wr29, wr30, wr31, wr32, wr33, wr34, wr35, wr36, wr37, wr38, wr39, wr40, wr41, wr42, wr43, wr44, wr45, wr46, wr47, wr48, wr49, wr50, wr51, wr52, wr53, wr54, wr55, wr56, wr57, wr58, wr59, wr60, wr61, wr62, wr63, wr64, wr65, wr66, wr67, wr68, wr69, wr70, wr71, wr72, wr73, wr74, wr75, wr76, wr77, wr78, wr79, wr80, wr81, wr82, wr83, wr84, wr85, wr86, wr87, wr88, wr89, wr90, wr91, wr92, wr93, wr94, wr95, wr96, wr97, wr98, wr99, wr100, wr101, wr102, wr103, wr104, wr105, wr106, wr107;

    wire dead1, dead2, dead3, dead4, dead5, dead6, dead7, dead8;

    wire c1,c2,c3,c4,c5,c6,c7,c8;

    wire p0,p1,p2,p3,p4,p5,p6,p7;
    wire g0,g1,g2,g3,g4,g5,g6,g7;

    wire [3:0] fake_less_than_i;


    cla_4bit cla0(
    .c_out(dead1),
    .r(r[3:0]),
    .g(g0),  //g ve p 1 bit. 
    .p(p0),
    .a(a[3:0]),
    .b(b[3:0]),
    .less_i(fake_less_than_i[3:0]),
    .c_in(c_in),
    .ALUop(ALUop)
    );


    // c1 = g0 + p0.c0
    and and1 (wr1, p0, c_in);
    or or1 (c1, g0, wr1);


    cla_4bit cla1(
    .c_out(dead2),
    .r(r[7:4]),
    .g(g1),  //g ve p 1 bit. 
    .p(p1),
    .a(a[7:4]),
    .b(b[7:4]),
    .less_i(less_i[7:4]),
    .c_in(c1),
    .ALUop(ALUop)
    );


    //c2 = g1 + p1.c1 = g1 + p1.g0 + p1.p0.c0
    and and2 (wr2, p0, c_in);
    and and3 (wr3, p1, wr2);
    and and4 (wr4, p1, g0);
    or or2 (wr5, g1, wr4);
    or or3 (c2, wr5, wr3);


    cla_4bit cla2(
    .c_out(dead3),
    .r(r[11:8]),
    .g(g2),  //g ve p 1 bit. 
    .p(p2),
    .a(a[11:8]),
    .b(b[11:8]),
    .less_i(less_i[11:8]),
    .c_in(c2),
    .ALUop(ALUop)
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


    cla_4bit cla3(
    .c_out(dead4),
    .r(r[15:12]),
    .g(g3),  //g ve p 1 bit. 
    .p(p3),
    .a(a[15:12]),
    .b(b[15:12]),
    .less_i(less_i[15:12]),
    .c_in(c3),
    .ALUop(ALUop)
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
    or or9 (c4, wr26, wr17);  //Burada hesaplanan c4. Yani alu3'ten çıkan carry. Yani c_out.


    cla_4bit cla4(
    .c_out(dead5),
    .r(r[19:16]),
    .g(g4),  //g ve p 1 bit. 
    .p(p4),
    .a(a[19:16]),
    .b(b[19:16]),
    .less_i(less_i[19:16]),
    .c_in(c4),
    .ALUop(ALUop)
    );


    // c5 = g4 + p4.c4 = g4 + p4.g3 + p4.p3g2 + p4.p3p2g1 + p4.p3p2p1g0 + p4.p3p2p1p0c0

    and and21 (wr27, p4, p3);
    and and22 (wr28, p2, p1);
    and and23 (wr29, p0, c_in);
    and and24 (wr30, wr27, wr28);
    and and25 (wr31, wr30, wr29);

    and and26 (wr32, p4, p3);
    and and27 (wr33, p2, p1);
    and and28 (wr34, wr32, wr33);
    and and29 (wr35, wr34, g0);

    and and30 (wr36, p4, p3);
    and and31 (wr38, p2, g1); 
    and and32 (wr40, wr36, wr38); 

    and and33 (wr41, p3, g2);
    and and34 (wr42, wr41, p4);

    and and35 (wr43, p4, g3);

    or or10 (wr44, g4, wr43);
    or or11 (wr45, wr42, wr40);
    or or12 (wr46, wr35, wr31);  
    or or13 (wr47, wr44, wr45);
    or or14 (c5, wr47, wr46);





    cla_4bit cla5(
    .c_out(dead6),
    .r(r[23:20]),
    .g(g5),  //g ve p 1 bit. 
    .p(p5),
    .a(a[23:20]),
    .b(b[23:20]),
    .less_i(less_i[23:20]),
    .c_in(c5),
    .ALUop(ALUop)
    );



    // c6 = g5 + p5.c5 = g5 + p5.g4 + p5.p4.g3 + p5.p4.p3g2 + p5.p4.p3p2g1 + p5.p4.p3p2p1g0 + p5.p4.p3p2p1p0c0

    and and36 (wr48, p5, p4);
    and and37 (wr49, p3, p2);
    and and38 (wr50, p1, p0);
    and and39 (wr51, wr48, wr49);
    and and40 (wr52, wr50, c_in);
    and and41 (wr53, wr51, wr52);

    and and42 (wr54, p5, p4);
    and and43 (wr55, p3, p2);
    and and44 (wr56, p1, g0);
    and and45 (wr57, wr54, wr55);
    and and46 (wr58, wr57, wr56);

    and and47 (wr59, p5, p4);
    and and48 (wr60, p3, p2); 
    and and49 (wr61, wr59, wr60); 
    and and50 (wr62, wr61, g1);

    and and51 (wr63, p5, p4);
    and and52 (wr64, p3, g2);
    and and53 (wr65, wr63, wr64);

    and and54 (wr66, p5, p4);
    and and55 (wr67, wr66, g3);

    and and56 (wr68, p5, g4);

    or or15 (wr69, g5, wr68);
    or or16 (wr70, wr67, wr65);
    or or17 (wr71, wr62, wr58);
    or or18 (wr72, wr69, wr70);
    or or19 (wr73, wr71, wr53);
    or or20 (c6, wr72, wr73);



    cla_4bit cla6(
    .c_out(dead7),
    .r(r[27:24]),
    .g(g6),  //g ve p 1 bit. 
    .p(p6),
    .a(a[27:24]),
    .b(b[27:24]),
    .less_i(less_i[27:24]),
    .c_in(c6),
    .ALUop(ALUop)
    );


    //c7: g6 + p6.c6 = g6 + p6.g5 + p6.p5.g4 + p6.p5.p4.g3 + p6.p5.p4.p3g2 + p6.p5.p4.p3p2g1 + p6.p5.p4.p3p2p1g0 + p6.p5.p4.p3p2p1p0c0

    and and57 (wr74, p5, p4);
    and and58 (wr75, p3, p2);
    and and59 (wr76, p1, p0);
    and and60 (wr77, p6, c_in);
    and and61 (wr78, wr74, wr75);
    and and62 (wr79, wr76, wr77);
    and and63 (wr80, wr78, wr79);
    
    and and64 (wr81, p5, p4);
    and and65 (wr82, p3, p2);
    and and66 (wr83, p1, g0); 
    and and67 (wr84, wr81, wr82);
    and and68 (wr85, wr83, p6);
    and and69 (wr86, wr84, wr85);

    and and70 (wr87, p5, p4);
    and and71 (wr88, p3, p2); 
    and and72 (wr89, p6, g1); 
    and and73 (wr90, wr87, wr88);
    and and74 (wr91, wr90, wr89);

    and and75 (wr92, p5, p4);
    and and76 (wr93, p3, g2);
    and and77 (wr94, wr92, wr93);
    and and78 (wr95, wr94, p6);

    and and79 (wr96, p6, p5);
    and and80 (wr97, p4, g3);
    and and81 (wr98, wr96, wr97);

    and and82 (wr99, p6, p5);
    and and83 (wr100, wr99, g4);

    and and84 (wr101, p6, g5);

    or or21 (wr102, g6, wr101);
    or or22 (wr103, wr100, wr98);
    or or23 (wr104, wr95, wr91);
    or or24 (wr105, wr86, wr80);
    or or25 (wr106, wr102, wr103);
    or or26 (wr107, wr104, wr105);
    or or27 (c7, wr106, wr107);
    

    wire dumen;


    cla_4bit_msb cla7(
    .v(v),
    .set(dumen), 
    .c_out(c_out),  
    .r(r[31:28]),
    .g(g7),  
    .p(p7),
    .a(a[31:28]),
    .b(b[31:28]),
    .less_i(less_i[31:28]),
    .c_in(c7),
    .ALUop(ALUop)
    );


    
    xor xor_forLess1 (fake_less_than_i[3], less_i[3], 1'b0);
    xor xor_forLess2 (fake_less_than_i[2], less_i[2], 1'b0);
    xor xor_forLess3 (fake_less_than_i[1], less_i[1], 1'b0);
    xor xor_forLess4 (fake_less_than_i[0], dumen, 1'b0);


endmodule