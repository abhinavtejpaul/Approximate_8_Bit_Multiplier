`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.04.2026 02:53:46
// Design Name: 
// Module Name: TB_PBO_10
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


module TB_PBO_10( );
    reg  [7:0]  A, B;
    wire [15:0] P;
    
    PBO_10 uut(A,B,P);
    
    initial
    begin

    A = 8'd72; B = 8'd58;
    #10
    
    A = 8'd119; B = 8'd59;
    #10
    
    A = 8'd120; B = 8'd60;
    #10
    
    A = 8'd221; B = 8'd121;
    #10
    
    A = 8'd225; B = 8'd203;
    #10 
    
    $finish;
    end
endmodule
