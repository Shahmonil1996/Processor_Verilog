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
module reg_file(
    input [2:0] read_reg_a,
	 input [2:0] read_reg_b,
    input [2:0] write_reg,
    input [7:0] write_data,
	 input reset,
    input reg_write,
    output reg [7:0] read_data_a,
	 output reg [7:0] read_data_b
    );
	 
reg [7:0] regfile[7:0]; // creating a memory unit
always@(posedge reset)
	begin // reinitializing the memory on reset
		regfile[0]=8'b000; 		regfile[1]=8'b001;
		regfile[2]=8'b010; 		regfile[3]=8'b011;
		regfile[4]=8'b100; 		regfile[5]=8'b101;
		regfile[6]=8'b110; 		regfile[7]=8'b111;
	end
	on 
always@(*)
	begin
		if(reg_write == 1) // writing data to register file only on reg write
			begin
				regfile[write_reg] = write_data;
			end
		read_data_a = regfile[read_reg_a]; // reading data 1
		read_data_b = regfile[read_reg_b]; // reading data 2
	end
endmodule
