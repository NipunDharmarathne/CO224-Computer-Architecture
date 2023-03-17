// Computer Architecture (CO224) - Lab 05
// Design: 2's Compliment Module
// Group Number : 27
// E Numbers : E/18/077, E/18/227
// Names : Dharmarathne N.S., Mudalige D.H.
// Date: 24/01/2022

module twos_comp (IN, COMPLIMENT);
	input [7:0] IN;
	output reg [7:0] COMPLIMENT;
	reg [7:0] TEMP;
	
	always @(IN) begin
		TEMP = ~IN + 8'b00_000_001;
		#1 COMPLIMENT = TEMP;
	end
endmodule