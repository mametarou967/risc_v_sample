module inst_memory_tb();

reg clk;
reg [31:00] address;
wire [31:0] data;

INST_MEMORY inst_memory_unit(.CLK(clk),.ADDRESS(address),.DATA(data));

// initial begin
//     rst = 1;
// # 7500 rst = 0;
// end

initial begin 
    clk = 0;
    address = 32'h1000;
end
always #5000
    clk <= ~clk;

always @ (posedge clk) address <= address + 32'h4;

endmodule



