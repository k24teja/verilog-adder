`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/06/2026 02:49:29 PM
// Design Name: 
// Module Name: Adder
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


module Adder(A,B,Cin,Cout,Sum,s,z,c,p,v);
 input [15:0]A;
 input [15:0]B;
 input Cin;
 output[15:0]Sum;
 output Cout;
 output s,z,c,p,v;
 wire [2:0]C;
 wire [3:0]gen;
 wire [3:0]pro;

 assign C[0]=(gen[0])|(Cin&pro[0]);
 assign C[1]=(gen[1])|(pro[1]&gen[0])|(Cin&pro[0]&pro[1]);
 assign C[2]=(gen[2])|(pro[2]&gen[1])|(pro[2]&pro[1]&gen[0])|(Cin&pro[0]&pro[1]&pro[2]);
 assign
Cout=(gen[3])|(pro[3]&gen[2])|(pro[3]&pro[2]&gen[1])|(pro[3]&pro[2]&pro[1]&gen[0])|(Cin&pro[0]&pro[1]&pro[2]&pro[3]);
 //wire [2:0]t;
 //wire [15:0]g;
 //wire [15:0]p;

 // assign g=A&B;
 //assign p=A^B;
 //equation for carry for the 2nd stage of 4bit cla
 // assign t[0]=((g[3])|(p[3]&g[2])|(p[3]&p[2]&g[1])|(p[3]&p[2]&p[1]&g[0])|(p[3]&p[2]&p[1]&p[0]&Cin));
 //equation for carry for the 3rd stage of 4bit cla
 //assign t[1]=((g[7])|(p[7]&g[6])|(p[7]&p[6]&g[5])|(p[7]&p[6]&p[5]&g[4])|(p[7]&p[6]&p[5]&p[4]&g[3])|(p[7]&p[6]&p[5]&p[4]&p[3]&g[2])|(p[7]&p[6]&p[5]&p[4]&p[3]&p[2]&g[1])|(p[7]&p[6]&p[5]&p[4]&p[3]&p[2]&p[1]&g[0])|(p[7]&p[6]&p[5]&p[4]&p[3]&p[2]&p[1]&p[0]&Cin));
 //equation for caeey for the 4th stage of 4bit cla
 //assign t[2]=(g[11])|(p[11]&g[10])|(p[11]&p[10]&g[9])|(p[11]&p[10]&p[9]&g[8])|(p[11]&p[10]&p[9]&p[8]&g[7])|(p[11]&p[10]&p[9]&p[8]&p[7]&g[6])|(p[11]&p[10]&p[9]&p[8]&p[7]&p[6]&g[5])|(p[11]&p[10]&p[9]&p[8]&p[7]&p[6]&p[5]&g[4])|(p[11]&p[10]&p[9]&p[8]&p[7]&p[6]&p[5]&p[4]&g[3])|(p[11]&p[10]&p[9]&p[8]&p[7]&p[6]&p[5]&p[4]&p[3]&g[2])|(p[11]&p[10]&p[9]&p[8]&p[7]&p[6]&p[5]&p[4]&p[3]&p[2]&g[1])|(p[11]&p[10]&p[9]&p[8]&p[7]&p[6]&p[5]&p[4]&p[3]&p[2]&p[1]&g[0])|(p[11]&p[10]&p[9]&g[8]&p[7]&p[6]&p[5]&p[4]&p[3]&p[2]&p[1]&p[0]&Cin);

 Adder4cla A1(.a3(A[3:0]),.b3(B[3:0]),.c3(Cin),.sum(Sum[3:0]),.G(gen[0]),.P(pro[0]));
 Adder4cla A2(.a3(A[7:4]),.b3(B[7:4]),.c3(C[0]),.sum(Sum[7:4]),.G(gen[1]),.P(pro[1]));
 Adder4cla A3(.a3(A[11:8]),.b3(B[11:8]),.c3(C[1]),.sum(Sum[11:8]),.G(gen[2]),.P(pro[2]));
 Adder4cla
A4(.a3(A[15:12]),.b3(B[15:12]),.c3(C[2]),.sum(Sum[15:12]),.G(gen[3]),.P(pro[3]));
 //Adder4rca A1(.a1(A[3:0]),.b1(B[3:0]),.c1(Cin),.sum(Sum[3:0]),.carry(t[0]));
 //Adder4rca A2(.a1(A[7:4]),.b1(B[7:4]),.c1(t[0]),.sum(Sum[7:4]),.carry(t[1]));
 //Adder4rca A3(.a1(A[11:8]),.b1(B[11:8]),.c1(t[1]),.sum(Sum[11:8]),.carry(t[2]));
 // Adder4rca A4(.a1(A[15:12]),.b1(B[15:12]),.c1(t[2]),.sum(Sum[15:12]),.carry(Cout));

 //assign {Carry,Sum}=A+B;
 //sign flag
 assign s=Sum[15];
 //zero flag
 assign z=~|Sum;
 //carry flag
 assign c=Cout;
 //parity flag
 assign p=~^Sum;
 // Overflow flag
 assign v=((A[15]&B[15]&~Sum[15]) | (~A[15]&~B[15]&Sum[15]));


endmodule