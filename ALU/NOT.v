`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/22/2024 12:22:36 AM
// Design Name: 
// Module Name: NOT
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


module NOT #(parameter W = 1)( output [W-1:0]out, input [W-1:0]A);
    genvar ii;
    generate
        for(ii = 0; ii < W; ii = ii + 1) begin
            nand nand0 (out[ii], A[ii], A[ii]);
        end
    endgenerate
endmodule
