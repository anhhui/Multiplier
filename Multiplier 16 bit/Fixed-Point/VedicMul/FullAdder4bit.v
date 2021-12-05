module FullAdder4bit(
    output cout, //MSB, determines if answer is positive or negative
    output [3:0] s,
    input [3:0] a,
    input [3:0] b,
    input cin // if 1, subtract, if 0, add. This is XOR'ed with b
    );
    
    wire [3:0] bin;
    assign bin[0] = b[0]^cin;
    assign bin[1] = b[1]^cin;
    assign bin[2] = b[2]^cin;
    assign bin[3] = b[3]^cin;

    
      
    wire [4:1] carry; 
     FullAdder FA0(.cout(carry[1]),.s(s[0]),.a(a[0]),.b(bin[0]),.cin(cin));
     FullAdder FA1(.cout(carry[2]),.s(s[1]),.a(a[1]),.b(bin[1]),.cin(carry[1]));
     FullAdder FA2(.cout(carry[3]),.s(s[2]),.a(a[2]),.b(bin[2]),.cin(carry[2]));
     FullAdder FA3(.cout(carry[4]),.s(s[3]),.a(a[3]),.b(bin[3]),.cin(carry[3]));

     
     assign cout = cin^carry[4];
   
endmodule
