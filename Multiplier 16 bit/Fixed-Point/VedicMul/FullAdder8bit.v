module FullAdder8bit(
    output cout, //MSB, determines if answer is positive or negative
    output [7:0] s,
    input [7:0] a,
    input [7:0] b,
    input cin // if 1, subtract, if 0, add. This is XOR'ed with b
    );
    
    wire [7:0] bin;
    assign bin[0] = b[0]^cin;
    assign bin[1] = b[1]^cin;
    assign bin[2] = b[2]^cin;
    assign bin[3] = b[3]^cin;
    assign bin[4] = b[4]^cin;                          
    assign bin[5] = b[5]^cin;
    assign bin[6] = b[6]^cin;
    assign bin[7] = b[7]^cin;
    
      
    wire [8:1] carry; 
     FullAdder FA0(.cout(carry[1]),.s(s[0]),.a(a[0]),.b(bin[0]),.cin(cin));
     FullAdder FA1(.cout(carry[2]),.s(s[1]),.a(a[1]),.b(bin[1]),.cin(carry[1]));
     FullAdder FA2(.cout(carry[3]),.s(s[2]),.a(a[2]),.b(bin[2]),.cin(carry[2]));
     FullAdder FA3(.cout(carry[4]),.s(s[3]),.a(a[3]),.b(bin[3]),.cin(carry[3]));
     FullAdder FA4(.cout(carry[5]),.s(s[4]),.a(a[4]),.b(bin[4]),.cin(carry[4]));
     FullAdder FA5(.cout(carry[6]),.s(s[5]),.a(a[5]),.b(bin[5]),.cin(carry[5]));
     FullAdder FA6(.cout(carry[7]),.s(s[6]),.a(a[6]),.b(bin[6]),.cin(carry[6]));
     FullAdder FA7(.cout(carry[8]),.s(s[7]),.a(a[7]),.b(bin[7]),.cin(carry[7]));

     
     assign cout = cin^carry[8];
   
endmodule
