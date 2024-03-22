`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/22/2024 12:00:40 AM
// Design Name: 
// Module Name: Adder_veri
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


module Adder_veri(output cout, output [31:0]sum, input [31:0]adder_inA, input [31:0]adder_inB, input cin);
    assign {cout,sum} = adder_inA + adder_inB + cin;
endmodule
