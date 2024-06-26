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
    wire [31:0]fa_out;
    wire co;
    Adder fa(cout, fa_out, adder_inA, adder_inB, cin);
    Regi #(32) regi(sum, clk, fa_out);
    Regi #(1) co1(cout, clk, co);
endmodule
