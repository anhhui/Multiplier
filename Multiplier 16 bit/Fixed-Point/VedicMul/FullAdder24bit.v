module FullAdder24bit(
    output cout, //MSB, determines if answer is positive or negative
    output [23:0] s,
    input [23:0] a,
    input [23:0] b,
    input cin // if 1, subtract, if 0, add. This is XOR'ed with b
    );
    
    wire [23:0] bin;
    assign bin[0] = b[0]^cin;
    assign bin[1] = b[1]^cin;
    assign bin[2] = b[2]^cin;
    assign bin[3] = b[3]^cin;
    assign bin[4] = b[4]^cin;                          
    assign bin[5] = b[5]^cin;
    assign bin[6] = b[6]^cin;
    assign bin[7] = b[7]^cin;
	 assign bin[8] = b[8]^cin;                          
    assign bin[9] = b[9]^cin;
    assign bin[10] = b[10]^cin;
    assign bin[11] = b[11]^cin;
    assign bin[12] = b[12]^cin;                          
    assign bin[13] = b[13]^cin;
    assign bin[14] = b[14]^cin;
    assign bin[15] = b[15]^cin;
    assign bin[16] = b[16]^cin;                          
    assign bin[17] = b[17]^cin;
    assign bin[18] = b[18]^cin;
    assign bin[19] = b[19]^cin;
    assign bin[20] = b[20]^cin;                          
    assign bin[21] = b[21]^cin;
    assign bin[22] = b[22]^cin;
    assign bin[23] = b[23]^cin;
	 
    wire [24:1] carry; 
     FullAdder FA0(.cout(carry[1]),.s(s[0]),.a(a[0]),.b(bin[0]),.cin(cin));
     FullAdder FA1(.cout(carry[2]),.s(s[1]),.a(a[1]),.b(bin[1]),.cin(carry[1]));
     FullAdder FA2(.cout(carry[3]),.s(s[2]),.a(a[2]),.b(bin[2]),.cin(carry[2]));
     FullAdder FA3(.cout(carry[4]),.s(s[3]),.a(a[3]),.b(bin[3]),.cin(carry[3]));
     FullAdder FA4(.cout(carry[5]),.s(s[4]),.a(a[4]),.b(bin[4]),.cin(carry[4]));
     FullAdder FA5(.cout(carry[6]),.s(s[5]),.a(a[5]),.b(bin[5]),.cin(carry[5]));
     FullAdder FA6(.cout(carry[7]),.s(s[6]),.a(a[6]),.b(bin[6]),.cin(carry[6]));
     FullAdder FA7(.cout(carry[8]),.s(s[7]),.a(a[7]),.b(bin[7]),.cin(carry[7]));
	  FullAdder FA8(.cout(carry[9]),.s(s[8]),.a(a[8]),.b(bin[8]),.cin(carry[8]));
     FullAdder FA9(.cout(carry[10]),.s(s[9]),.a(a[9]),.b(bin[9]),.cin(carry[9]));
     FullAdder FA10(.cout(carry[11]),.s(s[10]),.a(a[10]),.b(bin[10]),.cin(carry[10]));
     FullAdder FA11(.cout(carry[12]),.s(s[11]),.a(a[11]),.b(bin[11]),.cin(carry[11]));
	  FullAdder FA12(.cout(carry[13]),.s(s[12]),.a(a[12]),.b(bin[12]),.cin(carry[12]));
     FullAdder FA13(.cout(carry[14]),.s(s[13]),.a(a[13]),.b(bin[13]),.cin(carry[13]));
     FullAdder FA14(.cout(carry[15]),.s(s[14]),.a(a[14]),.b(bin[14]),.cin(carry[14]));
     FullAdder FA15(.cout(carry[16]),.s(s[15]),.a(a[15]),.b(bin[15]),.cin(carry[15]));
	  FullAdder FA16(.cout(carry[17]),.s(s[16]),.a(a[16]),.b(bin[16]),.cin(carry[16]));
     FullAdder FA17(.cout(carry[18]),.s(s[17]),.a(a[17]),.b(bin[17]),.cin(carry[17]));
     FullAdder FA18(.cout(carry[19]),.s(s[18]),.a(a[18]),.b(bin[18]),.cin(carry[18]));
     FullAdder FA19(.cout(carry[20]),.s(s[19]),.a(a[19]),.b(bin[19]),.cin(carry[19]));
	  FullAdder FA20(.cout(carry[21]),.s(s[20]),.a(a[20]),.b(bin[20]),.cin(carry[20]));
     FullAdder FA21(.cout(carry[22]),.s(s[21]),.a(a[21]),.b(bin[21]),.cin(carry[21]));
     FullAdder FA22(.cout(carry[23]),.s(s[22]),.a(a[22]),.b(bin[22]),.cin(carry[22]));
     FullAdder FA23(.cout(carry[24]),.s(s[23]),.a(a[23]),.b(bin[23]),.cin(carry[23]));
     
     assign cout = cin^carry[24];
   
endmodule
