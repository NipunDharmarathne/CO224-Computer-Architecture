// Computer Architecture (CO224) - Lab 05
// Design: Integrated CPU module for Simple Processor
// Author: Group 27
// Members: E/18/077 Nipun Dharmarathne
// 			E/18/227 Dinuka Mudalige
// Date: 20/01/2022

`include "decoder.v"
`include "pc.v"
`include "pc_adder.v"
`include "pc_adder_jbeq.v"
`include "reg_file.v" 
`include "twos_comp.v" 
`include "mux2to1.v"  
`include "alu.v" 
`include "control_unit.v" 
`include "sign_extend.v"
`include "shifter.v"
`include "mux2to1_32bit.v"

module cpu (
	output[31:0] PC, 
	input[31:0] INSTRUCTION, 
	input CLK, 
	input RESET);

	wire [7:0] IMMEDIATE, OPCODE, OFFSET_8BIT;
	wire [2:0] READREG1, READREG2, WRITEREG;
	decoder group27Decorder (INSTRUCTION, OPCODE, IMMEDIATE, READREG2, READREG1, WRITEREG, OFFSET_8BIT);
	
	wire MUXCOMPSELECT, MUXIMMSELECT, WRITEENABLE, J_TRIGGER, BEQ_TRIGGER, BNE_TRIGGER;
	wire [2:0] ALUOP;                                   
	control_unit group27ControlUnit (OPCODE, ALUOP, WRITEENABLE, MUXCOMPSELECT, MUXIMMSELECT, J_TRIGGER, BEQ_TRIGGER, BNE_TRIGGER);
	
	wire [7:0] REGOUT1, REGOUT2, ALURESULT;
	reg_file group27RegisterFile (ALURESULT, REGOUT1, REGOUT2, WRITEREG, READREG1, READREG2, WRITEENABLE, CLK, RESET);	
	
	wire [7:0] COMPLIMENT;
	twos_comp group27TwosCompliment (REGOUT2,COMPLIMENT);
	
	wire [7:0] MUXCOMPOUT;
	mux2to1 group27MUXCompliment (REGOUT2, COMPLIMENT, MUXCOMPOUT, MUXCOMPSELECT);
	
	wire [7:0] MUXIMMOUT;
	mux2to1 group27MUXImmediate (MUXCOMPOUT, IMMEDIATE, MUXIMMOUT, MUXIMMSELECT);
	
	wire ZERO;
	alu group27ALU (REGOUT1, MUXIMMOUT, ALUOP, ALURESULT, ZERO);
	
	wire [31:0] OFFSET_32BIT;
	sign_extend group27SignExtend(OFFSET_8BIT, OFFSET_32BIT);
	
	wire [31:0] OFFSET_32BIT_SHIFTED;
	shifter group27Shifter(OFFSET_32BIT, OFFSET_32BIT_SHIFTED);
	
	wire IS_BEQ;
	wire IS_BNE;	
	wire IS_J_OR_BEQ;
	assign IS_BEQ=BEQ_TRIGGER&ZERO;
	assign IS_BNE=~ZERO&BNE_TRIGGER;
	assign IS_J_OR_BEQ=J_TRIGGER|IS_BEQ|IS_BNE;
	
	wire [31:0] PCOUT;
	wire [31:0] PCOUT_JBeq;
	wire [31:0] PCOUT_EXECUTING;	
	pc_adder group27PCAdder (PC, PCOUT);
	
	pc_adder_jbeq group27PCAdderJBeq (PCOUT, INSTRUCTION, OFFSET_32BIT_SHIFTED, PCOUT_JBeq);
	
	mux2to1_32bit group27Mux2to1_32bit (PCOUT, PCOUT_JBeq, PCOUT_EXECUTING, IS_J_OR_BEQ);
	
	pc group27ProgramCounter (PC, RESET, CLK, PCOUT_EXECUTING);
	
endmodule