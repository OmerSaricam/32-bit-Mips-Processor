
module memory_block (
    output reg [31:0] read_data,
    input byteOperations, // (This is an optional signal for lb and sb operations)
    input [17:0] address,
    input [31:0] write_data,
    input memRead,
    input memWrite
);
    //WARN! I reduced the memory to make it compile faster.
    //reg [7:0] mem_data [262143:0];  //For 256 kb
    reg [7:0] mem_data [63:0];

    initial begin
        $readmemb("dataMemory.mem", mem_data);
    end    

    always @(memRead or address) begin
        if (memRead) read_data <= {mem_data[address+3],mem_data[address+2], mem_data[address+1], mem_data[address]};
    end


    always @(*) begin
        if (memWrite) begin
            if(byteOperations) begin
                mem_data[address] = write_data[7:0];
            end
            else begin
                mem_data[address] = write_data[7:0];
                mem_data[address+1] = write_data[15:8];
                mem_data[address+2] = write_data[23:16];
                mem_data[address+3] = write_data[31:24];
            end
            $writememb("dataMemory.mem", mem_data);
        end
    end
endmodule
