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


module Adder #(parameter W = 32)(output cout, output overflow, output [W-1:0]adder_out, input [W-1:0]adder_inA, input [W-1:0]adder_inB, input cin);
    wire [W-1:0] B;
    
    wire [W-2:0] adder_cout;
    XOR x1 (B[0], adder_inB[0], cin);
    FA fa0(adder_cout[0], adder_out[0], adder_inA[0], B[0], cin);
    genvar ii;
    generate
        for(ii = 1; ii < W - 1; ii = ii + 1) begin
            XOR x2 (B[ii], adder_inB[ii], cin);
            FA fa(adder_cout[ii], adder_out[ii], adder_inA[ii], B[ii], adder_cout[ii - 1]);
        end
    endgenerate
    XOR x3 (B[W-1], adder_inB[W-1], cin);
    FA faW(cout, adder_out[W-1], adder_inA[W-1], B[W-1], adder_cout[W-2]);
    XOR over (overflow, adder_cout[W-2], cout);
endmodule
