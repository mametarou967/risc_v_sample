module INST_MEMORY (
	 input		 CLK,
    input       [31:0] ADDRESS,
    output 		 [31:0] DATA
);

reg[31:0] rom[0:4095];

assign DATA = rom[ADDRESS[13:2]];

initial begin
	rom[12'h400] = 32'hFFC4A303;
	rom[12'h401] = 32'h0064A423;
	rom[12'h402] = 32'h0062E233;
	rom[12'h403] = 32'hFE420AE3;
end

endmodule
