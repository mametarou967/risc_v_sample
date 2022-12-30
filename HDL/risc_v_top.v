/* Copyright(C) 2017 Cobac.Net All Rights Reserved. */
/* chapter: 第2章                                   */
/* project: SEG7DEC                                 */
/* outline: スイッチ入力による7セグメントLED表示    */

module RISC_V_TOP (
	 input		 CLK,
	 input		 RST,
    input       [3:0]   SW,
    output reg  [6:0]   HEX0
);

wire [31:0] pc;

/* 7セグメント表示デコーダ              */
/* 各セグメントはgfedcbaの並びで0で点灯 */

always @* begin
  HEX0 = pc[7:2];
end


// assign HEX0 = pc[8:2];

PC pc_unit(.CLK(CLK),.RST(RST),.currentPC(pc));
INST_MEMORY inst_memory(.CLK(CLK),.ADDRESS(pc));

endmodule