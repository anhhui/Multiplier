`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:55:50 08/15/2021
// Design Name:   Dadda4bit
// Module Name:   C:/Users/anhhu/Documents/Xilinx/Doan1/Dadda4bit/Dadda4bit_tb.v
// Project Name:  Dadda4bit
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Dadda4bit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Dadda4bit_tb;

	// Inputs
	reg [3:0] A;
	reg [3:0] B;

	// Outputs
	wire [7:0] prod;
	integer i,j;
	// Instantiate the Unit Under Test (UUT)
	Dadda4bit uut (
		.A(A), 
		.B(B), 
		.prod(prod)
	);
	initial begin
$dumpfile("Dadda.vcd");
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

