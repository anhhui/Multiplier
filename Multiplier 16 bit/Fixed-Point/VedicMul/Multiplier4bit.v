module Multiplier4bit(x, y, out);

input   [3:0] x, y;
output [7:0] out;

wire [3:0] out1,out2, out3, out4;
wire [5:0] out5, out7;
wire [3:0] out6;

wire cout1, cout2, cout3;

Vedic2bit ic1(x[3:2], y[3:2], out1);
Vedic2bit ic2(x[3:2], y[1:0], out2);
Vedic2bit ic3(x[1:0], y[3:2], out3);
Vedic2bit ic4(x[1:0], y[1:0], out4);

FullAdder6bit ic5 (cout1, out5, {out1,2'b00}, {2'b00,out2}, 1'b0 );

FullAdder4bit ic6 (cout2, out6, out3, {2'b00, out4[3:2] }, 1'b0 );

FullAdder6bit ic7 (cout3, out7, out5, {2'b00,out6}, 1'b0);

assign out = {out7 , out4[1:0]};

endmodule
