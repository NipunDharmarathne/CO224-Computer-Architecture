// Computer Architecture (CO224) - Lab 05
// Design: 2's Compliment Module
// Group Number : 27
// E Numbers : E/18/077, E/18/227
// Names : Dharmarathne N.S., Mudalige D.H.
// Date: 24/01/2022

module twos_comp (IN, COMPLIMENT);
	input [7:0] IN;
	output [7:0] COMPLIMENT;
	assign COMPLIMENT = ~IN + 8'b00000001;
endmodule