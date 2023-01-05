module ALU_SRC_SELECTOR(
	input ALU_SRC_SEL,
	input [31:0] REGISTERE_READ_DATA,
	input [31:0] EXTENDED_IMM_DATA,
	output [31:0] ALU_SRC_B
);

assign ALU_SRC_B = (ALU_SRC_SEL == 1'b0) ?
	REGISTERE_READ_DATA :
	EXTENDED_IMM_DATA;

endmodule
	