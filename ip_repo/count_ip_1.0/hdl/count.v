`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/12/18 09:36:04
// Design Name: 
// Module Name: count
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

module count(
    input   wire    sys_clk     ,
    input   wire    sys_rst_n   ,
    input   wire    start_flag  ,
    input   wire    end_flag    ,
    
    output  reg [20:0]  cnt
    );
    
reg     state;

always @(posedge sys_clk or negedge sys_rst_n)
    if(!sys_rst_n)
        state <= 1'b0;
    else if(start_flag && !end_flag)
        state <= 1'b1;
    else
        state <= state;
     
always @(posedge sys_clk or negedge sys_rst_n)
    if(!sys_rst_n)
        cnt <= 21'd0;
    else if(state == 1'b1)
        cnt <= cnt + 1;


    
endmodule
