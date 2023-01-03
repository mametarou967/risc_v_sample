module risc_v_top_tb1();

// 上位変数
reg CLK;
reg RST;
reg  [3:0] SW;
wire [6:0] HEX0;
wire [31:0] PC;
wire [31:0] INST_DATA;
wire [31:0] REGISTER_READ_DATA1;
wire [31:0] REGISTER_READ_DATA2;
wire [31:0] IMM_EXTR;
wire [31:0] ALU_RES;
wire [31:0] DATA_READ_DATA;
wire REG_WRITE;
wire IMM_SRC;
wire MEM_WRITE;

RISC_V_UNDER_TOP risc_v_under_top_unit(
 .CLK(CLK),
 .RST(RST),
 .SW(SW),
 .HEX0(HEX0),
 .PC(PC),
 .INST_DATA(INST_DATA),
 .REGISTER_READ_DATA1(REGISTER_READ_DATA1),
 .REGISTER_READ_DATA2(REGISTER_READ_DATA2),
 .IMM_EXTR(IMM_EXTR),
 .ALU_RES(ALU_RES),
 .DATA_READ_DATA(DATA_READ_DATA),
 .REG_WRITE(REG_WRITE),
 .IMM_SRC(IMM_SRC),
 .MEM_WRITE(MEM_WRITE));

initial SW= 0;

initial begin
    RST = 1;
# 7500 RST = 0;
end

initial begin 
    CLK = 0;
end
always #5000
    CLK <= ~CLK;

endmodule