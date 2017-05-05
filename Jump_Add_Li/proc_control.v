`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:39:44 04/09/2017 
// Design Name: 
// Module Name:    proc_control 
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
module proc_control(
    input [7:0] ins_code,
	 input clk,
    output reg reg_write,
    output reg reg_dst,
    output reg pc_src,
	 output reg data_write
    );

always@(ins_code , negedge clk)
	begin
		case(ins_code[7:6])
			2'b00: 
			begin
				reg_write = 1'b1;
				reg_dst = 1'b0;
				pc_src=1'b0;
				data_write = 1'b1;
			end
			2'b01:
			begin
				reg_write = 1'b1;
				reg_dst = 1'b1;
				pc_src=1'b0;
				data_write = 1'b0;
			end
			2'b11:
			begin
				reg_write = 1'b0;
				reg_dst = 1'b0;
				pc_src=1'b1;
				data_write = 1'b0;
			end
		endcase
		end
endmodule
