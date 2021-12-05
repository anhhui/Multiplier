`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:32:58 06/23/2021
// Design Name:   Multiplication
// Module Name:   C:/Users/anhhu/Documents/Xilinx/Doan1/FloatingPoint16bit_test/FP16bit_tb.v
// Project Name:  FloatingPoint16bit_test
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Multiplication
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module FP16bit_tb;

	// Inputs
	reg [15:0] a_operand;
	reg [15:0] b_operand;

	// Outputs
	wire Exception;
	wire Overflow;
	wire Underflow;
	wire [15:0] result;

	// Instantiate the Unit Under Test (UUT)
	FP16bit_Vedic uut (
		.a_operand(a_operand), 
		.b_operand(b_operand), 
		.Exception(Exception), 
		.Overflow(Overflow), 
		.Underflow(Underflow), 
		.result(result)
	);
	
initial begin
$dumpfile("FP16bit-Vedic.vcd");
$dumpvars();
end	

	initial begin
		// Initialize Inputs
		a_operand = 0;
		b_operand = 0;

		// Wait 100 ns for global reset to finish
      a_operand = 16'b0100100010101000;
		b_operand = 16'b0011101100010100;
		#10;
      a_operand = 16'b0100101010101100;
		b_operand = 16'b1100011100010011;
		#10;
      a_operand = 16'b1100110010000000;
		b_operand = 16'b0100100011000000;
		#10;
		b_operand = 0;		
		for (a_operand=1 ;a_operand <= 65535 ; a_operand = a_operand +1)
			begin
				b_operand = b_operand +1;
				#10;
			end
		$stop;

	end
      
endmodule
