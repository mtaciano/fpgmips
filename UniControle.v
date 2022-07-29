module UniControle (
    opcode,
    rd,
    imediato,
    zero,
    negativo,
    aluControl,
    escreveR,
    selR,
    escreveM,
    jump,
    selE,
    selVarY,
    selResultado,
    selDados,
    jumpE,
    halt,
	 escreverOut
);

input [4:0] opcode;
input [31:0] rd;
input [31:0] imediato;
input zero, negativo;

output reg [2:0] aluControl;
output reg escreveR;
output reg selR;
output reg escreveM;
output reg jump;
output reg selE;
output reg selVarY;
output reg selResultado;
output reg selDados;
output reg [31:0] jumpE;
output reg halt;

output reg escreverOut;

always @(opcode or rd or imediato or zero or negativo) begin
    case (opcode)
        5'b00000: begin // NOP
            selDados=1'bx;
            escreveR=1'b0;
            aluControl=3'bxxx;
            selE=1'bx;
            selVarY=1'bx;
            selR=1'bx;
            selResultado=1'bx;
            escreveM=1'b0;
            jumpE=32'b0;
            jump=1'b0;
            halt=1'b0;
				escreverOut=1'b0;
        end
        5'b00001: begin // HLT
            selDados=1'bx;
            escreveR=1'b0;
            aluControl=3'bxxx;
            selE=1'bx;
            selVarY=1'bx;
            selR=1'bx;
            selResultado=1'bx;
            escreveM=1'b0;
            jumpE=32'b0;
				jump=1'b0;
            halt=1'b1;
				escreverOut=1'b0;
        end
        5'b00010: begin // IN
            selDados=1'b0;
            escreveR=1'b1;
            aluControl=3'bxxx;
            selE=1'b0;
            selVarY=1'bx;
            selR=1'bx;
            selResultado=1'bx;
            escreveM=1'b0;
            jumpE=32'b0;
            jump=1'b0;
            halt=1'b0;
				escreverOut=1'b0;
        end
        5'b00011: begin // OUT
            selDados=1'b1;
            escreveR=1'b0;
            aluControl=3'b000;
            selE=1'bx;
            selVarY=1'bx;
            selR=1'b0;
            selResultado=1'b0;
            escreveM=1'b0;
            jumpE=32'b0;
            jump=1'b0;
            halt=1'b0;
				escreverOut=1'b1;
        end
        5'b00100: begin // AND
            selDados=1'b1;
            escreveR=1'b1;
            aluControl=3'b011;
            selE=1'bx;
            selVarY=1'b0;
            selR=1'b0;
            selResultado=1'b0;
            escreveM=1'b0;
            jumpE=32'b0;
            jump=1'b0;
            halt=1'b0;
				escreverOut=1'b0;
        end
        5'b00101: begin // ANDI
            selDados=1'b1;
            escreveR=1'b1;
            aluControl=3'b011;
            selE=1'b0;
            selVarY=1'b1;
            selR=1'b0;
            selResultado=1'b0;
            escreveM=1'b0;
            jumpE=32'b0;
            jump=1'b0;
            halt=1'b0;
				escreverOut=1'b0;
        end
        5'b00110: begin // OR
            selDados=1'b1;
            escreveR=1'b1;
            aluControl=3'b100;
            selE=1'bx;
            selVarY=1'b0;
            selR=1'b0;
            selResultado=1'b0;
            escreveM=1'b0;
            jumpE=32'b0;
            jump=1'b0;
            halt=1'b0;
				escreverOut=1'b0;
        end
        5'b00111: begin // ORI
            selDados=1'b1;
            escreveR=1'b1;
            aluControl=3'b100;
            selE=1'b0;
            selVarY=1'b1;
            selR=1'b0;
            selResultado=1'b0;
            escreveM=1'b0;
            jumpE=32'b0;
            jump=1'b0;
            halt=1'b0;
				escreverOut=1'b0;
        end
        5'b01000: begin // SL
            selDados=1'b1;
            escreveR=1'b1;
            aluControl=3'b101;
            selE=1'b0;
            selVarY=1'b1;
            selR=1'b0;
            selResultado=1'b0;
            escreveM=1'b0;
            jumpE=32'b0;
            jump=1'b0;
            halt=1'b0;
				escreverOut=1'b0;
        end
        5'b01001: begin // SR
            selDados=1'b1;
            escreveR=1'b1;
            aluControl=3'b110;
            selE=1'b0;
            selVarY=1'b1;
            selR=1'b0;
            selResultado=1'b0;
            escreveM=1'b0;
            jumpE=32'b0;
            jump=1'b0;
            halt=1'b0;
				escreverOut=1'b0;
        end
        5'b01010: begin // NOT
            selDados=1'b1;
            escreveR=1'b1;
            aluControl=3'b111;
            selE=1'bx;
            selVarY=1'bx;
            selR=1'b0;
            selResultado=1'b0;
            escreveM=1'b0;
            jumpE=32'b0;
            jump=1'b0;
            halt=1'b0;
				escreverOut=1'b0;
        end
        5'b01011: begin // ADD
            selDados=1'b1;
            escreveR=1'b1;
            aluControl=3'b001;
            selE=1'bx;
            selVarY=1'b0;
            selR=1'b0;
            selResultado=1'b0;
            escreveM=1'b0;
            jumpE=32'b0;
            jump=1'b0;
            halt=1'b0;
				escreverOut=1'b0;
        end
        5'b01100: begin // ADDI
            selDados=1'b1;
            escreveR=1'b1;
            aluControl=3'b001;
            selE=1'b0;
            selVarY=1'b1;
            selR=1'b0;
            selResultado=1'b0;
            escreveM=1'b0;
            jumpE=32'b0;
            jump=1'b0;
            halt=1'b0;
				escreverOut=1'b0;
        end
        5'b01101: begin // SUB
            selDados=1'b1;
            escreveR=1'b1;
            aluControl=3'b010;
            selE=1'bx;
            selVarY=1'b0;
            selR=1'b0;
            selResultado=1'b0;
            escreveM=1'b0;
            jumpE=32'b0;
            jump=1'b0;
            halt=1'b0;
				escreverOut=1'b0;
        end
        5'b01110: begin // SUBI
            selDados=1'b1;
            escreveR=1'b1;
            aluControl=3'b010;
            selE=1'b0;
            selVarY=1'b1;
            selR=1'b0;
            selResultado=1'b0;
            escreveM=1'b0;
            jumpE=32'b0;
            jump=1'b0;
            halt=1'b0;
				escreverOut=1'b0;
        end
        5'b01111: begin // STORE
            selDados=1'bx;
            escreveR=1'b0;
            aluControl=3'bxxx;
            selE=1'b1;
            selVarY=1'bx;
            selR=1'bx;
            selResultado=1'b1;
            escreveM=1'b1;
            jumpE=32'b0;
            jump=1'b0;
            halt=1'b0;
				escreverOut=1'b0;
        end
        5'b10000: begin // MOVE
            selDados=1'b1;
            escreveR=1'b1;
            aluControl=3'b000;
            selE=1'bx;
            selVarY=1'bx;
            selR=1'b0;
            selResultado=1'b0;
            escreveM=1'b0;
            jumpE=32'b0;
            jump=1'b0;
            halt=1'b0;
				escreverOut=1'b0;
        end
        5'b10001: begin // LOAD
            selDados=1'b1;
            escreveR=1'b1;
            aluControl=3'bxxx;
            selE=1'bx;
            selVarY=1'bx;
            selR=1'b1;
            selResultado=1'b1;
            escreveM=1'b0;
            jumpE=32'b0;
            jump=1'b0;
            halt=1'b0;
				escreverOut=1'b0;
        end
        5'b10010: begin // LOADI
            selDados=1'b0;
            escreveR=1'b1;
            aluControl=3'bxxx;
            selE=1'b1;
            selVarY=1'bx;
            selR=1'bx;
            selResultado=1'bx;
            escreveM=1'b0;
            jumpE=32'b0;
            jump=1'b0;
            halt=1'b0;
				escreverOut=1'b0;
        end
        5'b10011: begin // J
            selDados=1'bx;
            escreveR=1'b0;
            aluControl=3'bxxx;
            selE=1'bx;
            selVarY=1'bx;
            selR=1'bx;
            selResultado=1'bx;
            escreveM=1'b0;
            jumpE=rd;
            jump=1'b1;
            halt=1'b0;
				escreverOut=1'b0;
        end
        5'b10100: begin // JI
            selDados=1'bx;
            escreveR=1'b0;
            aluControl=3'bxxx;
            selE=1'b1;
            selVarY=1'bx;
            selR=1'bx;
            selResultado=1'bx;
            escreveM=1'b0;
            jumpE=imediato;
            jump=1'b1;
            halt=1'b0;
				escreverOut=1'b0;
        end
        5'b10101: begin // JZ
            selDados=1'bx;
            escreveR=1'b0;
            aluControl=3'b000;
            selE=1'bx;
            selVarY=1'bx;
            selR=1'bx;
            selResultado=1'bx;
            escreveM=1'b0;
            jumpE=rd;
            if (zero == 1'b1) jump = 1'b1;
            else jump = 1'b0;
            halt=1'b0;
				escreverOut=1'b0;
        end
        5'b10110: begin // JZI
            selDados=1'bx;
            escreveR=1'b0;
            aluControl=3'bxxx;
            selE=1'b1;
            selVarY=1'bx;
            selR=1'bx;
            selResultado=1'bx;
            escreveM=1'b0;
            jumpE=imediato;
            if (zero == 1'b1) jump = 1'b1;
            else jump = 1'b0;
            halt=1'b0;
				escreverOut=1'b0;
        end
        5'b10111: begin // JN
            selDados=1'bx;
            escreveR=1'b0;
            aluControl=3'b000;
            selE=1'bx;
            selVarY=1'bx;
            selR=1'bx;
            selResultado=1'bx;
            escreveM=1'b0;
            jumpE=rd;
            if (negativo == 1'b1) jump = 1'b1;
            else jump = 1'b0;
            halt=1'b0;
				escreverOut=1'b0;
        end
        5'b11000: begin // JNI
            selDados=1'bx;
            escreveR=1'b0;
            aluControl=3'b000;
            selE=1'b1;
            selVarY=1'bx;
            selR=1'bx;
            selResultado=1'bx;
            escreveM=1'b0;
            jumpE=imediato;
            if (negativo == 1'b1) jump = 1'b1;
            else jump = 1'b0;
            halt=1'b0;
				escreverOut=1'b0;
        end
        default: begin
            selDados=1'b0;
            escreveR=1'b0;
            aluControl=3'b000;
            selE=1'b0;
            selVarY=1'b0;
            selR=1'b0;
            selResultado=1'b0;
            escreveM=1'b0;
            jumpE=32'b0;
            jump=1'b0;
            halt=1'b0;
				escreverOut=1'b0;
        end
    endcase

end

endmodule
