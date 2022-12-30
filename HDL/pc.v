module PC(
	input CLK,
	input RST,
	output reg[31:0] currentPC
);

always @ (posedge CLK) begin
	if(RST)
		currentPC <= 32'b0;
	else
		currentPC <= currentPC + 32'h00000004;
end

endmodule
