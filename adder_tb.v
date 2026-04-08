`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/06/2026 03:03:00 PM
// Design Name: 
// Module Name: adder_tb
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


module adder_tb;
 reg [15:0]x;
 reg [15:0]y;
 reg cin;
 wire [15:0]out;
 wire cy,sign,zero,carry,parity,overflow;
 Adder
A1(.A(x),.B(y),.Cin(cin),.Cout(cy),.Sum(out),.s(sign),.z(zero),.c(carry),.p(parity),.v(overflow));
 initial begin
 cin=1'b0;
 #5;

 x=16'haecf;
 y=16'h5327;
 #10;
 x=16'h8000;
 y=16'h8fff;
 #10;
 x=16'hfffe;
 y=16'h0002;
 #10;
 x=16'haaaa;
 y=16'h5555;
 #200;
 $stop;

 end
 initial begin 
 $monitor("Time=%0t|Output=%h|Carry=%b|Sign flag=%b|zero flag=%b|carry flag=%b|parity flag=%b|overflow flag=%b",$time,out,cy,sign,zero,carry,parity,overflow);
 end

endmodule
 
