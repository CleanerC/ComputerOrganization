`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/04/2024 09:30:59 AM
// Design Name: 
// Module Name: J_MUX
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


module J_MUX(
    input J,
    input [25:0] Jaddress,
    input [31:28] PC,
    input [31:0] address,
    output [31:0] out
    );
    
    wire [27:0]shift;
    assign shift = Jaddress << 2;
    assign out = (J) ? {PC, shift} : address;
    
endmodule
