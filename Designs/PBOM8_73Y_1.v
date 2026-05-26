`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.04.2026 04:25:39
// Design Name: 
// Module Name: PBOM8_73Y_1
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


module PBOM8_73Y_1( 
    input [7:0] A,
    input [7:0] B, 
    output [15:0] P);
    
wire [11:0] M1, M2;

PBO7_8X4 M_low (A, B[3:0], M1);
PBO3_8X4 M_high (A, B[7:4], M2);

wire [11:0] M1_Extend;
wire [15:0] M2_Extend;

assign M1_Extend = M1;
assign M2_Extend = M2 << 4;

assign P[3:0] = M1_Extend[3:0];
assign P[11:4] = M2_Extend[11:4] | M1_Extend[11:4];
assign P[15:12] = M2_Extend[15:12];

endmodule
