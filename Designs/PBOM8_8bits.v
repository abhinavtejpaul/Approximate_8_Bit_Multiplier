`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.04.2026 14:15:37
// Design Name: 
// Module Name: PBOM8_8bits
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


module PBOM8_8bits(
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
//column 9
wire S9_1,S9_2,S9_3,C9_1,C9_2,C9_3,C9_4;
Full_Adder FA1(.a(pp2[7]),.b(pp3[6]),.cin(pp4[5]),.cout(C9_1),.sum(S9_1));
Full_Adder FA2(.a(pp5[4]),.b(pp6[3]),.cin(C9_1),.cout(C9_2),.sum(S9_2));
Full_Adder FA3(.a(pp7[2]),.b(S9_1),.cin(C9_2),.cout(C9_3),.sum(S9_3));
Full_Adder FA4(.a(S9_2),.b(S9_3),.cin(C9_3),.cout(C9_4),.sum(P[9]));
//column 10
wire S10_1,S10_2,S10_3,C10_1,C10_2,C10_3,C10_4;
Full_Adder FA5(.a(pp3[7]),.b(pp4[6]),.cin(C9_4),.cout(C10_1),.sum(S10_1));
Full_Adder FA6(.a(pp5[5]),.b(pp6[4]),.cin(C10_1),.cout(C10_2),.sum(S10_2));
Full_Adder FA7(.a(pp7[3]),.b(S10_1),.cin(C10_2),.cout(C10_3),.sum(S10_3));
Full_Adder FA8(.a(S10_2),.b(S10_3),.cin(C10_3),.cout(C10_4),.sum(P[10]));
//column 11
wire S11_1,S11_2,C11_1,C11_2,C11_3;
Full_Adder FA9(.a(pp4[7]),.b(pp5[6]),.cin(C10_4),.cout(C11_1),.sum(S11_1));
Full_Adder FA10(.a(pp6[5]),.b(pp7[4]),.cin(C11_1),.cout(C11_2),.sum(S11_2));
Full_Adder FA11(.a(S11_1),.b(S11_2),.cin(C11_2),.cout(C11_3),.sum(P[11]));
//column 12
wire S12_1,S12_2,C12_1,C12_2;
Full_Adder FA12(.a(pp5[7]),.b(pp6[6]),.cin(C11_3),.cout(C12_1),.sum(S12_1));
Full_Adder FA13(.a(pp7[5]),.b(S12_1),.cin(C12_1),.cout(C12_2),.sum(P[12]));
//column 13
wire C13_1;
Full_Adder FA14(.a(pp6[7]),.b(pp7[6]),.cin(C12_2),.cout(C13_1),.sum(P[13]));
//column 14 and 15
Full_Adder FA15(.a(pp7[7]),.b(0),.cin(C13_1),.cout(P[15]),.sum(P[14]));
endmodule