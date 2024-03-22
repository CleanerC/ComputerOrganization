`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/22/2024 01:36:30 AM
// Design Name: 
// Module Name: MUX38
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


module MUX38 #(parameter W = 32)(output reg [W-1:0]to_reg,
            input [W-1:0] A, B, C, D, E, F, G, H,
                  [2:0]select);

    always@(*) begin
        case(select)
            3'b000      : to_reg = A;
            3'b001      : to_reg = B;
            3'b010      : to_reg = C;
            3'b011      : to_reg = D;
            3'b100      : to_reg = E;
            3'b101      : to_reg = F;
            3'b110      : to_reg = G;
            3'b111      : to_reg = H;
        endcase
    end
endmodule
