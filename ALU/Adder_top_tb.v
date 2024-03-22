`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/21/2024 11:43:03 PM
// Design Name: 
// Module Name: Adder_top_tb
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


module Adder_top_tb();
    reg [31:0]A;
    reg [31:0]B;
    reg cin;
    reg clk;

    wire cout;
    wire [31:0]sum;

    wire coutV;
    wire [31:0]sumV;

    Adder_top test(cout, sum, A, B, cin, clk);
    Adder_veri ver(coutV, sumV, A, B, cin);

    wire eq;
    assign eq = ({cout,sum} == {coutV,sumV})? 1 : 0;

    initial begin
        #1
        clk = 0;
        cin = 0;
        A = 32'h00000000;
        B = 32'h11111111;
        #5;
        A = 32'h10101010;
        B = 32'h10101100;
        #20;
        $finish;
    end

    always 
        #5 clk = ~clk;
        

endmodule
