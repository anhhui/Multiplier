`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:22:53 08/05/2021
// Design Name:   Multiplier4bit
// Module Name:   C:/Users/anhhu/Documents/Xilinx/Doan1_Final/Vedic4bit/Vedic4bit_tb.v
// Project Name:  Vedic4bit
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Multiplier4bit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Vedic4bit_tb;

	// Inputs
	reg [3:0] x;
	reg [3:0] y;

	// Outputs
	wire [7:0] out;
	integer i,j;
	// Instantiate the Unit Under Test (UUT)
	Multiplier4bit uut (
		.x(x), 
		.y(y), 
		.out(out)
	);

	initial begin
$dumpfile("Vedic4bit.vcd");
$dumpvars();
end	

	initial begin
        for(i=0;i <= 15;i = i+1)
            for(j=0;j <=15;j = j+1) 
            begin
                x <= i; 
                y <= j;
                #10;
//					 j = j+1;
            end 
	$stop;
	end
      
endmodule

