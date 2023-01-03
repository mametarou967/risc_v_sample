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

wire [6:0] a = HEX0;

RISC_V_UNDER_TOP risc_v_under_top(
	.CLK(CLK),
	.RST(RST),
	.SW(SW),
	.HEX0(a));
	
endmodule