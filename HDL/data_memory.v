module DATA_MEMORY (
	 input		 CLK,
	 input		 MEM_WRITE,
    input       [31:0] ADDRESS,
	 input		 [31:0] WRITE_DATA,
    output 		 [31:0] READ_DATA
);

reg[31:0] ram[0:4095];

always @ (posedge CLK)
  if(MEM_WRITE)
    ram[ADDRESS[13:2]] <= WRITE_DATA;

assign DATA = ram[ADDRESS[13:2]];

initial begin
	ram[12'h800] = 32'd10;
end

endmodule