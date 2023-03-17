// Computer Architecture (CO224) - Lab 05
// Design: Program Count Module
// Group Number : 27
// E Numbers : E/18/077, E/18/227
// Names : Dharmarathne N.S., Mudalige D.H.
// Date: 24/01/2022

module pc (
	output[31:0] PCOUT,
    input RESET,
    input CLK);

	reg[31:0] PCOUT;
	wire [2:0] OFFSET;

	pc_adder myPCAdder (PCOUT, OFFSET);
	
	always @(posedge CLK) begin
		if (RESET) begin	// when resetting the pc,
			// write zero to pc value instead of the next pc value 
			// with a delay of 1 time unit
			#1 PCOUT = 0;  
		end
	end

	always @(posedge CLK) begin
		//pc write delay
	    #1 PCOUT = PCOUT + OFFSET;
	end

endmodule