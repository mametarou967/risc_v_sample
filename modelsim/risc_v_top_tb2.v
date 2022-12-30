module risc_v_top_tb2();

reg clk;
reg rst;
wire [31:0] pc;

PC pc_unit(.CLK(clk),.RST(rst),.currentPC(pc));

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
