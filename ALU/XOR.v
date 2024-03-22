`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/22/2024 02:19:25 AM
// Design Name: 
// Module Name: XOR
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


module XOR #(parameter W = 1)( output [W-1:0]out, input [W-1:0]A, input [W-1:0]B);
    genvar ii;
    generate
        for(ii = 0; ii < W; ii = ii + 1) begin
            wire w0, w1, w2;
            nand nand0 (w0, A[ii], B[ii]);
            nand nand1 (w1, w0, A[ii]);
            nand nand2 (w2, w0, B[ii]);
            nand nand3 (out[ii], w1, w2);
        end
    endgenerate
endmodule