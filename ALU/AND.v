`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/22/2024 01:55:04 AM
// Design Name: 
// Module Name: AND
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


module AND #(parameter W = 1)( output [W-1:0]out, input [W-1:0]A, input [W-1:0]B);
    genvar ii;
    generate
        for(ii = 0; ii < W; ii = ii + 1) begin
            wire w0;
            nand nand0 (w0, A[ii], B[ii]);
            nand nand1 (out[ii], w0, w0);
        end
    endgenerate
endmodule