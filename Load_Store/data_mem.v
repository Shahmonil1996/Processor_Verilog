`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:33:06 04/21/2017 
// Design Name: 
// Module Name:    data_mem 
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
module data_mem(
    input clk,
    input reset,
    input mem_read,
    input mem_write,
    input [7:0] addr,
    input [7:0] write_data,
    output reg [7:0] read_data
    );
reg [7:0] data_mem [7:0];
always@(posedge clk, negedge reset)
	begin
		if(reset ==0) 
			begin
				data_mem[0]= 8'b0;
				data_mem[1]= 8'b1;
				data_mem[2]= 8'b10;
				data_mem[3]= 8'b11;
				data_mem[4]= 8'b100;
				data_mem[5]= 8'b101;
				data_mem[6]= 8'b110;
				data_mem[7]= 8'b111;
			end
		else 
			begin
				if(mem_read == 1)
					read_data = data_mem[addr];
				if(mem_write == 1)
					data_mem[addr] = write_data;
			end
	end
	
endmodule
