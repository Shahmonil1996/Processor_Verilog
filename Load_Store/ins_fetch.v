`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:40:31 04/21/2017 
// Design Name: 
// Module Name:    ins_fetch 
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
module ins_fetch(
    input clk,
    input reset,
    output reg [7:0] ins_code
    );
reg [7:0] ins_mem [10:0];
reg [7:0] PC;

always@(posedge clk , negedge reset)
	begin
		if(reset == 0)
			begin
			ins_mem[0] = 8'b11000001;
			ins_mem[1] = 8'b00001000;
			ins_mem[2] = 8'b11010011;
			ins_mem[3] = 8'b00011010;
				PC <=0;
			end
		else 
			ins_code = ins_mem[PC];
			PC = PC +8'b1;
	end
endmodule
