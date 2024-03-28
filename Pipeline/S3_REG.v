`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/27/2024 09:59:50 AM
// Design Name: 
// Module Name: S3_REG
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


module S3_REG(
        input [31:0] ALUOUT,
        input [4:0] WS,
        input WE,
        input clk, rst,
        output reg [31:0] RESU,
        output reg [4:0] WSP,
        output reg WEP
    );
    
    always @(posedge clk)
        begin
            if(rst) begin
                RESU <= 0;
                WSP <= 0;
                WEP <= 0;
            end
            else begin
                RESU <= ALUOUT;
                WSP <= WS;
                WEP <= WE;
            end
        end
endmodule
