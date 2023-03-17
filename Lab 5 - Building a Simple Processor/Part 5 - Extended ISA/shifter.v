// Computer Architecture (CO224) - Lab 05
// Design: Module to shift
// Group Number : 27
// E Numbers : E/18/077, E/18/227
// Names : Dharmarathne N.S., Mudalige D.H.
// Date: 24/01/2022

module shifter(
    input [31:0] OFFSET,
	output reg [31:0] OFFSET_SHIFTED);
	
	always @(OFFSET) begin
		OFFSET_SHIFTED=OFFSET<<2;
	end	  
endmodule	