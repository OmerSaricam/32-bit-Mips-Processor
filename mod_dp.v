
module mod_dp(
    input CLK,
	input s,
	input we, //write
	input [31:0] a,
	input [31:0] b,
	output is_less,  
    output [31:0] result
);


reg [31:0] temp;
wire [31:0] mux_out1;
wire [31:0] mux_out2;


wire v1,v2, c_out1, c_out2;
wire [31:0] substruction_result, comparison_result;

always @(posedge CLK)
	begin
	if(we)
		temp <= substruction_result;
	end

assign mux_out1 = s ? temp : a;
assign mux_out2 = b;




//for substraction
cla_32bit cla32_1(
.v(v1),
.c_out(c_out1),
.r(substruction_result),
.a(mux_out1),
.b(mux_out2),
.less_i(32'b0),
.c_in(1'b1),
.ALUop(3'b110)
);


//for comparison. if mux_out1 < mux_out2 then comparison result become 1.
cla_32bit cla32_2(
.v(v2),
.c_out(c_out2),
.r(comparison_result),
.a(mux_out1),
.b(mux_out2),
.less_i(32'b0),
.c_in(1'b1),
.ALUop(3'b100)
);

assign is_less = comparison_result[0];
assign result = temp;


endmodule