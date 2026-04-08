`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/06/2026 03:00:19 PM
// Design Name: 
// Module Name: FullAdder
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


module FullAdder(a2,b2,c,sum,carry);
 input a2;
 input b2,c;
 output sum;
 output carry;
 wire c1,c2,c3;
 xor g1(c1, a2, b2),g2(sum, c1, c);
 and g3(c2, a2, b2),g4(c3, c1, c);
 or g5(carry, c2, c3);


endmodule
