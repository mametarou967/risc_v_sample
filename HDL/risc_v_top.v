/* Copyright(C) 2017 Cobac.Net All Rights Reserved. */
/* chapter: 第2章                                   */
/* project: SEG7DEC                                 */
/* outline: スイッチ入力による7セグメントLED表示    */

module RISC_V_TOP (
	 input		 CLK,
	 input		 RST,
    input       [3:0]   SW,
    output reg  [6:0]   HEX0,
	 output reg  [6:0]	HEX1,
	 output reg  [6:0]	HEX2,
	 output reg  [6:0]	HEX3,
	 output reg  [6:0]	HEX4,
	 output reg  [6:0]	HEX5
);

wire [31:0] pc;
wire [31:0] inst_data;
wire [31:0] register_read_data1;
wire [31:0] immExtr;
wire [31:0] alu_res;
wire [31:0] data_data;

/* 7セグメント表示デコーダ              */
/* 各セグメントはgfedcbaの並びで0で点灯 */

always @* begin
  HEX0 = pc[7:2];
  HEX1 = inst_data[6:0];
  HEX2 = register_read_data1[6:0];
  HEX3 = alu_res[6:0];
  HEX4 = data_data[6:0];
  HEX5 = {1'b0,inst_data[11:7]};
end


// assign HEX0 = pc[8:2];

PC pc_unit(.CLK(CLK),.RST(RST),.currentPC(pc));
INST_MEMORY inst_memory(.CLK(CLK),.ADDRESS(pc),.DATA(inst_data));
REGISTER_FILE register_file(.CLK(CLK),.RST(RST),.ADDRESS1(inst_data[19:15]),.ADDRESS3(inst_data[11:7]),.WRITE_DATA3(data_data),.READ_DATA1(register_read_data1));
EXTENDER extendeer(.NONE_EXTENDED_DATA(inst_data[31:20]),.EXTENDED_DATA(immExtr));
ALU alu(.SRC_A(register_read_data1),.SRC_B(immExtr),.RES(alu_res));
DATA_MEMORY data_memory(.CLK(CLK),.ADDRESS(alu_res),.DATA(data_data));

/*

	input CLK,
	input RST,
	input [4:0] ADDRESS1,
	input [4:0] ADDRESS3,
	input [31:0] WRITE_DATA3,
	output [31:0] READ_DATA1	
	*/

endmodule