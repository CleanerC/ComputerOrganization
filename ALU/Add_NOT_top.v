`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/22/2024 12:30:36 AM
// Design Name: 
// Module Name: Add_NOT_top
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


module Add_NOT_top(output cout ,output [31:0]to_reg, input [31:0]A, input [31:0]B, input select, input clk);
    wire [31:0] NOTo;
    wire [31:0] Addero;
    
    NOT n(NOTo, A);
    Adder fa(cout, Addero, A, B , 0);
    
    wire [31:0] toreg;
    MUX32 mux1(toreg, NOTo, Addero, select);
    Regi re1(to_reg, clk, toreg);
endmodule
