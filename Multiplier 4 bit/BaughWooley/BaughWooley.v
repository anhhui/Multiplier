`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:34:57 08/03/2021 
// Design Name: 
// Module Name:    BaughWooley 
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
module BaughWooley( A, B, prod
    );

    input [3:0] A,B;
    output [7:0] prod;
	 
	 wire [3:0] p0,p1,p2,p3;
	 
	 wire s1,s2,s3,s4,s5,s6,s7,s8,s9,
			s10,s11,s12,s13,s14,s15;
	 wire c1,c2,c3,c4,c5,c6,c7,c8,c9,
			c10,c11,c12,c13,c14,c15;

	 
	 assign p0[0] = A[0] & B[0];
	 assign p0[1] = A[0] & B[1];
	 assign p0[2] = A[0] & B[2];
	 assign p0[3] = ~A[0] & B[3];
	 assign p1[0] = A[1] & B[0];
	 assign p1[1] = A[1] & B[1];
	 assign p1[2] = A[1] & B[2];
	 assign p1[3] = ~A[1] & B[3];
	 assign p2[0] = A[2] & B[0];
	 assign p2[1] = A[2] & B[1];
	 assign p2[2] = A[2] & B[2];
	 assign p2[3] = ~A[2] & B[3];
	 assign p3[0] = A[3] & ~B[0];
	 assign p3[1] = A[3] & ~B[1];
	 assign p3[2] = A[3] & ~B[2];
	 assign p3[3] = A[3] & B[3];
	 
	 
	 assign prod[0] = p0[0];
    assign prod[1] = s1;
    assign prod[2] = s4;
    assign prod[3] = s11;
    assign prod[4] = s12;
    assign prod[5] = s13;
    assign prod[6] = s14;
    assign prod[7] = s15;
	 
	 HalfAdder ha11(p1[0],p0[1],s1,c1);
	 HalfAdder ha12(p1[1],p0[2],s2,c2);
	 HalfAdder ha13(p1[2],p0[3],s3,c3);
	 
	 FullAdder fa21(s2,c1,p2[0],s4,c4);
	 FullAdder fa22(s3,c2,p2[1],s5,c5);
	 FullAdder fa23(p3[1],c3,p2[2],s6,c6);
	 
	 FullAdder fa31(s5,c4,p3[0],s7,c7);
	 FullAdder fa32(s6,c5,p1[3],s8,c8);
	 FullAdder fa33(p2[3],c6,p3[2],s9,c9);
	 FullAdder fa34(~A[3],~B[3],p3[3],s10,c10);
	 
	 FullAdder fa41(s7,A[3],B[3],s11,c11);
	 FullAdder fa42(s8,c7,c11,s12,c12);
	 FullAdder fa43(s9,c8,c12,s13,c13);
	 FullAdder fa44(s10,c9,c13,s14,c14);
	 FullAdder fa45(c10,1'b1,c14,s15,c15);
	
endmodule
