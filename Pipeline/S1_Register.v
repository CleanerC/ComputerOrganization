`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:51:40 10/16/2015 
// Design Name: 
// Module Name:    S1_Register 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module S1_Register(
	input clk,
	input rst,
	input [31:0] InstrIn,
	output reg [4:0] RS1,
	output reg [4:0] RS2,
	output reg [4:0] WS,
	output reg [31:0] Imm,
	output reg [5:0] ALUOP,
	output reg WE, DS
   );

	always@(posedge clk)
		begin
		if (rst)
			begin
			RS1 <= 5'd0;
			RS2 <= 5'd0;
			WS <= 5'd0;
			WE <= 1'b0;
			end
		else
		      //rst != 1
			begin
			 if(InstrIn[29] == 0) 
			     begin
			         ALUOP <= InstrIn[31:26];
			         WS <= InstrIn[25:21];
			         RS1 <= InstrIn[20:16];
			         RS2 <= InstrIn[15:11];
			         Imm <= 32'h0000;
			         DS <= 0;
			         WE <= 1;
			     end
		    else 
		          begin
		              if(InstrIn[29] == 1)
		              begin
		              //when imm bit is not set
			             ALUOP <= InstrIn[31:26];
			             WS <= InstrIn[25:21];
			             RS1 <= InstrIn[20:16];
			             RS2 <= 5'b00000;
			             Imm <= {16'h0000, InstrIn[15:0]};
			             DS <= 1;
			             WE <= 1;
			             end
		          end
			end
		end

endmodule
