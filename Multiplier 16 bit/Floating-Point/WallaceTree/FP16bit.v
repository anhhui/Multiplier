`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:22:22 05/05/2021 
// Design Name: 
// Module Name:    FA16bit 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module FP16bit_WallaceTree(
		input [15:0] a_operand,
		input [15:0] b_operand,
		output Exception,Overflow,Underflow,
		output [15:0] result
		);

wire sign,product_round,normalised,zero;
wire [5:0] exponent,sum_exponent;
wire [9:0] product_mantissa;
wire [10:0] operand_a,operand_b;
wire [21:0] product, product_normalised;

wire [31:0] sub_product;


assign sign = a_operand[15] ^ b_operand[15];

assign Exception = (&a_operand[14:10]) | (&b_operand[14:10]);  

assign operand_a = (|a_operand[14:10]) ? {1'b1,a_operand[9:0]} : {1'b0,a_operand[9:0]}; 

assign operand_b = (|b_operand[14:10]) ? {1'b1,b_operand[9:0]} : {1'b0,b_operand[9:0]};

WallaceTree16bit ic( {5'b00000,operand_a}, {5'b00000,operand_b}, sub_product);

assign product = sub_product[21:0];

assign product_round = |product_normalised[10:0];  

assign normalised = product[21] ? 1'b1 : 1'b0;	

assign product_normalised = normalised ? product : product << 1;

assign product_mantissa = {product_normalised[20:12] , (product_normalised[11] & product_round)}; 

assign zero = Exception ? 1'b0 : (product_mantissa == 9'd0) ? 1'b1 : 1'b0;

assign sum_exponent = a_operand[14:10] + b_operand[14:10];

assign exponent = sum_exponent - 5'd15 + normalised; 

assign Overflow = ((exponent[5] & !exponent[4]) & !zero) ; 

assign Underflow = ((exponent[5] & exponent[4]) & !zero) ? 1'b1 : 1'b0; 

assign result = Exception ? 16'd0 : zero ? {sign,15'd0} : Overflow ? {sign,5'b11111,10'd0} : Underflow ? {sign,15'd0} : {sign,exponent[4:0],product_mantissa};

endmodule
