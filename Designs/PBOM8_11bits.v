`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.04.2026 04:14:21
// Design Name: 
// Module Name: PBOM8_11bits
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


module PBOM8_11bits(
    input [7:0] A,
    input [7:0] B,
    output [15:0] P);
    
wire [7:0] pp0,pp1,pp2,pp3,pp4,pp5,pp6,pp7;
assign pp0 = A & {8{B[0]}};
assign pp1 = A & {8{B[1]}};
assign pp2 = A & {8{B[2]}};
assign pp3 = A & {8{B[3]}};
assign pp4 = A & {8{B[4]}};
assign pp5 = A & {8{B[5]}};
assign pp6 = A & {8{B[6]}};
assign pp7 = A & {8{B[7]}};

assign P[0] = pp0[0];
assign P[1] = pp0[1]|pp1[0];
assign P[2] = pp0[2]|pp1[1]|pp2[0];
assign P[3] = pp0[3]|pp1[2]|pp2[1]|pp3[0];
assign P[4] = pp0[4]|pp1[3]|pp2[2]|pp3[1]|pp4[0];
assign P[5] = pp0[5]|pp1[4]|pp2[3]|pp3[2]|pp4[1]|pp5[0];
assign P[6] = pp0[6]|pp1[5]|pp2[4]|pp3[3]|pp4[2]|pp5[1]|pp6[0];
assign P[7] = pp0[7]|pp1[6]|pp2[5]|pp3[4]|pp4[3]|pp5[2]|pp6[1]|pp7[0];
assign P[8] = pp1[7]|pp2[6]|pp3[5]|pp4[4]|pp5[3]|pp6[2]|pp7[1];
assign P[9] = pp2[7]|pp3[6]|pp4[5]|pp5[4]|pp6[3]|pp7[2];
assign P[10]= pp3[7]|pp4[6]|pp5[5]|pp6[4]|pp7[3];
assign P[11]= pp4[7]|pp5[6]|pp6[5]|pp7[4];

wire C12_1;
Full_Adder FA12(pp5[7],pp6[6],pp7[5],P[12],C12_1);

wire C13_1;
Full_Adder FA13(pp6[7],pp7[6],C12_1,P[13],C13_1);

Full_Adder FA14(pp7[7],0,C13_1,P[14],P[15]);
endmodule