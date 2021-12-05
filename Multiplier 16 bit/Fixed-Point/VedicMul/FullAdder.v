module HalfAdder(A,B,S,C
);
input A,B;
output S,C;
assign S = A ^ B;
assign C = A & B;
endmodule

module FullAdder( a,b ,cin,s,cout
    );
input a,b,cin;
output s,cout;
wire I1,I2,I3;
HalfAdder HA1(a,b,I1,I2);
HalfAdder HA2(I1,cin,s,I3);
assign cout = I2 || I3;
endmodule 