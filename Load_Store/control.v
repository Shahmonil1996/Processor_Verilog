`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:46:34 04/21/2017 
// Design Name: 
// Module Name:    control 
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
module control(
    input [1:0] opcode,
    output reg reg_write,
	 output reg mem_read,
	 output reg mem_write
    );

always@(opcode)
	begin	
		case(opcode)
			2'b00:
				begin
					reg_write = 1'b1;
					mem_read = 1'b1;
					mem_write = 1'b0;
				end
			2'b11: 
				begin
					reg_write = 1'b0;
					mem_read = 1'b0;
					mem_write = 1'b1;
				end
		endcase
	end
endmodule
