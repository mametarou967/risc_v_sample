module DATA_MEMORY (
	 input		 CLK,
    input       [31:0] ADDRESS,
    output 		 [31:0] DATA
);

reg[31:0] ram[0:4095];

// always @ (posedge CLK) DATA <= rom[ADDRESS[11:2]];

assign DATA = ram[ADDRESS[13:2]];

initial begin
	ram[12'h800] = 32'd10;
end

endmodule