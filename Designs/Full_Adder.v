`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.03.2026 20:12:33
// Design Name: 
// Module Name: Full_Adder
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


module Full_Adder(
    input a,b,cin,
    output sum,cout
    );
    
    wire s1,c1,c2;
    
    Half_Adder H1(a,b,s1,c1);
    Half_Adder H2(s1,cin,sum,c2);
    OR_gate O1(c1,c2,cout);
endmodule
