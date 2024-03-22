`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/22/2024 12:49:52 AM
// Design Name: 
// Module Name: NOT_veri
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


module NOT_veri(output [31:0]to_reg, input [31:0]A, input [31:0]B, input select);
   assign to_reg = (select) ? (~A) : (A + B);
endmodule
