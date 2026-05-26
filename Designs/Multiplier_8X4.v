`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.03.2026 02:38:06
// Design Name: 
// Module Name: Multiplier_8X4
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


module Multiplier_8X4(  
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

wire [8:0] s1;          
wire [7:0] c1;          
assign s1[0] = pp0[0];

//col 0 — HA
Half_Adder HA1_col1 ( .a(pp0[1]), .b(pp1[0]),
                      .sum(s1[1]),  .cout(c1[0]) );

//col 1-7 — FA
Full_Adder FA1_col2 ( .a(pp0[2]), .b(pp1[1]), .cin(c1[0]),
                      .sum(s1[2]),  .cout(c1[1]) );
Full_Adder FA1_col3 ( .a(pp0[3]), .b(pp1[2]), .cin(c1[1]),
                      .sum(s1[3]),  .cout(c1[2]) );
Full_Adder FA1_col4 ( .a(pp0[4]), .b(pp1[3]), .cin(c1[2]),
                      .sum(s1[4]),  .cout(c1[3]) );
Full_Adder FA1_col5 ( .a(pp0[5]), .b(pp1[4]), .cin(c1[3]),
                      .sum(s1[5]),  .cout(c1[4]) );
Full_Adder FA1_col6 ( .a(pp0[6]), .b(pp1[5]), .cin(c1[4]),
                      .sum(s1[6]),  .cout(c1[5]) );
Full_Adder FA1_col7 ( .a(pp0[7]), .b(pp1[6]), .cin(c1[5]),
                      .sum(s1[7]),  .cout(c1[6]) );

// col 8 — HA
Half_Adder HA1_col8 ( .a(pp1[7]), .b(c1[6]),
                      .sum(s1[8]),  .cout(c1[7]) );
                      
wire [9:0] int1;
assign int1 = { c1[7], s1 };

wire [9:0] s2;
wire [8:0] c2;

assign s2[0] = int1[0];     
assign s2[1] = int1[1];     

// col 2 — HA
Half_Adder HA2_col2 ( .a(int1[2]), .b(pp2[0]),
                      .sum(s2[2]),  .cout(c2[0]) );

// col 3-9 — FA
Full_Adder FA2_col3 ( .a(int1[3]), .b(pp2[1]), .cin(c2[0]),
                      .sum(s2[3]),  .cout(c2[1]) );
Full_Adder FA2_col4 ( .a(int1[4]), .b(pp2[2]), .cin(c2[1]),
                      .sum(s2[4]),  .cout(c2[2]) );
Full_Adder FA2_col5 ( .a(int1[5]), .b(pp2[3]), .cin(c2[2]),
                      .sum(s2[5]),  .cout(c2[3]) );
Full_Adder FA2_col6 ( .a(int1[6]), .b(pp2[4]), .cin(c2[3]),
                      .sum(s2[6]),  .cout(c2[4]) );
Full_Adder FA2_col7 ( .a(int1[7]), .b(pp2[5]), .cin(c2[4]),
                      .sum(s2[7]),  .cout(c2[5]) );
Full_Adder FA2_col8 ( .a(int1[8]), .b(pp2[6]), .cin(c2[5]),
                      .sum(s2[8]),  .cout(c2[6]) );
Full_Adder FA2_col9 ( .a(int1[9]), .b(pp2[7]), .cin(c2[6]),
                      .sum(s2[9]),  .cout(c2[7]) );
wire [10:0] int2;
assign int2 = { c2[7], s2 };   

wire [10:0] s3;
wire  [9:0] c3;

assign s3[0] = int2[0];     
assign s3[1] = int2[1];   
assign s3[2] = int2[2];     

// col 3 — HA
Half_Adder HA3_col3 ( .a(int2[3]), .b(pp3[0]),
                      .sum(s3[3]),  .cout(c3[0]) );

// col 4-10 — FA
Full_Adder FA3_col4  ( .a(int2[4]),  .b(pp3[1]), .cin(c3[0]),
                       .sum(s3[4]),   .cout(c3[1]) );
Full_Adder FA3_col5  ( .a(int2[5]),  .b(pp3[2]), .cin(c3[1]),
                       .sum(s3[5]),   .cout(c3[2]) );
Full_Adder FA3_col6  ( .a(int2[6]),  .b(pp3[3]), .cin(c3[2]),
                       .sum(s3[6]),   .cout(c3[3]) );
Full_Adder FA3_col7  ( .a(int2[7]),  .b(pp3[4]), .cin(c3[3]),
                       .sum(s3[7]),   .cout(c3[4]) );
Full_Adder FA3_col8  ( .a(int2[8]),  .b(pp3[5]), .cin(c3[4]),
                       .sum(s3[8]),   .cout(c3[5]) );
Full_Adder FA3_col9  ( .a(int2[9]),  .b(pp3[6]), .cin(c3[5]),
                       .sum(s3[9]),   .cout(c3[6]) );
Full_Adder FA3_col10 ( .a(int2[10]), .b(pp3[7]), .cin(c3[6]),
                       .sum(s3[10]),  .cout(c3[7]) );

assign P = { c3[7], s3[10:0] };

endmodule
