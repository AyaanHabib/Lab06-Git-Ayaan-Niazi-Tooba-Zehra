`timescale 1ns / 1ps
module alu_tb;

    reg  [31:0] A;
    reg  [31:0] B;
    reg  [3:0]  ALUControl;
    wire [31:0] ALUResult;
    wire        Zero;

    ALU uut(
        .A(A),
        .B(B),
        .ALUControl(ALUControl),
        .ALUResult(ALUResult),
        .Zero(Zero)
    );
    
    initial begin

        //And Test
        A=32'h0000000C;//A=12
        B=32'h0000000A;//B=10 
        ALUControl=4'b0000;//As Alucontrol=0000(And), Their binary values 1100 and 1010 will and to produce 1000
        #10;

        //Or Test
        ALUControl=4'b0001;//As Alucontrol=0001(Or), here we will or them 1100 or 1010 will produce 1110
        #10;

        //Xor Test
        ALUControl=4'b0011;//As Alucontrol=0011(Xor), here we will xor them 1100 xor 1010 will produce 0110
        #10;

        //Add Test
        A=32'd20;            
        B=32'd8;
        ALUControl=4'b0010;//As Alucontrol=0010(Add), just simple adding here, 20 + 8 = 28
        #10;

        //Sub Test
        ALUControl=4'b0110;//As Alucontrol=0110(Sub),Just simply subtracting 20 - 8 = 12
        #10;

        //Sll Test
        A=32'd4;//4 = 0100
        B=32'd1;//Shift amount=1
        ALUControl=4'b0100;//Shifts left by 1 so 0100 becomes 1000, so the value becomes 8
        #10;

        //Sr Test
        ALUControl=4'b0101;//shifts right by 1 so 0100 becomes 0010 so value becomes 2
        #10;

        //Zero Flag Test
        A=32'd7;
        B=32'd7;
        ALUControl=4'b0110;// this is just checking to see if 7 - 7 =0 will produce a zero=1
        #10;

        $stop;

    end

endmodule
