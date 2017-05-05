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
module forward(
    input [2:0] EX_rdst,
    input [2:0] ID_rdst,
    input [2:0] ID_rsrc,
    output reg F_rdst,
    output reg F_rsrc
    );

	always@(*) 
	begin as 
		// forward output of ALU if reg dst of next instruction is same as before
		if(EX_rdst == ID_rdst)
			F_rdst = 1'b0;
		else
			F_rdst = 1'b1;
			
		// forward output of ALU if reg src of next instruction is same as before	
		if(EX_rdst == ID_rsrc)
			F_rsrc = 1'b0;
		else
			F_rsrc = 1'b1;
	end
endmodule
