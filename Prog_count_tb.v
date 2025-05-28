`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.05.2025 10:49:36
// Design Name: 
// Module Name: Prog_count_tb
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


module Prog_count_tb;
reg clk;
reg rst;
reg [31:0] Instruction;

wire [31:0] Result;

prog_counter uut ( .clk(clk),.Instruction(Instruction), .rst(rst), .Result(Result));

always #5 clk = ~clk;

 initial begin
 clk = 1;
 rst=1;
 Instruction = 0;
 #30;
 rst =0;
 #20;
 
 Instruction = {7'b0000000, 5'b00010, 5'b00001,3'b000,5'b00101,7'b0110011};
  #20;
  Instruction = {7'b0100000, 5'b00010, 5'b00001,3'b000,5'b00101,7'b0110011};
  #20; 
  Instruction = {7'b0000000, 5'b01100, 5'b01011,3'b111,5'b01010,7'b0110011};
  #20; 
  Instruction = {7'b0000000, 5'b00100, 5'b00011,3'b110,5'b00110,7'b0110011};
  #20; 
  Instruction = {7'b0000000, 5'b00110, 5'b00101,3'b010,5'b00111,7'b0110011};
  #20; 
  Instruction = {7'b0100000, 5'b01000, 5'b00111,3'b101,5'b01001,7'b0110011};
  #20;  
  Instruction = {7'b0000001, 5'b00010, 5'b00001,3'b000,5'b01101,7'b0110011};
  #20; 
  
  $finish;  
 end   


endmodule
