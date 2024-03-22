`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/22/2024 02:17:55 AM
// Design Name: 
// Module Name: FA
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


module FA(output cout, sum,
          input A, B, cin);
    wire w0, w1, w2, w3;
    
    XOR x1 (w0, A, B);
    XOR x2 (sum, w0, cin);
    AND a1 (w1, w0, cin);
    AND a2 (w2, A, B);
    nor n1 (w3, w1, w2);
    nand n2 (cout, w3, w3);
endmodule
