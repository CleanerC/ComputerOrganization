`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/21/2024 11:34:23 PM
// Design Name: 
// Module Name: Adder_top
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


module Adder_top(output cout, output [31:0]sum, input [31:0]adder_inA, input [31:0]adder_inB, input cin, input clk);
    wire [32:0]fa_out;
    Adder fa(cout, fa_out[31:0], adder_inA, adder_inB, cin);
    Regi regi(sum, clk, fa_out);
endmodule
