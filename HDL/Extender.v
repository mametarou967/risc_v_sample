module EXTENDER (
	input [11:0] NONE_EXTENDED_DATA,
	output [31:0] EXTENDED_DATA
);

wire ext_bit = NONE_EXTENDED_DATA[11];

assign EXTENDED_DATA = 
	{ ext_bit , ext_bit , ext_bit , ext_bit , ext_bit ,
	  ext_bit , ext_bit , ext_bit , ext_bit , ext_bit ,
	  ext_bit , ext_bit , ext_bit , ext_bit , ext_bit ,
	  ext_bit , ext_bit , ext_bit , ext_bit , ext_bit ,
	  ext_bit , ext_bit , ext_bit , ext_bit , ext_bit ,
	  NONE_EXTENDED_DATA } ;

endmodule
	