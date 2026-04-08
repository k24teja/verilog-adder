`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/06/2026 02:58:31 PM
// Design Name: 
// Module Name: Adder4rca
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Adder4rca(a1,b1,c1,sum,carry);
 input [3:0]a1;
 input [3:0]b1;
 input c1;
 output [3:0]sum;
 output carry;
 wire [2:0]t;

 FullAdder F1(.a2(a1[0]),.b2(b1[0]),.c(c1),.sum(sum[0]),.carry(t[0]));
 FullAdder F2(.a2(a1[1]),.b2(b1[1]),.c(t[0]),.sum(sum[1]),.carry(t[1]));
 FullAdder F3(.a2(a1[2]),.b2(b1[2]),.c(t[1]),.sum(sum[2]),.carry(t[2]));
 FullAdder F4(.a2(a1[3]),.b2(b1[3]),.c(t[2]),.sum(sum[3]),.carry(carry));

endmodule