`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/22/2024 01:35:46 AM
// Design Name: 
// Module Name: ALU
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


module  ALU ( output reg [31:0] ALUOUT,
            input [31:0] R2, R3,
            input [5:0]opcode
            );

    wire [31:0]Mov, Not, Add, Nor, Sub, Nand, And, Slt;
    wire signed [31:0]R2S, R3S;
    assign R2S = R2;
    assign R3S = R3;
    
    assign Mov = R2;
    assign Not = ~R2;
    assign Add = R2+ R3;
    assign Nor = ~(R2 | R3);
    assign Sub = R2 - R3;
    assign Nand = ~(R2 & R3);
    assign And = R2&R3;
    assign Slt = (R2S < R3S) ? 1 : 0;
    
    wire [2:0] ALUOp;
    assign ALUOp = opcode[2:0]; 
    
    always @(*) begin
        case(ALUOp)
            3'b000  :   ALUOUT = Mov;
            3'b001  :   ALUOUT = Not;
            3'b011  :   ALUOUT = Add;
            3'b100  :   ALUOUT = Nor;
            3'b110  :   ALUOUT = Sub;
            3'b101  :   ALUOUT = Nand;
            3'b010  :   ALUOUT = And;
            3'b111  :   ALUOUT = Slt;
        endcase 
    end
    
endmodule
