module risc_v_top_tb1();

// 上位変数
reg clk;
reg rst;
reg [3:0] sw;
wire [6:0] hex0;

RISC_V_TOP risc_v_top_unit(.CLK(clk),.RST(rst),.SW(sw),.HEX0(hex0));

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