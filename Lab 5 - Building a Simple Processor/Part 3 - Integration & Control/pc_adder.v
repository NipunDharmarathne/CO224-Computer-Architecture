// Computer Architecture (CO224) - Lab 05
// Design: Dedicated Adder for PC Increment
// Group Number : 27
// E Numbers : E/18/077, E/18/227
// Names : Dharmarathne N.S., Mudalige D.H.
// Date: 24/01/2022

module pc_adder (
	input[31:0] PC,
	output[31:0] OFFSET);

	reg[31:0] OFFSET;

	always @(PC) begin
		// default offset(4 bit) is set 
		// with time delay of 1 time unit
		#1 OFFSET = 4;
	end

endmodule