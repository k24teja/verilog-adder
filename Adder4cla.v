`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/06/2026 02:52:55 PM
// Design Name: 
// Module Name: Adder4cla
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


module Adder4cla(a3,b3,c3,sum,P,G);
 input [3:0]a3;
 input [3:0]b3;
 input c3;
 output [3:0]sum;
 output P,G;
 wire [3:0]g;
 wire [3:0]p;
 //wire [2:0]cy;

 assign g= a3&b3;

 assign p=a3^b3;

 //assign cy[0]=(g[0])|(c3&p[0]);
 //assign cy[1]=(g[1])|(g[0]&p[1])|(p[1]&p[0]&c3);
 //assign cy[2]=(g[2])|(p[2]&g[1])|(p[2]&p[1]&g[0])|(p[2]&p[1]&p[0]&c3);
 assign P=&p;
 assign G=(g[3])|(p[3]&g[2])|(p[3]&p[2]&g[1])|(p[3]&p[2]&p[1]&g[0]);
 assign sum[0]=p[0]^c3;
 assign sum[1]=p[1]^((g[0])|(c3&p[0]));
 assign sum[2]=p[2]^((g[1])|(g[0]&p[1])|(p[1]&p[0]&c3));
 assign sum[3]=p[3]^((g[2])|(p[2]&g[1])|(p[2]&p[1]&g[0])|(p[2]&p[1]&p[0]&c3));



 // FullAdder FA1(a3[0],b3[0],c3,sum[0],cout[0]);
 // FullAdder FA2(a3[1],b3[1],cy[0],sum[1],cout[1]);
 // FullAdder FA3(a3[2],b3[2],cy[1],sum[2],cout[2]);
 // FullAdder FA4(a3[3],b3[3],cy[2],sum[3],carry);
 


endmodule
