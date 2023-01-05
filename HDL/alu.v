module ALU (
	 input  [1:0]  ALU_OPE,
    input  [31:0] SRC_A,
    input  [31:0] SRC_B,
	 output [31:0] RES
);

assign RES = 
  (ALU_OPE == 2'b00) ? SRC_A + SRC_B :
  (ALU_OPE == 2'b10) ? SRC_A | SRC_B :
  SRC_A + SRC_B;

endmodule
