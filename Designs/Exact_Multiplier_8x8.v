`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.04.2026 15:39:55
// Design Name: 
// Module Name: Exact_Multiplier_8x8
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


module Exact_Multiplier_8x8(
    input [7:0] A,
    input [7:0] B,
    output [15:0] P
    );
    
    wire [11:0] partHigh;
    Multiplier_8X4 M1 (
        .A (A),
        .B (B[7:4]),
        .P (partHigh)
    );
    
    wire [11:0] partLow;
    Multiplier_8X4 M2 (
        .A (A),
        .B (B[3:0]),
        .P (partLow)
    );
    
    assign P[3:0] = partLow[3:0];
    
    wire [10:4] carry;
    
    Half_Adder HA_bit4 (
        .a   (partHigh[0]),
        .b   (partLow[4]),
        .sum (P[4]),
        .cout(carry[4])
    );
    
    Full_Adder FA_bit5 (
        .a   (partHigh[1]),
        .b   (partLow[5]),
        .cin (carry[4]),
        .sum (P[5]),
        .cout(carry[5])
    );
    
    Full_Adder FA_bit6 (
        .a   (partHigh[2]),
        .b   (partLow[6]),
        .cin (carry[5]),
        .sum (P[6]),
        .cout(carry[6])
    );
    
     Full_Adder FA_bit7 (
        .a   (partHigh[3]),
        .b   (partLow[7]),
        .cin (carry[6]),
        .sum (P[7]),
        .cout(carry[7])
    );
 
    Full_Adder FA_bit8 (
        .a   (partHigh[4]),
        .b   (partLow[8]),
        .cin (carry[7]),
        .sum (P[8]),
        .cout(carry[8])
    );
 
    Full_Adder FA_bit9 (
        .a   (partHigh[5]),
        .b   (partLow[9]),
        .cin (carry[8]),
        .sum (P[9]),
        .cout(carry[9])
    );
 
    Full_Adder FA_bit10 (
        .a   (partHigh[6]),
        .b   (partLow[10]),
        .cin (carry[9]),
        .sum (P[10]),
        .cout(carry[10])
    );
    
    wire carry_11;
    
    
    
    Full_Adder FA_bit11 (
        .a   (partHigh[7]),
        .b   (partLow[11]),
        .cin (carry[10]),
        .sum (P[11]),
        .cout(carry_11)
    );
    
    wire carry_12, carry_13, carry_14;
 
    Half_Adder HA_bit12 (
        .a   (partHigh[8]),
        .b   (carry_11),
        .sum (P[12]),
        .cout(carry_12)
    );
 
    Half_Adder HA_bit13 (
        .a   (partHigh[9]),
        .b   (carry_12),
        .sum (P[13]),
        .cout(carry_13)
    );
 
    Half_Adder HA_bit14 (
        .a   (partHigh[10]),
        .b   (carry_13),
        .sum (P[14]),
        .cout(carry_14)
    );
    
    Half_Adder HA_bit15 (
        .a   (partHigh[11]),
        .b   (carry_14),
        .sum (P[15]),
        .cout()
    );
endmodule


