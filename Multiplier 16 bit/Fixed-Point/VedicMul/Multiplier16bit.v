module Multiplier16bit( x , y, out
    );
input   [15:0] x, y;
output [31:0] out;

wire [15:0] out1,out2, out3, out4;
wire [15:0] out5, out6, out7;

wire cout1, cout2, cout3;

wire f;
	
Multiplier8bit ic1(x[15:8], y[15:8], out1);
Multiplier8bit ic2(x[15:8], y[7:0], out2);
Multiplier8bit ic3(x[7:0], y[15:8], out3);
Multiplier8bit ic4(x[7:0], y[7:0], out4);

FullAdder16bit ic5 (cout1, out5, out2, out3, 1'b0 );

FullAdder16bit ic6 (cout2, out6, out5, {8'h00, out4[15:8]}, 1'b0 );

assign f = cout1 | cout2;

FullAdder16bit ic7 (cout3, out7, out1, {7'b0 , f , out6[15:8]}, 1'b0);

assign out = {out7 , out6[7:0] , out4[7:0]};

endmodule
