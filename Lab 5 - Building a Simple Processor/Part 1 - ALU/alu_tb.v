// Computer Architecture (CO224) - Lab 05 - Part 1
// Design: ALU - Testbench
// Group Number : 27
// E Numbers : E/18/077, E/18/227
// Names : Dharmarathne N.S., Mudalige D.H.
// Date: 09 January 2022

/**********************************************************************************/
// Define the stimulus module
module alu_tb;
	// Declarations of reg & wire
    reg [7:0] OPERAND1,OPERAND2;
	reg [2:0] ALUOP;
    wire [7:0] ALURESULT;
	
	// Instantiate module
	// In this case, instantiate alu
    alu myalu(OPERAND1,OPERAND2, ALUOP, ALURESULT);

	// Behavioural block, initial
    initial
    begin
	  // To display the results
      $monitor($time," OPERAND1: %b, OPERAND2: %b, ALUOP: %b, ALURESULT: %b",OPERAND1,OPERAND2,ALUOP,ALURESULT);
      $dumpfile("wavedata.vcd");
      $dumpvars(0,myalu);
    end

    initial
    begin
	  ALUOP = 3'b000;
      OPERAND1= 8'b00000111;
      OPERAND2= 8'b00111011;
	  
	  #5
	  ALUOP = 3'b001;
	  OPERAND1= 8'b00000001;
      OPERAND2= 8'b00000011;
	  
	  #5
	  ALUOP = 3'b010;
      OPERAND1= 8'b01010001;
      OPERAND2= 8'b01110011;
	  
	  #5
	  ALUOP = 3'b011;
      OPERAND1= 8'b01100101;
      OPERAND2= 8'b00110011;
    end
endmodule	// endmodule statement