module Vedic2bit( x , y ,out
    );

input [1:0] x,y;
output [3:0] out;

wire f0,f1,f2,f3,f4,f5,f6,f7,f8;

assign f0 = x[0] & y[0];
assign f1 = x[1] & y[0];
assign f2 = x[0] & y[1];
assign f3 = x[1] & y[1];

assign f5 = f1 ^ f2;
assign f6 = f1 & f2;

assign f7 = f6 ^ f3;
assign f8 = f6 & f3;

assign out = {f8,f7,f5,f0};

endmodule
