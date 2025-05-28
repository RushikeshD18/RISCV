`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.05.2025 18:38:20
// Design Name: 
// Module Name: prog_counter
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


module prog_counter(
    input clk,
    input [31:0] Instruction,
    input rst,
    output reg [31:0] Result
    );

reg  [31:0] data[31:0];
wire [4:0] rs1;
wire [4:0] rs2;
wire [4:0] rd;
integer i;

assign rs1 = Instruction[19:15];
assign rs2 = Instruction[24:20];
assign rd = Instruction[11:07];

initial begin
    for(i =0; i<32;i=i+1) begin
        data[i] = i;
    end
end

always @(posedge clk or posedge rst) begin
if (rst) begin
    Result = 32'd0; end
else if(Instruction[6:0] == 7'b0110011) begin
        case({Instruction[31:25],Instruction[14:12]})
            10'b0000000000 : begin Result = data[rs2] + data[rs1]; end
            10'b0000000001 : begin Result = data[rs2] << 2; end
            10'b0000000010 : begin if(data[rs2] > data[rs1]) Result = data[rs1]; else Result = data[rs2]; end
            10'b0000000011 : begin if($signed(data[rs2]) > $signed(data[rs1])) Result = data[rs1]; end
            10'b0000000100 : begin Result = data[rs2] ^ data[rs1]; end
            10'b0000000101 : begin Result = data[rs1] >>> 2; end
            10'b0000000110 : begin Result = data[rs2] | data[rs1]; end
            10'b0000000111 : begin Result = data[rs2] & data[rs1]; end 
            10'b0100000000 : begin Result = data[rs2] - data[rs1]; end
            10'b0100000101 : begin Result = data[rs1] >> 2; end
            default : begin Result = 31'd0; end
        
        endcase 
    end     
end 
     
endmodule
