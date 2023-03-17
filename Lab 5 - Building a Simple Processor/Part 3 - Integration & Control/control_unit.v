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
	output MUXIMM);
	// Here, 
	// MUXCOMP --> Multiplexer associate with 2's Complement Operation
	// MUXIMM --> Multiplexer associate with IMMEDIATE
	reg WRITEENABLE, MUXCOMP, MUXIMM;
	reg[2:0] ALUOP;

always @(OPCODE) begin
	//decoding the opcodes
	case(OPCODE)
		8'b00000000: begin			// op_loadi
				ALUOP = 3'b000;
				MUXCOMP = 1'b0;
				MUXIMM = 1'b1;
				WRITEENABLE = 1'b1;
			end

		8'b00000001: begin			// op_mov
				ALUOP = 3'b000;
				MUXCOMP = 1'b0;
				MUXIMM = 1'b1;
				WRITEENABLE = 1'b1;  
			end

		8'b00000010: begin			// op_add
				ALUOP = 3'b001;
				MUXCOMP = 1'b0;
				MUXIMM = 1'b1;
				WRITEENABLE = 1'b1;
			end

		8'b00000011: begin			// op_sub
				ALUOP = 3'b001;
				MUXCOMP = 1'b0;
				MUXIMM = 1'b0;
				WRITEENABLE = 1'b1;
			end

		8'b00000100: begin			// op_and
				ALUOP = 3'b010;
				MUXCOMP = 1'b0;
				MUXIMM = 1'b1;
				WRITEENABLE = 1'b1;
			end

		8'b00000101: begin			// op_or
				ALUOP = 3'b011;
				MUXCOMP = 1'b0;
				MUXIMM = 1'b1;
				WRITEENABLE = 1'b1;
			end

        default: begin
            MUXCOMP = 1'b0; 	// Disabling the output for a sub instruction
            MUXIMM = 1'b0; 	// Disabling the trigger for an immediate value
            WRITEENABLE = 1'b0; 	// Disabling the written enable signal
            end			     
	endcase        
	end
	
endmodule