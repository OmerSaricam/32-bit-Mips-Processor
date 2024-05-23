module mux_4x1_1bit(
output out,
input in0,
input in1,
input in2,
input in3,
input in4,
input in5,
input in6,
input in7,
input [3:0] sel
);

//This is 8x1 input actually.


  
    wire notSel2, notSel1, notSel0, wr1, wr2, wr3, wr4, wr5, wr6, wr7, wr8, wr9, wr10, wr11, wr12, wr13, wr14, wr15, wr16;
    wire zero_out, first_or, first_out, sec_out, second_or, third_or, third_out, fourth_or, fourth_out, fifth_or, fifth_out, sixth_or, sixth_out, seventh_out;

    not not0 (notSel2, sel[2]);
    not not1 (notSel1, sel[1]);
    not not2 (notSel0, sel[0]);

    //for the 0. condition. 000
    and and1 (wr1, notSel0, notSel1);
    and and2 (wr2, wr1, notSel2);
    and and3 (zero_out, wr2, in0);


    //for the 1. condition. 001
    and and4 (wr3, sel[0], notSel1);
    and and5 (wr4, wr3, notSel2);
    and and6 (first_out, wr4, in1);



    //for the 2. condition. 010
    and and7 (wr5, notSel0, sel[1]);
    and and8 (wr6, wr5, notSel2);
    and and9 (sec_out, wr6, in2);


    //for the 3. condition. 011
    and and10 (wr7, sel[0], sel[1]);
    and and11 (wr8, wr7, notSel2);
    and and12 (third_out, wr8, in3);


    //for the 4. condition. 100
    and and13 (wr9, notSel0, notSel1);
    and and14 (wr10, wr9, sel[2]);
    and and15 (fourth_out, wr10, in4);


    //for the 5. condition. 101
    and and16 (wr11, sel[0], notSel1);
    and and17 (wr12, wr11, sel[2]);
    and and18 (fifth_out, wr12, in5);


    //for the 6. condition. 110
    and and19 (wr13, notSel0, sel[1]);
    and and20 (wr14, wr13, sel[2]);
    and and21 (sixth_out, wr14, in6);


    //for the 7. condition. 111
    and and22 (wr15, sel[0], sel[1]);
    and and23 (wr16, wr15, sel[2]);
    and and24 (seventh_out, wr16, in7);


    // Now, the scene belongs to the or processes

    or or1 (first_or, zero_out, first_out);
    or or2 (second_or, sec_out, third_out);
    or or3 (third_or, fourth_out, fifth_out);
    or or4 (fourth_or, sixth_out, seventh_out);

    or or5 (fifth_or, first_or, second_or);
    or or6 (sixth_or, third_or, fourth_or);

    or or7 (out, fifth_or, sixth_or);








endmodule