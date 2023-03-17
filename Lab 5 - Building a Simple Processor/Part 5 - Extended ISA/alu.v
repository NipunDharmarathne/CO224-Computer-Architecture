// Computer Architecture (CO224) - Lab 05 - Part 1
// Design: ALU
// Group Number : 27
// E Numbers : E/18/077, E/18/227
// Names : Dharmarathne N.S., Mudalige D.H.
// Date: 09 January 2022

/**********************************************************************************/
// Define the FORWARD module
module forwardForALU(DATA2, RESULT);
	// Port declarations
	input [7:0] DATA2;
	output [7:0] RESULT;
	assign #1 RESULT=DATA2;
endmodule	// endmodule statement

/**********************************************************************************/
// Define the ADD module
module addForALU(DATA1, DATA2, RESULT);
	// Port declarations
	input [7:0] DATA1, DATA2;
	output [7:0] RESULT;
	assign #2 RESULT=DATA1 + DATA2;
endmodule	// endmodule statement

/**********************************************************************************/
// Define the AND module
module andForALU(DATA1, DATA2, RESULT);
	// Port declarations
	input [7:0] DATA1, DATA2;
	output [7:0] RESULT;
	assign #1 RESULT=DATA1 & DATA2;
endmodule	// endmodule statement

/**********************************************************************************/
// Define the OR module
module orForALU(DATA1, DATA2, RESULT);
	// Port declarations
	input [7:0] DATA1, DATA2;
	output [7:0] RESULT;
	assign #1 RESULT=DATA1 | DATA2;
endmodule	// endmodule statement

