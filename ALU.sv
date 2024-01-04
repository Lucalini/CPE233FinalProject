`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/17/2023 04:35:30 PM
// Design Name: 
// Module Name: ALU
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


module ALU(

    input [31:0] op1,
    input [31:0] op2,
    input [3:0] SEL,
    output logic [31:0] result
    );
    
  always @ (*) begin
    case(SEL)
    
    4'b0000: result = op1 + op2;                                // add
    4'b0001: result = op1 << op2[4:0];                          // sll
    4'b0011: result = (op1 < op2) ? 1: 0;                       // slt
    4'b0010: result = ($signed(op1) < $signed(op2)) ? 1:0;      // sltu
    4'b0100: result = op1 ^ op2;                                // xor
    4'b0101: result = op1 >> op2[4:0];                          // srl
    4'b0110: result = op1 | op2;                                // or
    4'b0111: result = op1 & op2;                                // and
    4'b1000: result = op1 - op2;                                // subtract
    4'b1001: result = op1;                                      // lui
    4'b1101: result = ($signed(op1)) >>> op2[4:0];              // sra
    default: result = 32'hDEADBEEF;

     endcase
  end
endmodule
