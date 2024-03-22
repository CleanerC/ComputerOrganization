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


module NOT #(parameter W = 31)( output [W:0]out, input [W:0]A);
    genvar ii;
    generate
        for(ii = 0; ii <= W; ii = ii + 1) begin
            not gate(out[ii], A[ii]);
        end
    endgenerate
endmodule
