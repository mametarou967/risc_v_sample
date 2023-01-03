module PC(
	input CLK,
	input RST,
	output [31:0] currentPC
);

reg [31:0] pc;

always @ (posedge CLK) begin
  if(RST)
    pc <= 32'h1000;
  else
    pc <= pc + 32'd4;
end

assign currentPC = pc;

endmodule
