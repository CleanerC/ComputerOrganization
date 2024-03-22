`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/21/2024 11:13:59 PM
// Design Name: 
// Module Name: Adder
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


module Adder #(parameter W = 32)(output cout, output [W-1:0]adder_out, input [W-1:0]adder_inA, input [W-1:0]adder_inB, input cin);
    wire [W-2:0] adder_cout;
    FA_str fa0(adder_cout[0], adder_out[0], adder_inA[0], adder_inB[0], cin);
    genvar ii;
    generate
        for(ii = 1; ii < W - 1; ii = ii + 1) begin
            FA_str fa(adder_cout[ii], adder_out[ii], adder_inA[ii], adder_inB[ii], adder_cout[ii - 1]);
        end
    endgenerate
    FA_str fa31(cout, adder_out[31], adder_inA[31], adder_inB[31], adder_cout[30]);
endmodule
