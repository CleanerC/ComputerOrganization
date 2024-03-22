`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/22/2024 12:27:34 AM
// Design Name: 
// Module Name: MUX32
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


module MUX32 #(parameter W = 31)(output [W:0]out, input [W:0]A, input [W:0]B, input select);
    assign out = (select) ? A : B;
endmodule
