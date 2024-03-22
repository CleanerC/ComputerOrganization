`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/21/2024 11:00:25 PM
// Design Name: 
// Module Name: register
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


module Regi #(parameter W = 32)(output [W-1:0]reg_out, input clk, input [W-1:0]reg_in ); 
        genvar ii;
        generate
            for(ii = 0; ii < W + 1; ii = ii + 1) begin
                dff ff (reg_out[ii], reg_in[ii], clk);
             end
        endgenerate 
endmodule
