`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.04.2026 03:53:15
// Design Name: 
// Module Name: PBOM8_30N
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


module PBOM8_30N(
input [7:0] A,
input [7:0] B,
output [15:0] P
);

wire [11:0] M1, M2;

PBO3_8X4 M_low (A, B[3:0], M1);
Multiplier_8X4 M_high (A, B[7:4], M2);

assign P = M1 + (M2 << 4);

endmodule
