module risc_v_top_tb1();

// 上位変数
reg clk;
reg rst;
reg [3:0] sw;
wire [6:0] hex0;
wire [6:0] hex1;
wire [6:0] hex2;
wire [6:0] hex3;
wire [6:0] hex4;
wire [6:0] hex5;

RISC_V_TOP risc_v_top_unit(
	.CLK(clk),
	.RST(rst),
	.SW(sw),
	.HEX0(hex0),
	.HEX1(hex1),
	.HEX2(hex2),
	.HEX3(hex3),
	.HEX4(hex4),
	.HEX5(hex5));

initial sw = 0;

initial begin
    rst = 1;
# 7500 rst = 0;
end

initial begin 
    clk = 0;
end
always #5000
    clk <= ~clk;

endmodule