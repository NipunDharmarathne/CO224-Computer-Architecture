// Computer Architecture (CO224) - Lab 05
// Design: 2 to 1 Multiplexer module
// Group Number : 27
// E Numbers : E/18/077, E/18/227
// Names : Dharmarathne N.S., Mudalige D.H.
// Date: 24/01/2022

module mux2to1(IN1, IN2, OUT, SELECT);
	input [7:0] IN1, IN2;
	input SELECT;
	output [7:0] OUT;
	assign OUT = (SELECT) ? IN1 : IN2;
endmodule