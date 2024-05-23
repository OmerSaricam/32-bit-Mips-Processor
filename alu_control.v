module alu_control (
output [2:0] alu_ctr,
input [5:0] function_code,
input [2:0] ALUop
);


wire not_ALUop[2:0];
wire not_func[2:0];

not not0(not_ALUop[0], ALUop[0]);
not not1(not_ALUop[1], ALUop[1]);
not not2(not_ALUop[2], ALUop[2]);

not not3(not_func[0], function_code[0]);
not not4(not_func[1], function_code[1]);
not not5(not_func[2], function_code[2]);


wire aluop000, aluop001, aluop100, aluop101, aluop110, func010, func011, func100, func101, func111;

and and0(aluop000, not_ALUop[2], not_ALUop[1], not_ALUop[0]);
and and1(aluop001, not_ALUop[2], not_ALUop[1], ALUop[0]);
and and2(aluop100, ALUop[2], not_ALUop[1], not_ALUop[0]);
and and3(aluop101, ALUop[2], not_ALUop[1], ALUop[0]);
and and4(aluop110, ALUop[2], ALUop[1], not_ALUop[0]);

and and5(func010, not_func[2], function_code[1], not_func[0], ALUop[0], ALUop[1], ALUop[2]);
and and6(func011, not_func[2], function_code[1], function_code[0], ALUop[0], ALUop[1], ALUop[2]);
and and7(func100, function_code[2], not_func[1], not_func[0], ALUop[0], ALUop[1], ALUop[2]);
and and8(func101, function_code[2], not_func[1], function_code[0], ALUop[0], ALUop[1], ALUop[2]);
and and9(func111, function_code[2], function_code[1], function_code[0], ALUop[0], ALUop[1], ALUop[2]);



or or0(alu_ctr[0], aluop001, aluop101, func010, func101);

or or1(alu_ctr[1], aluop110, func011);

or or2(alu_ctr[2], aluop100, aluop101, aluop110, func010, func011, func111);




endmodule