/**********************************************************************************/
// Define the SHIFT module
module shiftLeftForALU(DATA1, DATA2, RESULT);
	// Port declarations
	input [7:0] DATA1, DATA2;
	output reg [7:0] RESULT;
	
	wire [2:0] TEMP = DATA2[2:0];
	wire [7:0] out;
	wire [7:0] x,y;

	always@(DATA1) begin
		#2 RESULT = out;
	end
	
		//4bit shift left
		mux2X1  mux_30 (DATA1[0],1'b0,TEMP[2],x[7]);
		mux2X1  mux_31 (DATA1[1],1'b0,TEMP[2],x[6]);
		mux2X1  mux_32 (DATA1[2],1'b0,TEMP[2],x[5]);
		mux2X1  mux_33 (DATA1[3],1'b0,TEMP[2],x[4]);
		mux2X1  mux_34 (DATA1[4],DATA1[0],TEMP[2],x[3]);
		mux2X1  mux_35 (DATA1[5],DATA1[1],TEMP[2],x[2]);
		mux2X1  mux_36 (DATA1[6],DATA1[2],TEMP[2],x[1]);
		mux2X1  mux_37 (DATA1[7],DATA1[3],TEMP[2],x[0]);
		
		//2 bit shift left
		mux2X1  mux_20 (x[7],1'b0,TEMP[1],y[7]);
		mux2X1  mux_21 (x[6],1'b0,TEMP[1],y[6]);
		mux2X1  mux_22 (x[5],x[7],TEMP[1],y[5]);
		mux2X1  mux_23 (x[4],x[6],TEMP[1],y[4]);
		mux2X1  mux_24 (x[3],x[5],TEMP[1],y[3]);
		mux2X1  mux_25 (x[2],x[4],TEMP[1],y[2]);
		mux2X1  mux_26 (x[1],x[3],TEMP[1],y[1]);
		mux2X1  mux_27 (x[0],x[2],TEMP[1],y[0]);
		
		//1 bit shift left
		mux2X1  mux_10 (y[7],1'b0,TEMP[0],out[0]);
		mux2X1  mux_11 (y[6],y[7],TEMP[0],out[1]);
		mux2X1  mux_12 (y[5],y[6],TEMP[0],out[2]);
		mux2X1  mux_13 (y[4],y[5],TEMP[0],out[3]);
		mux2X1  mux_14 (y[3],y[4],TEMP[0],out[4]);
		mux2X1  mux_15 (y[2],y[3],TEMP[0],out[5]);
		mux2X1  mux_16 (y[1],y[2],TEMP[0],out[6]);
		mux2X1  mux_17 (y[0],y[1],TEMP[0],out[7]);
endmodule	// endmodule statement



//module to perform logical shift right
module shiftRightForALU(DATA1, DATA2, RESULT);
	input [7:0] DATA1, DATA2;
	output reg [7:0] RESULT;
	
	wire [2:0] TEMP = DATA2[2:0];
	wire [7:0] out;
	wire [7:0] x,y;

 always@(DATA1) begin
    #2 RESULT = out;
 end
  //4bit shift right
  mux2X1  mux_30 (DATA1[7],1'b0,DATA2[2],x[7]);
  mux2X1  mux_31 (DATA1[6],1'b0,DATA2[2],x[6]);
  mux2X1  mux_32 (DATA1[5],1'b0,DATA2[2],x[5]);
  mux2X1  mux_33 (DATA1[4],1'b0,DATA2[2],x[4]);
  mux2X1  mux_34 (DATA1[3],DATA1[7],DATA2[2],x[3]);
  mux2X1  mux_35 (DATA1[2],DATA1[6],DATA2[2],x[2]);
  mux2X1  mux_36 (DATA1[1],DATA1[5],DATA2[2],x[1]);
  mux2X1  mux_37 (DATA1[0],DATA1[4],DATA2[2],x[0]);
  
  //2 bit shift right
  
  mux2X1  mux_20 (x[7],1'b0,DATA2[1],y[7]);
  mux2X1  mux_21 (x[6],1'b0,DATA2[1],y[6]);
  mux2X1  mux_22 (x[5],x[7],DATA2[1],y[5]);
  mux2X1  mux_23 (x[4],x[6],DATA2[1],y[4]);
  mux2X1  mux_24 (x[3],x[5],DATA2[1],y[3]);
  mux2X1  mux_25 (x[2],x[4],DATA2[1],y[2]);
  mux2X1  mux_26 (x[1],x[3],DATA2[1],y[1]);
  mux2X1  mux_27 (x[0],x[2],DATA2[1],y[0]);
  
  //1 bit shift right
  mux2X1  mux_10 (y[7],1'b0,DATA2[0],out[7]);
  mux2X1  mux_11 (y[6],y[7],DATA2[0],out[6]);
  mux2X1  mux_12 (y[5],y[6],DATA2[0],out[5]);
  mux2X1  mux_13 (y[4],y[5],DATA2[0],out[4]);
  mux2X1  mux_14 (y[3],y[4],DATA2[0],out[3]);
  mux2X1  mux_15 (y[2],y[3],DATA2[0],out[2]);
  mux2X1  mux_16 (y[1],y[2],DATA2[0],out[1]);
  mux2X1  mux_17 (y[0],y[1],DATA2[0],out[0]);
endmodule



//module to perform rotate right 
module rotateRightForALU(DATA1, DATA2, RESULT);
 	input [7:0] DATA1, DATA2;
	output reg [7:0] RESULT;
	
	wire [2:0] TEMP = DATA2[2:0];
	wire [7:0] out;
	wire [7:0] x,y;
 
    always@(DATA1) begin
        #2 RESULT = out;
    end
    //4bit rotate right
    mux2X1  mux_30 (DATA1[7],DATA1[3],DATA2[2],x[7]);
    mux2X1  mux_31 (DATA1[6],DATA1[2],DATA2[2],x[6]);
    mux2X1  mux_32 (DATA1[5],DATA1[1],DATA2[2],x[5]);
    mux2X1  mux_33 (DATA1[4],DATA1[0],DATA2[2],x[4]);
    mux2X1  mux_34 (DATA1[3],DATA1[7],DATA2[2],x[3]);
    mux2X1  mux_35 (DATA1[2],DATA1[6],DATA2[2],x[2]);
    mux2X1  mux_36 (DATA1[1],DATA1[5],DATA2[2],x[1]);
    mux2X1  mux_37 (DATA1[0],DATA1[4],DATA2[2],x[0]);
    
    //2 bit rotate right
    mux2X1  mux_20 (x[7],x[1],DATA2[1],y[7]);
    mux2X1  mux_21 (x[6],x[0],DATA2[1],y[6]);
    mux2X1  mux_22 (x[5],x[7],DATA2[1],y[5]);
    mux2X1  mux_23 (x[4],x[6],DATA2[1],y[4]);
    mux2X1  mux_24 (x[3],x[5],DATA2[1],y[3]);
    mux2X1  mux_25 (x[2],x[4],DATA2[1],y[2]);
    mux2X1  mux_26 (x[1],x[3],DATA2[1],y[1]);
    mux2X1  mux_27 (x[0],x[2],DATA2[1],y[0]);
    
    //1 bit rotate right
    mux2X1  mux_10 (y[7],y[0],DATA2[0],out[7]);
    mux2X1  mux_11 (y[6],y[7],DATA2[0],out[6]);
    mux2X1  mux_12 (y[5],y[6],DATA2[0],out[5]);
    mux2X1  mux_13 (y[4],y[5],DATA2[0],out[4]);
    mux2X1  mux_14 (y[3],y[4],DATA2[0],out[3]);
    mux2X1  mux_15 (y[2],y[3],DATA2[0],out[2]);
    mux2X1  mux_16 (y[1],y[2],DATA2[0],out[1]);
    mux2X1  mux_17 (y[0],y[1],DATA2[0],out[0]);
endmodule

//multiplexer module to select a bit out of two bits
module mux2X1( in0,in1,sel,out);
    input in0,in1;
    input sel;
    output out;

    assign out=(sel)?in1:in0;
endmodule


/**********************************************************************************/
// Define the SHIFT module
module multForALU(DATA1, DATA2, RESULT);
	// Port declarations
	input [7:0] DATA1, DATA2;
	output [7:0] RESULT;
	assign #1 RESULT=DATA1*DATA2;
endmodule	// endmodule statement


/**********************************************************************************/
// ALU 8-bit module 
module alu(DATA1, DATA2, SELECT, RESULT, ZERO);
	// Port declarations, Declarations of wire & reg
	input [7:0] DATA1, DATA2;
	input [2:0] SELECT;
	output reg [7:0] RESULT;
	output reg ZERO;
	wire [7:0] RESULT_FOR_FORWARD, RESULT_FOR_ADD, RESULT_FOR_AND, RESULT_FOR_OR, RESULT_FOR_SHIFTLEFT, RESULT_FOR_SHIFTRIGHT, RESULT_FOR_ROTATERIGHT, RESULT_FOR_MULT;
	
	// Instantiate modules
	forwardForALU forward_1(DATA2, RESULT_FOR_FORWARD);
	addForALU add_1(DATA1, DATA2, RESULT_FOR_ADD);
	andForALU and_1(DATA1, DATA2, RESULT_FOR_AND);
	orForALU or_1(DATA1, DATA2, RESULT_FOR_OR);
	shiftLeftForALU shiftLeft_1(DATA1, DATA2, RESULT_FOR_SHIFTLEFT);
	shiftRightForALU shiftRight_1(DATA1, DATA2, RESULT_FOR_SHIFTRIGHT);
	rotateRightForALU rotateRight_1(DATA1, DATA2, RESULT_FOR_ROTATERIGHT);
	multForALU mult_1(DATA1, DATA2, RESULT_FOR_MULT);
	
	// Select everytime DATA1, DATA2, SELECT updates
	always @(DATA1, DATA2, SELECT)
	begin
		// Select the function to implement using a case structure
		case(SELECT)
			3'b000:	//FORWARD
				assign RESULT=RESULT_FOR_FORWARD;
			3'b001:	//ADD
				assign RESULT=RESULT_FOR_ADD;
			3'b010:	//AND
				assign RESULT=RESULT_FOR_AND;
			3'b011:	//OR
				assign RESULT=RESULT_FOR_OR;
			3'b100:	//MULT
				assign RESULT=RESULT_FOR_MULT;				
			3'b101:	//SHIFTLEFT
				assign RESULT=RESULT_FOR_SHIFTLEFT;
			3'b110:	//SHIFTRIGHT
				assign RESULT=RESULT_FOR_SHIFTRIGHT;
			3'b111:	//ROTATERIGHT
				assign RESULT=RESULT_FOR_ROTATERIGHT;				
			default: RESULT=8'b00000000;	//DEFAULT
		endcase
	end
	
    always @(RESULT_FOR_ADD) begin
        if (RESULT_FOR_ADD == 8'b00000000) begin
            ZERO = 1'b1;
        end

        else begin
            ZERO = 1'b0;
        end
    end 	
endmodule	// endmodule statement