module CONTROL_UNIT (
	input [6:0] OPE_CODE,
	output REG_WRITE,
	output IMM_SRC,
	output MEM_WRITE
	);
	
assign REG_WRITE = (REG_WRITE == 7'h03) ? 1'b1 : 1'b0;
assign IMM_SRC   = (IMM_SRC   == 7'h23) ? 1'b1 : 1'b0;
assign MEM_WRITE = (IMM_SRC   == 7'h23) ? 1'b1 : 1'b0;

endmodule 