// Computer Architecture (CO224) - Lab 05
// Design: Dedicated Adder for jump/branch instruction
// Group Number : 27
// E Numbers : E/18/077, E/18/227
// Names : Dharmarathne N.S., Mudalige D.H.
// Date: 24/01/2022

module pc_adder_jbeq (
	input [31:0] PC,
    input [31:0] INSTRUCTION,
    input [31:0] OFFSET,
    output reg [31:0] PCOUT_JBeq);

    always @(INSTRUCTION) begin
		#2 PCOUT_JBeq=PC+OFFSET;
    end
endmodule