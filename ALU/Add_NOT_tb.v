`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/22/2024 12:54:49 AM
// Design Name: 
// Module Name: Add_NOT_tb
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


module Add_NOT_tb();

    reg [31:0] A, B;
    reg select, clk;

    wire [31:0] mux, muxv;
    wire cout;

    Add_NOT_top n1(cout, mux, A, B, select, clk);
    NOT_veri n1v(muxv, A, B, select);

    wire flag;
    assign flag = (mux == muxv) ? 1 : 0;

    initial begin
        clk  = 0;
        #1;
        A = 32'h00000000;
        B = 32'h11111111;
        select = 0;
        #5;
        select = 1;
        #20
        $finish;
    end

    always 
        #5 clk = ~clk;

endmodule
