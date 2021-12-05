`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:18:23 06/29/2021
// Design Name:   Multiplier16bit
// Module Name:   C:/Users/anhhu/Documents/Xilinx/Doan1/Multipler16bit/Multiplier16bit_tb.v
// Project Name:  Multipler16bit
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Multiplier16bit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Multiplier16bit_tb;

	// Inputs
	reg [15:0] x;
	reg [15:0] y;

	// Outputs
	wire [31:0] out;
	integer i,j = 0;
	// Instantiate the Unit Under Test (UUT)
	Multiplier16bit uut (
		.x(x), 
		.y(y), 
		.out(out)
	);

initial begin
$dumpfile("Multiplier16bit.vcd");
$dumpvars();
end
	initial begin

        for(i=0;i <= 65535;i = i+1)
            for(j=0;j <=65535;j = j+1) 
            begin
                x <= i; 
                y <= j;
                #10;

            end 
				$stop; 
	end
      
endmodule

