`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.04.2026 03:33:08
// Design Name: 
// Module Name: PBO10_8X4
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


module PBO10_8X4(
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


assign s1[1] = pp0[1] | pp1[0]; assign c1[0]=0;
assign s1[2] = pp0[2] | pp1[1]; assign c1[1]=0;
assign s1[3] = pp0[3] | pp1[2]; assign c1[2]=0;
assign s1[4] = pp0[4] | pp1[3]; assign c1[3]=0;
assign s1[5] = pp0[5] | pp1[4]; assign c1[4]=0;
assign s1[6] = pp0[6] | pp1[5]; assign c1[5]=0;
assign s1[7] = pp0[7] | pp1[6]; assign c1[6]=0;
assign s1[8] = pp0[8] | pp1[7]; assign c1[7]=0;
assign s1[9] = pp0[9] | pp1[8]; assign c1[8]=0;
assign s1[10] = pp0[10] | pp1[9]; assign c1[9]=0;


wire [9:0] int1 = {c1[7], s1};

wire [9:0] s2;
wire [8:0] c2;

assign s2[0]=int1[0];
assign s2[1]=int1[1];

// PBO region
assign s2[2] = int1[2]|pp2[0]; assign c2[0]=0;
assign s2[3] = int1[3]|pp2[1]; assign c2[1]=0;
assign s2[4] = int1[4]|pp2[2]; assign c2[2]=0;
assign s2[5] = int1[5]|pp2[3]; assign c2[3]=0;
assign s2[6] = int1[6]|pp2[4]; assign c2[4]=0;
assign s2[7] = int1[7]|pp2[5]; assign c2[5]=0;
assign s2[8] = int1[8]|pp2[6]; assign c2[6]=0;
assign s2[9] = int1[9]|pp2[7]; assign c2[7]=0;
assign s2[10] = int1[10]|pp2[8]; assign c2[8]=0;

wire [10:0] int2 = {c2[7], s2};

wire [10:0] s3;
wire [9:0] c3;

assign s3[0]=int2[0];
assign s3[1]=int2[1];
assign s3[2]=int2[2];

assign s3[3] = int2[3]|pp3[0]; assign c3[0]=0;
assign s3[4] = int2[4]|pp3[1]; assign c3[1]=0;
assign s3[5] = int2[5]|pp3[2]; assign c3[2]=0;
assign s3[6] = int2[6]|pp3[3]; assign c3[3]=0;
assign s3[7] = int2[7]|pp3[4]; assign c3[4]=0;
assign s3[8] = int2[8]|pp3[5]; assign c3[5]=0;
assign s3[9] = int2[9]|pp3[6]; assign c3[6]=0;
assign s3[10] = int2[10]|pp3[7]; assign c3[7]=0;

assign P = {c3[7], s3};

endmodule
