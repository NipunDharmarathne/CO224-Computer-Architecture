// Computer Architecture (CO224) - Lab 05
// Design: Integrated CPU module for Simple Processor
// Author: Group 27
// Members: E/18/077 Nipun Dharmarathne
// 			E/18/227 Dinuka Mudalige
// Date: 20/01/2022

module cpu (
	output[31:0] PC, 
	input[31:0] INSTRUCTION, 
	input CLK, 
	input RESET);

	wire [7:0] REGOUT1, REGOUT2, COMPLIMENT, MUXCOMPOUT, MUXIMMOUT, ALURESULT;
	reg [7:0] IMMEDIATE, OPCODE;
	wire [2:0] ALUOP;
	reg [2:0] READREG1, READREG2, WRITEREG;
	wire MUXCOMPSELECT, MUXIMMSELECT, WRITEENABLE;
	wire [31:0] PC;

	always @(INSTRUCTION) begin
		READREG2 = INSTRUCTION[2:0];
		READREG1 = INSTRUCTION[10:8];
		WRITEREG = INSTRUCTION[18:16];
		IMMEDIATE = INSTRUCTION[7:0];
		#1 OPCODE = INSTRUCTION[31:24];
	end

	// assign PC = 32'b0000_0000_0000_0000_0000_0000_0000_0000;
	pc group27ProgramCounter (PC, RESET, CLK);
	reg_file group27RegisterFile (ALURESULT, REGOUT1, REGOUT2, WRITEREG, READREG1, READREG2, WRITEENABLE, CLK, RESET);
	twos_comp group27TwosCompliment (REGOUT2,COMPLIMENT);
	mux2to1 group27MUXCompliment (REGOUT2, COMPLIMENT, MUXCOMPOUT, MUXCOMPSELECT);
	mux2to1 group27MUXImmediate (IMMEDIATE, MUXCOMPOUT, MUXIMMOUT, MUXIMMSELECT);
	alu group27ALU (MUXIMMOUT, REGOUT1, ALUOP, ALURESULT);
	control_unit group27ControlUnit (OPCODE, ALUOP, WRITEENABLE, MUXCOMPSELECT, MUXIMMSELECT);
	
endmodule