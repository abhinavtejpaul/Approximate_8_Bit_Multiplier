`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.04.2026 04:18:09
// Design Name: 
// Module Name: TB_PBO5_8X4
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


module TB_PBO5_8X4( );
    reg [7:0] A;
    reg [3:0] B; 
    wire [11:0] P;   
 
    PBO5_8X4 uut (A,B,P);
    
    initial
    begin

    A = 8'd72; B = 4'd5;
    #10
    
    A = 8'd119; B = 8'd6;
    #10
    
    $finish;
    end
endmodule