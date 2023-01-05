module CONTROL_UNIT (
	input [6:0] OPE_CODE,
	output REG_WRITE,
	output IMM_SRC,
	output ALU_SRC_SEL,
	output [1:0] ALU_OPE,
	output MEM_WRITE,
	output RESULT_SRC_SEL
	);
	

assign REG_WRITE = 
	(OPE_CODE == 7'h03) ? 1'b1 :
	(OPE_CODE == 7'h33) ? 1'b1 :
								 1'b0;

assign IMM_SRC   = (OPE_CODE == 7'h23) ? 1'b1 : 1'b0;

assign ALU_SRC_SEL = (OPE_CODE == 7'h33) ? 1'b0 : 1'b1;

assign ALU_OPE = (OPE_CODE == 7'h33) ? 2'b10 : 2'b00;

assign MEM_WRITE = (OPE_CODE == 7'h23) ? 1'b1 : 1'b0;

assign RESULT_SRC_SEL = (OPE_CODE == 7'h33) ? 1'b0 : 1'b1;

endmodule 