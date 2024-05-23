
module register_block (
output reg [31:0] read_data1,
output reg [31:0] read_data2,
input byteOperations, //(This is an optional signal for lb and sb operations)
input [31:0] write_data,
input [4:0] read_reg1,
input [4:0] read_reg2, 
input [4:0] write_reg, 
input regWrite
);



	reg [31:0] registers [31:0];
	
	initial begin
		$readmemb("registerMemory.mem", registers);
        //$display("RegisterMemory initalize edildi!!\n");
	end


    always@(*) begin
        if(regWrite) begin
            registers[write_reg] = write_data;
            //$display("write_data value: %b\n", write_data);
        end
        //$display("Register içinde always'e girdim!!\n");

        read_data1 = registers[read_reg1];
        read_data2 = registers[read_reg2];
        $writememb("registerMemory.mem",registers);
    end


endmodule
