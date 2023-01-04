/* Copyright(C) 2017 Cobac.Net All Rights Reserved. */
/* chapter: 第2章                                   */
/* project: SEG7DEC                                 */
/* outline: スイッチ入力による7セグメントLED表示    */

module RISC_V_UNDER_TOP (
	 input		 CLK,
	 input		 RST,
    input       [3:0]   SW,
    output      [6:0]   HEX0,
	 output 		 [31:0]  PC,
	 output		 [31:0]  INST_DATA,
	 output      [31:0]  REGISTER_READ_DATA1,
	 output      [31:0]  REGISTER_READ_DATA2,
	 output		 [31:0]  IMM_EXTR,
	 output		 [31:0]	ALU_RES,
	 output		 [31:0]  DATA_READ_DATA,
	 output      REG_WRITE,
	 output      IMM_SRC,
	 output      MEM_WRITE,
	 output		 [6:0] OPECODE,
	 output		 [4:0] REGISTER_ADDRESS1,
	 output		 [4:0] REGISTER_ADDRESS2,
	 output		 [4:0] REGISTER_ADDRESS3
);

wire [31:0] pc;
wire [31:0] inst_data;
wire [31:0] register_read_data1;
wire [31:0] register_read_data2;
wire [31:0] imm_extr;
wire [31:0] alu_res;
wire [31:0] data_read_data;
wire reg_write;
wire imm_src;
wire mem_write;

assign HEX0 = inst_data[6:0];
assign PC = pc;
assign INST_DATA = inst_data;
assign REGISTER_READ_DATA1 = register_read_data1;
assign REGISTER_READ_DATA2 = register_read_data2;
assign IMM_EXTR = imm_extr;
assign ALU_RES = alu_res;
assign DATA_READ_DATA = data_read_data;
assign REG_WRITE = reg_write;
assign IMM_SRC = imm_src;
assign MEM_WRITE = mem_write;

assign OPECODE = inst_data[6:0];
assign REGISTER_ADDRESS1 = inst_data[19:15];
assign REGISTER_ADDRESS2 = inst_data[24:20];
assign REGISTER_ADDRESS3 = inst_data[11:7];



/* 7セグメント表示デコーダ              */
/* 各セグメントはgfedcbaの並びで0で点灯 */

PC pc_unit(
	.CLK(CLK),
	.RST(RST),
	.currentPC(pc));
	
INST_MEMORY inst_memory(
	.CLK(CLK),
	.ADDRESS(pc),
	.DATA(inst_data));

CONTROL_UNIT control_unit(
	.OPE_CODE(inst_data[6:0]),
	.REG_WRITE(reg_write),
	.IMM_SRC(imm_src),
	.MEM_WRITE(mem_write));

REGISTER_FILE register_file(
	.CLK(CLK),
	.RST(RST),
	.REG_WRITE(reg_write),
	.ADDRESS1(inst_data[19:15]),
	.ADDRESS2(inst_data[24:20]),
	.ADDRESS3(inst_data[11:7]),
	.WRITE_DATA3(data_read_data),
	.READ_DATA1(register_read_data1),
	.READ_DATA2(register_read_data2));
	
EXTENDER extendeer(
	.IMM_SRC(imm_src),
	.NONE_EXTENDED_DATA(inst_data[31:7]),
	.EXTENDED_DATA(imm_extr));
	
ALU alu(
	.SRC_A(register_read_data1),
	.SRC_B(imm_extr),
	.RES(alu_res));

DATA_MEMORY data_memory(
	.CLK(CLK),
	.MEM_WRITE(mem_write),
	.ADDRESS(alu_res),
	.WRITE_DATA(register_read_data2),
	.READ_DATA(data_read_data));

endmodule