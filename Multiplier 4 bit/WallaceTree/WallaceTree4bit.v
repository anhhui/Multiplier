module WallaceTree4bit(A, B, prod
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
    assign prod[2] = s5;
    assign prod[3] = s9;
    assign prod[4] = s10;
    assign prod[5] = s11;
    assign prod[6] = s12;
    assign prod[7] = c12;
	 
	 HalfAdder ha11(p0[1],p1[0],s1,c1);
	 FullAdder fa12(p0[2],p1[1],p2[0],s2,c2);
	 FullAdder fa13(p0[3],p1[2],p2[1],s3,c3);
	 HalfAdder ha14(p1[3],p2[2],s4,c4);
	
	 HalfAdder ha21(s2,c1,s5,c5);
	 FullAdder fa22(s3,c2,p3[0],s6,c6);
	 FullAdder fa23(s4,c3,p3[1],s7,c7);
	 FullAdder fa24(p2[3],c4,p3[2],s8,c8);
	 
	 HalfAdder ha31(s6,c5,s9,c9);
	 FullAdder fa32(s7,c6,c9,s10,c10);
	 FullAdder fa33(s8,c7,c10,s11,c11);
	 FullAdder fa36(p3[3],c8,c11,s12,c12);
	 
endmodule
