`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.04.2026 06:01:18
// Design Name: 
// Module Name: PBO7_8X4
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


module PBO7_8X4(
input  wire [7:0] A,    
input  wire [3:0] B,    
output wire [11:0] P   
);

wire [7:0] pp0, pp1, pp2, pp3;
genvar i;
generate
    for (i = 0; i < 8; i = i + 1) begin : pp_gen
        assign pp0[i] = A[i] & B[0];   
        assign pp1[i] = A[i] & B[1];   
        assign pp2[i] = A[i] & B[2];   
        assign pp3[i] = A[i] & B[3];   
    end
endgenerate

assign P[0] = pp0[0];

assign P[1] = pp0[1] | pp1[0];

assign P[2] = pp0[2] | pp1[1] | pp2[0];

assign P[3] = pp0[3] | pp1[2] | pp2[1] | pp3[0];

assign P[4] = pp0[4] | pp1[3] | pp2[2] | pp3[1];

assign P[5] = pp0[5] | pp1[4] | pp2[3] | pp3[2];

assign P[6] = pp0[6] | pp1[5] | pp2[4] | pp3[3];

assign P[7] = pp0[7] | pp1[6] | pp2[5] | pp3[4];

assign P[8] = pp1[7] | pp2[6] | pp3[5];

wire s9, c9;
wire s10, c10;

Full_Adder FA1 (
    .a(pp2[7]),
    .b(pp3[6]),
    .cin(1'b0),
    .sum(s9),
    .cout(c9)
);

Full_Adder FA2 (
    .a(s9),
    .b(pp3[7]),
    .cin(1'b0),
    .sum(s10),
    .cout(c10)
);

Half_Adder HA1 (
    .a(c9),
    .b(c10),
    .sum(P[10]),
    .cout(P[11])
);

assign P[9] = s9;

endmodule