`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.04.2026 04:11:47
// Design Name: 
// Module Name: PBO5_8X4
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


module PBO5_8X4(
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

// col1
Half_Adder HA1_col1 (pp0[1], pp1[0], s1[1], c1[0]);

// PBO region (2–6)
assign s1[2] = pp0[2] | pp1[1]; assign c1[1]=0;
assign s1[3] = pp0[3] | pp1[2]; assign c1[2]=0;
assign s1[4] = pp0[4] | pp1[3]; assign c1[3]=0;
assign s1[5] = pp0[5] | pp1[4]; assign c1[4]=0;
assign s1[6] = pp0[6] | pp1[5]; assign c1[5]=0;

// exact
Full_Adder FA1_col7 (pp0[7], pp1[6], c1[5], s1[7], c1[6]);
Half_Adder HA1_col8 (pp1[7], c1[6], s1[8], c1[7]);

wire [9:0] int1 = {c1[7], s1};

wire [9:0] s2;
wire [8:0] c2;

assign s2[0]=int1[0];
assign s2[1]=int1[1];

// PBO region
assign s2[2]=int1[2]|pp2[0]; assign c2[0]=0;
assign s2[3]=int1[3]|pp2[1]; assign c2[1]=0;
assign s2[4]=int1[4]|pp2[2]; assign c2[2]=0;
assign s2[5]=int1[5]|pp2[3]; assign c2[3]=0;
assign s2[6]=int1[6]|pp2[4]; assign c2[4]=0;

// exact
Full_Adder FA2_col7(int1[7],pp2[5],c2[4],s2[7],c2[5]);
Full_Adder FA2_col8(int1[8],pp2[6],c2[5],s2[8],c2[6]);
Full_Adder FA2_col9(int1[9],pp2[7],c2[6],s2[9],c2[7]);

wire [10:0] int2 = {c2[7], s2};

wire [10:0] s3;
wire [9:0] c3;

assign s3[0]=int2[0];
assign s3[1]=int2[1];
assign s3[2]=int2[2];

assign s3[3]= int2[3]|pp3[0]; assign c3[0]=0;
assign s3[4]= int2[4]|pp3[1]; assign c3[1]=0;
assign s3[5]= int2[5]|pp3[2]; assign c3[2]=0;
assign s3[6]= int2[6]|pp3[3]; assign c3[3]=0;


Full_Adder FA3_col7(int2[7],pp3[4],c3[3],s3[7],c3[4]);
Full_Adder FA3_col8(int2[8],pp3[5],c3[4],s3[8],c3[5]);
Full_Adder FA3_col9(int2[9],pp3[6],c3[5],s3[9],c3[6]);
Full_Adder FA3_col10(int2[10],pp3[7],c3[6],s3[10],c3[7]);

assign P = {c3[7], s3};

endmodule
