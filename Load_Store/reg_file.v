`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:43:39 04/21/2017 
// Design Name: 
// Module Name:    reg_file 
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
module reg_file(
    input clk,
    input reset,
	 input reg_write,
    input [2:0] reg_addr,
    input [7:0] write_data,
    output [7:0] read_data
    );
assign read_data = regfile[reg_addr];
reg [7:0] regfile [7:0];
always@(posedge clk , negedge reset)
	begin
		if(reset ==0)
			begin
				regfile[0]= 8'b0;
				regfile[1]= 8'b1;
				regfile[2]= 8'b10;
				regfile[3]= 8'b11;
				regfile[4]= 8'b100;
				regfile[5]= 8'b101;
				regfile[6]= 8'b110;
				regfile[7]= 8'b111;
			end
		else 
			begin
				if(reg_write == 1)
					regfile[reg_addr] = write_data;
			end
	end
endmodule
