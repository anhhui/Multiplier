module FullAdder6bit(
    output cout, 
    output [5:0] s,
    input [5:0] a,
    input [5:0] b,
    input cin 
    );
    
    wire [5:0] bin;
    assign bin[0] = b[0]^cin;
    assign bin[1] = b[1]^cin;
    assign bin[2] = b[2]^cin;
    assign bin[3] = b[3]^cin;
    assign bin[4] = b[4]^cin;                          
    assign bin[5] = b[5]^cin;

      
    wire [6:1] carry; 
     FullAdder FA0(.cout(carry[1]),.s(s[0]),.a(a[0]),.b(bin[0]),.cin(cin));
     FullAdder FA1(.cout(carry[2]),.s(s[1]),.a(a[1]),.b(bin[1]),.cin(carry[1]));
     FullAdder FA2(.cout(carry[3]),.s(s[2]),.a(a[2]),.b(bin[2]),.cin(carry[2]));
     FullAdder FA3(.cout(carry[4]),.s(s[3]),.a(a[3]),.b(bin[3]),.cin(carry[3]));
     FullAdder FA4(.cout(carry[5]),.s(s[4]),.a(a[4]),.b(bin[4]),.cin(carry[4]));
     FullAdder FA5(.cout(carry[6]),.s(s[5]),.a(a[5]),.b(bin[5]),.cin(carry[5]));

     
     assign cout = cin^carry[6];
   
endmodule
