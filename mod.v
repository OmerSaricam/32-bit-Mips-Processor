
module mod(
input [31:0] a,
input [31:0] b,
input reset,
input CLK,
output [31:0] result
);

wire we, s, is_less, is_okey_to_send_result;
wire [31:0] temp_result;

mod_cu cu1(
    .reset(reset),
	.CLK(CLK),
	.is_less(is_less),
	.we(we),  
	.s(s),
	.result(is_okey_to_send_result)
);


mod_dp dp1(
    .CLK(CLK),
	.s(s),
	.we(we), //write signal girer
	.a(a),
	.b(b),
	.is_less(is_less),  
    .result(temp_result)
);


assign result = is_okey_to_send_result ? temp_result : 32'b0;


endmodule


