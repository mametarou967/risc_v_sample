module REGISTER_FILE (
	input CLK,
	input RST,
	input [4:0] ADDRESS1,
	input [4:0] ADDRESS3,
	input [31:0] WRITE_DATA3,
	output [31:0] READ_DATA1	
);

reg [31:0] ram[0:31];

assign READ_DATA1 = ram[ADDRESS1];

initial begin
	ram[32'd5] = 32'd6;
	ram[32'd9] = 32'h2004;
end

always @ (posedge CLK) begin
  if(!RST)
    ram[ADDRESS3] <= WRITE_DATA3;
end

endmodule