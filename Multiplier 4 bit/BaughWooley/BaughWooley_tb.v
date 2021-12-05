`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:09:09 08/03/2021
// Design Name:   BaughWooley
// Module Name:   C:/Users/anhhu/Documents/Xilinx/Doan1_Final/BaughWooley/BaughWooley_tb.v
// Project Name:  BaughWooley
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: BaughWooley
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module BaughWooley_tb;

	// Inputs
	reg [3:0] A;
	reg [3:0] B;

	// Outputs
	wire [7:0] prod;
	integer i,j;
	// Instantiate the Unit Under Test (UUT)
	BaughWooley uut (
		.A(A), 
		.B(B), 
		.prod(prod)
	);
initial begin
$dumpfile("BaughWooley.vcd");
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

