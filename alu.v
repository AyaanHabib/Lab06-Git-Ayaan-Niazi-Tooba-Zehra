`timescale 1ns / 1ps

module alu(
    input  wire [31:0] a,
    input  wire [31:0] b,
    input  wire [3:0]  alucontrol,
    output reg  [31:0] aluresult,
    output wire        zero
);

 
    assign zero = (aluresult == 32'b0);

    always @(*) begin
        case (alucontrol)
            4'b0000: aluresult = a & b;          
            4'b0001: aluresult = a | b;          
            4'b0011: aluresult = a ^ b;         
            4'b0010: aluresult = a + b;          
            4'b0110: aluresult = a - b;          
            4'b0100: aluresult = a << b[4:0];    
            4'b0101: aluresult = a >> b[4:0];    
            default: aluresult = 32'b0;
        endcase
    end

endmodule
