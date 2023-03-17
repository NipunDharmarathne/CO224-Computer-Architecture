// Computer Architecture (CO224) - Lab 05
// Design: Control Unit for Integrated CPU module
// Author: Group 27
// Members: E/18/077 Nipun Dharmarathne
// 			E/18/227 Dinuka Mudalige
// Date: 20/01/2022

module control_unit (
	input[7:0] OPCODE, 
	output[2:0] ALUOP, 
	output WRITEENABLE, 
	output MUXCOMP, 
	output MUXIMM,
	output J_TRIGGER, 
	output BEQ_TRIGGER);
	// Here, 
	// MUXCOMP --> Multiplexer associate with 2's Complement Operation
	// MUXIMM --> Multiplexer associate with IMMEDIATE
	reg WRITEENABLE, MUXCOMP, MUXIMM, J_TRIGGER, BEQ_TRIGGER;
	reg[2:0] ALUOP;

always @(OPCODE) begin
	//decoding the opcodes
	case(OPCODE)
		8'b00000000: begin #1			// op_loadi
				ALUOP = 3'b000;
				MUXCOMP = 1'b0;
				MUXIMM = 1'b1;
				WRITEENABLE = 1'b1;
				J_TRIGGER = 1'b0;
				BEQ_TRIGGER = 1'b0;
			end

		8'b00000001: begin #1			// op_mov
				ALUOP = 3'b000;
				MUXCOMP = 1'b0;
				MUXIMM = 1'b0;
				WRITEENABLE = 1'b1;
				J_TRIGGER = 1'b0;
				BEQ_TRIGGER = 1'b0;
			end

		8'b00000010: begin #1			// op_add
				ALUOP = 3'b001;
				MUXCOMP = 1'b0;
				MUXIMM = 1'b0;
				WRITEENABLE = 1'b1;
				J_TRIGGER = 1'b0;
				BEQ_TRIGGER = 1'b0;
			end

		8'b00000011: begin #1			// op_sub
				ALUOP = 3'b001;
				MUXCOMP = 1'b1;
				MUXIMM = 1'b0;
				WRITEENABLE = 1'b1;
				J_TRIGGER = 1'b0;
				BEQ_TRIGGER = 1'b0;				
			end

		8'b00000100: begin #1			// op_and
				ALUOP = 3'b010;
				MUXCOMP = 1'b0;
				MUXIMM = 1'b0;
				WRITEENABLE = 1'b1;
				J_TRIGGER = 1'b0;
				BEQ_TRIGGER = 1'b0;				
			end

		8'b00000101: begin #1			// op_or
				ALUOP = 3'b011;
				MUXCOMP = 1'b0;
				MUXIMM = 1'b0;
				WRITEENABLE = 1'b1;
				J_TRIGGER = 1'b0;
				BEQ_TRIGGER = 1'b0;				
			end	

		8'b00000110: begin #1			// op_j
				MUXCOMP = 1'b0;
				MUXIMM = 1'b0;
				WRITEENABLE = 1'b0;
				J_TRIGGER = 1'b1;
				BEQ_TRIGGER = 1'b0;				
			end	
			
		8'b00000111: begin #1			// op_beq
				ALUOP = 3'b001;
				MUXCOMP = 1'b1;
				MUXIMM = 1'b0;
				WRITEENABLE = 1'b0;
				J_TRIGGER = 1'b0;
				BEQ_TRIGGER = 1'b1;
			end				
	endcase        
	end
endmodule