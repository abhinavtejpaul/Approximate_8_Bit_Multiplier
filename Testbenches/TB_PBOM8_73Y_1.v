`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.04.2026 04:22:32
// Design Name: 
// Module Name: TB_PBOM8_73Y_1
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


module TB_PBOM8_73Y_1( );
    reg [7:0] A;
    reg [7:0] B; 
    wire [15:0] P;   
 
    PBOM8_73Y_1 uut (A,B,P);
    
    initial
    begin

    A = 8'd72; B = 8'd5;
    #10
    
    A = 8'd119; B = 8'd6;
    #10
    
    A = 8'd150; B = 8'd116;
    #10
    
    A = 8'd148; B = 8'd207;
    #10
    
    A = 8'd250; B = 8'd99;
    #10
    
    A = 8'd177; B = 8'd105;
    #10
    
    $finish;
    end
endmodule
