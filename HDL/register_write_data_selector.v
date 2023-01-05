module REGISTER_WRITE_DATA_SELECTOR(
	input RESULT_SRC_SEL,
	input [31:0] ALU_RES_DATA,
	input [31:0] DATA_MEM_READ_DATA,
	output [31:0] OUT_DATA
);

assign OUT_DATA = (RESULT_SRC_SEL == 1'b0) ?
	ALU_RES_DATA :
	DATA_MEM_READ_DATA;

endmodule