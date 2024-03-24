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


module  ALU#(parameter W = 32)( output [W-1:0] R0,
            output overflow, zero, carry,
            input [W-1:0] R2, R3,
            input [2:0]opcode,
            input clk);

    wire [W-1:0] Mov, Not, Add, Nor, Sub, Nand, And, SLT, R0_in, subd;
    
    assign Mov = R2;
    
    NOT #(W) not32 (Not, R2);
    
    wire coutA, overflowA;
    Adder #(W) add32 (coutA, overflowA, Add, R2, R3, 0);

    NOR #(W) nor32 (Nor, R2, R3);

    wire coutS, overflowS;
    Adder #(W) sub32 (coutS,  overflowS, Sub, R2, R3, 1);

    NAND #(W) nand32 (Nand, R2, R3);

    AND #(W) AND (And, R2, R3);

    wire coutSS, overflowSS; 
    wire cd,od;
    
    wire [W+3 : 0] SLTVal;
        Adder #(W+4) sub32S (cd, od, SLTVal, {{R2[W-1],R2[W-1],R2[W-1],R2[W-1]}, R2}, {{R3[W-1],R3[W-1],R3[W-1],R3[W-1]}, R3}, 1);
    Adder #(W) sub32SF (coutSS, overflowSS, subd, R2, R3, 1);
    assign SLT = SLTVal[W+3];

    MUX38 #(W) mux38 (R0_in, Mov, Not, Add, Nor, Sub, Nand, And, SLT, opcode);
    assign R0 = R0_in;
    
    assign overflow = (overflowS && opcode == 3'b100) || (overflowSS && opcode == 3'b111 );
    assign zero = (R0_in == 0) ? 1 : 0;
    assign carry = (coutA && opcode == 3'b010) || (coutSS && opcode == 3'b111) || (coutS && opcode == 3'b100);
endmodule
