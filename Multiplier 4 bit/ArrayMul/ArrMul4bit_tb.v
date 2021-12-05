`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:44:17 08/03/2021
// Design Name:   ArrayMul4bit
// Module Name:   C:/Users/anhhu/Documents/Xilinx/Doan1_Final/ArrayMul4bit/ArrMul4bit_tb.v
// Project Name:  ArrayMul4bit
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ArrayMul4bit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ArrMul4bit_tb;

	// Inputs
	reg [3:0] A;
	reg [3:0] B;

	// Outputs
	wire [7:0] prod;
	integer i,j;
	// Instantiate the Unit Under Test (UUT)
	ArrayMul4bit uut (
		.A(A), 
		.B(B), 
		.prod(prod)
	);
	
	initial begin
$dumpfile("ArrMul.vcd");
$dumpvars();
end	

	initial begin
        for(i=0;i <= 15;i = i+1)
            for(j=0;j <=15;j = j+1) 
            begin
                A <= i; 
                B <= j;
                #10;
            end 
	$stop;
	end
      
endmodule

