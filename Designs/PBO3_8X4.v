`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.04.2026 02:55:50
// Design Name: 
// Module Name: PBO3_8X4
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


module PBO3_8X4(
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

Half_Adder HA1_col1 ( .a(pp0[1]), .b(pp1[0]),
                      .sum(s1[1]),  .cout(c1[0]) );


assign s1[2] = pp0[2] | pp1[1];  
assign c1[1] = 0;

assign s1[3] = pp0[3] | pp1[2];   
assign c1[2] = 0;

assign s1[4] = pp0[4] | pp1[3];   
assign c1[3] = 0;

Full_Adder FA1_col5 ( .a(pp0[5]), .b(pp1[4]), .cin(c1[3]),
                      .sum(s1[5]),  .cout(c1[4]) );
Full_Adder FA1_col6 ( .a(pp0[6]), .b(pp1[5]), .cin(c1[4]),
                      .sum(s1[6]),  .cout(c1[5]) );
Full_Adder FA1_col7 ( .a(pp0[7]), .b(pp1[6]), .cin(c1[5]),
                      .sum(s1[7]),  .cout(c1[6]) );

Half_Adder HA1_col8 ( .a(pp1[7]), .b(c1[6]),
                      .sum(s1[8]),  .cout(c1[7]) );
                      
wire [9:0] int1;
assign int1 = { c1[7], s1 };

wire [9:0] s2;
wire [8:0] c2;

assign s2[0] = int1[0];     
assign s2[1] = int1[1];     

assign s2[2] = int1[2] | pp2[0];
assign c2[0] = 0;

assign s2[3] = int1[3] | pp2[1];
assign c2[1] = 0;

assign s2[4] = int1[4] | pp2[2];
assign c2[2] = 0;

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

assign s3[3] = int2[3] | pp3[0];
assign c3[0] = 0;

assign s3[4] = int2[4] | pp3[1];
assign c3[1] = 0;

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