`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/22/2024 03:46:40 AM
// Design Name: 
// Module Name: Verification_ALU
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


module Verification_ALU( output [31:0] R0,
            output reg overflow, zero, carry,
            input [31:0] R2, R3,
            input [2:0] opcode,
            input clk);

        reg [32:0]out, tmp;
        always @(*) begin
            case(opcode)
                3'b000      :   out = R2;
                3'b001      :   out = ~R2;
                3'b010      :   begin  
                                    out = R2 + R2;
                                    overflow = 0;
                                    carry = out[32];
                                    end
                3'b011      :   out = ~(R2 | R3);
                3'b100      :   begin 
                                    out = R2 - R3;
                                    carry = out[32];
                                    overflow = (R2[31] == R3[31]) && (R2[31] != out[31]);
                                    end
                3'b101      :   out = ~(R2 & R3);   
                3'b110      :   out = R2 & R3;
                3'b111      :   begin
                                    out = (R2 < R3) ? 1 : 0;
                                    tmp = R2 - R3;
                                    carry = tmp[32];
                                    overflow = (R2[31] == R3[31]) && (R2[31] != tmp[31]);
                                    end
            endcase
        end
endmodule
