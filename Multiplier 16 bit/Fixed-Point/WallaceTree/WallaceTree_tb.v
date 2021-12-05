`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   08:25:29 07/08/2021
// Design Name:   WallaceTree16bit
// Module Name:   C:/Users/anhhu/Documents/Xilinx/Doan1/WallaceTree16bit/WallaceTree16biit/WallaceTree_tb.v
// Project Name:  WallaceTree16biit
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: WallaceTree16bit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module WallaceTree_tb;

	// Inputs
	reg [15:0] A;
	reg [15:0] B;

	// Outputs
	wire [31:0] prod;
	integer i,j = 0;
	// Instantiate the Unit Under Test (UUT)
	WallaceTree16bit uut (
		.A(A), 
		.B(B), 
		.prod(prod)
	);
	
initial begin
$dumpfile("WallaceTree16bit.vcd");
$dumpvars();
end

	initial begin
        for(i=0;i <= 65535;i = i+1)
            for(j=0;j <=65535;j = j+1) 
            begin
                A <= i; 
                B <= j;
                #10;
            end 
	$stop;
	end
      
endmodule

