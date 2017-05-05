`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: BITS Pilani Hyderabad Campus
// Engineer: MONIL SHAH
// 
// Create Date:    09:38:49 04/06/2017 
// Design Name: 
// Module Name:    reg_file 
// Project Name: 	Computer Architecture Assignment 2
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
    input [7:0] pc,
    input reset,
    output reg [7:0] ins_code
    );
reg [7:0] ins_mem [6:0];
always@(pc)
begin
 ins_code = ins_mem[pc];
end
always@(reset)
	begin
	if(reset ==1 )
	begin
		//reinitialize
		ins_mem[0] = 8'b00011011;
		ins_mem[1] = 8'b01010011;
		ins_mem[2] = 8'b01011010;
		ins_mem[3] = 8'b11000001;
		ins_mem[4] = 8'b00011011;
		ins_mem[5] = 8'b01011011;
		ins_mem[6] = 8'b01011000;
		end
	end

endmodule
