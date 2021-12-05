module Multiplier8bit( x , y, out
    );
input   [7:0] x, y;
output [15:0] out;

wire [7:0] out1,out2, out3, out4;
wire [11:0] out5, out7;
wire [7:0] out6;

wire cout1, cout2, cout3;

Multiplier4bit ic1(x[7:4], y[7:4], out1);
Multiplier4bit ic2(x[7:4], y[3:0], out2);
Multiplier4bit ic3(x[3:0], y[7:4], out3);
Multiplier4bit ic4(x[3:0], y[3:0], out4);

FullAdder12bit ic5 (cout1, out5, {out1,4'b0000}, {4'b0000,out2}, 1'b0 );

FullAdder8bit ic6 (cout2, out6, out3, {4'b0000, out4[7:4] }, 1'b0 );

FullAdder12bit ic7 (cout3, out7, out5, {4'b0000,out6}, 1'b0);

assign out = {out7 , out4[3:0]};

endmodule
