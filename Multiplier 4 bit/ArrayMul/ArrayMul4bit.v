`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:30:04 08/03/2021 
// Design Name: 
// Module Name:    ArrayMul4bit 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module ArrayMul4bit(A, B, prod
    );
    input [3:0] A,B;
    output [7:0] prod;
	 
	 wire [3:0] p0,p1,p2,p3;
	 
	 wire s0,s1,s2,s3,s4,s5,s6,s7,s8,s9,
			s10,s11,s12;
	 wire c1,c2,c3,c4,c5,c6,c7,c8,c9,
			c10,c11,c12;

	 assign  p0 = A & {4{B[0]}};
    assign  p1 = A & {4{B[1]}};
    assign  p2 = A & {4{B[2]}};
    assign  p3 = A & {4{B[3]}};
	
	 assign prod[0] = p0[0];
    assign prod[1] = s1;
    assign prod[2] = s4;
    assign prod[3] = s7;
    assign prod[4] = s10;
    assign prod[5] = s11;
    assign prod[6] = s12;
    assign prod[7] = c12;
	 
	 HalfAdder ha11(p1[0],p0[1],s1,c1);
	 HalfAdder ha12(p2[0],p1[1],s2,c2);
	 HalfAdder ha13(p3[0],p2[1],s3,c3);
	 
	 FullAdder fa21(s2,c1,p0[2],s4,c4);
	 FullAdder fa22(s3,c2,p1[2],s5,c5);
	 FullAdder fa23(p3[1],c3,p2[2],s6,c6);
	 
	 FullAdder fa31(s5,c4,p0[3],s7,c7);
	 FullAdder fa32(s6,c5,p1[3],s8,c8);
	 FullAdder fa33(p3[2],c6,p2[3],s9,c9);
	 
	 HalfAdder ha41(s8,c7,s10,c10);
	 FullAdder fa42(s9,c8,c10,s11,c11);
	 FullAdder fa43(p3[3],c9,c11,s12,c12);
	
endmodule
