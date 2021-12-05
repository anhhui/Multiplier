`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:53:51 08/04/2021
// Design Name:   BoothMulti
// Module Name:   C:/Users/anhhu/Documents/Xilinx/Doan1_Final/Booth4bit/Booth4bit_tb.v
// Project Name:  Baugh4bit
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: BoothMulti
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Booth4bit_tb;

	// Inputs
	reg [3:0] X;
	reg [3:0] Y;

	// Outputs
	wire [7:0] Z;
	integer i,j;
	// Instantiate the Unit Under Test (UUT)
	BoothMulti uut (
		.X(X), 
		.Y(Y), 
		.Z(Z)
	);

initial begin
$dumpfile("Booth.vcd");
$dumpvars();
end	
	initial begin
        for(i=0;i <= 15;i = i+1)
            for(j=0;j <=15;j = j+1) 
            begin
                X <= i; 
                Y <= j;
                #10;
            end 
	$stop;
	end
      
endmodule

