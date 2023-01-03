module EXTENDER (
	input IMM_SRC, // 0:ld,1:sw
	input [31:7] NONE_EXTENDED_DATA,
	output [31:0] EXTENDED_DATA
);

wire ext_bit = NONE_EXTENDED_DATA[31];
wire [19:0] ext_bits = 
	{ ext_bit , ext_bit , ext_bit , ext_bit , ext_bit ,
	  ext_bit , ext_bit , ext_bit , ext_bit , ext_bit ,
	  ext_bit , ext_bit , ext_bit , ext_bit , ext_bit ,
	  ext_bit , ext_bit , ext_bit , ext_bit , ext_bit ,
	  ext_bit , ext_bit , ext_bit , ext_bit , ext_bit };


assign EXTENDED_DATA = (IMM_SRC == 1'b0) ?
	{ ext_bits , NONE_EXTENDED_DATA[31:20] } :
	{ ext_bits , NONE_EXTENDED_DATA[31:25] , NONE_EXTENDED_DATA[11:7] };

endmodule
	