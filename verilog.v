// Copyright (C) 2022  Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions
// and other software and tools, and any partner logic
// functions, and any output files from any of the foregoing
// (including device programming or simulation files), and any
// associated documentation or information are expressly subject
// to the terms and conditions of the Intel Program License
// Subscription Agreement, the Intel Quartus Prime License Agreement,
// the Intel FPGA IP License Agreement, or other applicable license
// agreement, including, without limitation, that your use is for
// the sole purpose of programming logic devices manufactured by
// Intel and sold by Intel or its authorized distributors.  Please
// refer to the applicable agreement for further details, at
// https://fpgasoftware.intel.com/eula.

// PROGRAM		"Quartus Prime"
// VERSION		"Version 21.1.1 Build 850 06/23/2022 SJ Lite Edition"
// CREATED		"Fri Jul 29 18:16:10 2022"

module verilog(
    CLOCK_50,
    SW,
    KEY,
    HEX0,
    HEX1,
    HEX2,
    HEX3,
    LEDR,
//saida_endereco,
//saida_inst,
//saida_ula,
//saida_mem,
//saida_reg_rd,
//saida_reg_rs,
//saida_reg_rt,
//saida_opcode,
//saida_varx,
//saida_vary,
//saida_jump,
//saida_clock,
//escreve_mem,
//escreve_reg,
//entrada_reg,
//reg_rd,
//reg_rs,
//reg_rt
);

input wire CLOCK_50;
input wire [3:0] KEY;
input wire [17:0] SW;
output reg [6:0] HEX3;
output reg [6:0] HEX2;
output reg [6:0] HEX1;
output reg [6:0] HEX0;
output reg [17:0] LEDR;

wire [2:0] alucrt;
wire [31:0] dados;
wire selecionaIn;
wire escreveM;
wire escreveR;
wire escreverOut;
wire escreverIn;
wire [31:0] extensor;
wire imediato;
wire [31:0] instrucao;
wire jump;
wire [31:0] jumpE;
wire muxreg;
wire n;
wire [31:0] rd;
wire [31:0] resultado;
wire [31:0] rs;
wire [31:0] rt;
wire [31:0] saida;
wire [31:0] saidaescrita;
wire [31:0] saidamemdados;
wire [31:0] saidaultimo;
wire seldados;
wire [1:0] selextensor;
wire selulmux;
wire [3:0] setseg1;
wire [3:0] setseg2;
wire [3:0] setseg3;
wire [3:0] setseg4;
wire [31:0] vary;
wire z;
wire seg4_a;
wire seg4_b;
wire seg4_c;
wire seg4_d;
wire seg4_e;
wire seg4_f;
wire seg4_g;
wire seg3_a;
wire seg3_b;
wire seg3_c;
wire seg3_d;
wire seg3_e;
wire seg3_f;
wire seg3_g;
wire seg2_a;
wire seg2_b;
wire seg2_c;
wire seg2_d;
wire seg2_e;
wire seg2_f;
wire seg2_g;
wire seg1_a;
wire seg1_b;
wire seg1_c;
wire seg1_d;
wire seg1_e;
wire seg1_f;
wire seg1_g;

wire haltIn;
wire haltUni;
wire haltOut;
wire [17:0] saidaInput;
wire reseta;
wire clockOut;

//output reg [31:0] saida_endereco;
//output reg [31:0] saida_inst;
//output reg [31:0] saida_ula;
//output reg [31:0] saida_mem;
//output reg [31:0] saida_reg_rd;
//output reg [31:0] saida_reg_rs;
//output reg [31:0] saida_reg_rt;
//output reg [4:0] saida_opcode;
//output reg [31:0] saida_varx;
//output reg [31:0] saida_vary;
//output reg saida_jump;
//output reg saida_clock;
//output reg escreve_mem;
//output reg escreve_reg;
//output reg [31:0] entrada_reg;
//output reg [31:0] reg_rd;
//output reg [31:0] reg_rs;
//output reg [31:0] reg_rt;

ClockDivider clock_div(
    .clockIn(CLOCK_50),
    .halt(haltOut),
    .clockOut(clockOut)
);

Debouncer b2v_inst99(
    .clock(CLOCK_50),
    .botao(KEY[3]),
    .saida(selecionaIn));
//assign selecionaIn = KEY[3];

In in(
    .switch(SW),
    .escreveInput(escreverIn),
    .botao(selecionaIn),
    .haltIn(haltIn),
    .saida(saidaInput));

Halt halt_module(
    .halt1(haltIn),
    .halt2(haltUni),
    .reseta(reseta),
    .haltOut(haltOut));

Mux2 b2v_inst(
    .selecao(muxreg),
    .entrada_1(saidaultimo),
    .entrada_2(saidamemdados),
    .saida(saidaescrita));

Debouncer b2v_inst91(
    .clock(CLOCK_50),
    .botao(KEY[0]),
    .saida(reseta));

UniControle b2v_inst1(
    .clock(clockOut),
    .zero(z),
    .negativo(n),
    .imediato(extensor),
    .opcode(instrucao[31:27]),
    .rd(rd),
    .escreveR(escreveR),
    .selR(muxreg),
    .escreveM(escreveM),
    .jump(jump),
    .selE(selextensor),
    .selVarY(imediato),
    .selResultado(selulmux),
    .selDados(seldados),
    .halt(haltUni),
    .escreverOut(escreverOut),
    .escreverIn(escreverIn),
    .aluControl(alucrt),
    .jumpE(jumpE));


MemInst b2v_inst10(
    .clock(clockOut),
    .endereco(saida),
    .saida(instrucao));


Display7Seg b2v_inst11(
    .in(setseg3),
    .a(seg3_a),
    .b(seg3_b),
    .c(seg3_c),
    .d(seg3_d),
    .e(seg3_e),
    .f(seg3_f),
    .g(seg3_g));


Display7Seg b2v_inst12(
    .in(setseg2),
    .a(seg2_a),
    .b(seg2_b),
    .c(seg2_c),
    .d(seg2_d),
    .e(seg2_e),
    .f(seg2_f),
    .g(seg2_g));


Display7Seg b2v_inst13(
    .in(setseg1),
    .a(seg1_a),
    .b(seg1_b),
    .c(seg1_c),
    .d(seg1_d),
    .e(seg1_e),
    .f(seg1_f),
    .g(seg1_g));


MemDados b2v_inst16(
    .clock(clockOut),
    .escrever(escreveM),
    .dados(rd),
    .endereco(saidaultimo),
    .saida(saidamemdados));


ULA b2v_inst26(
    .selecao(alucrt),
    .var_X(rs),
    .var_Y(vary),
    .flag_N(n),
    .flag_Z(z),
    .resultado(resultado));


Mux2 b2v_inst27(
    .selecao(imediato),
    .entrada_1(rt),
    .entrada_2(extensor),
    .saida(vary));


Mux2 b2v_inst28(
    .selecao(selulmux),
    .entrada_1(resultado),
    .entrada_2(extensor),
    .saida(saidaultimo));


Registradores b2v_inst3(
    .clock(clockOut),
    .escreve_R(escreveR),
    .dados(dados),
    .endereco_E(instrucao[26:22]),
    .endereco_L1(instrucao[21:17]),
    .endereco_L2(instrucao[16:12]),
    .resultado_RD(rd),
    .resultado_RS(rs),
    .resultado_RT(rt));


Mux2 b2v_inst31(
    .selecao(seldados),
    .entrada_1(extensor),
    .entrada_2(saidaescrita),
    .saida(dados));


Out b2v_inst38(
    .escrever(escreverOut),
    .entrada(resultado),
    .clock(clockOut),
    .setseg1(setseg1),
    .setseg2(setseg2),
    .setseg3(setseg3),
    .setseg4(setseg4));


PC b2v_inst4(
    .clock(clockOut),
    .jump(jump),
    .reseta(reseta),
    .halt(haltOut),
    .endereco(jumpE),
    .saida(saida));


Display7Seg b2v_inst8(
    .in(setseg4),
    .a(seg4_a),
    .b(seg4_b),
    .c(seg4_c),
    .d(seg4_d),
    .e(seg4_e),
    .f(seg4_f),
    .g(seg4_g));


Extensor b2v_inst9(
    .selecao(selextensor),
    .entrada_1(instrucao[16:0]),
    .entrada_2(instrucao[21:0]),
    .entrada_in(saidaInput),
    .saida(extensor));

always @(*) begin
    {
        HEX3[0],
        HEX3[1],
        HEX3[2],
        HEX3[3],
        HEX3[4],
        HEX3[5],
        HEX3[6]
    } <= {seg4_a, seg4_b, seg4_c, seg4_d, seg4_e, seg4_f, seg4_g};

    {
        HEX2[0],
        HEX2[1],
        HEX2[2],
        HEX2[3],
        HEX2[4],
        HEX2[5],
        HEX2[6]
    } <= {seg3_a, seg3_b, seg3_c, seg3_d, seg3_e, seg3_f, seg3_g};

    {
        HEX1[0],
        HEX1[1],
        HEX1[2],
        HEX1[3],
        HEX1[4],
        HEX1[5],
        HEX1[6]
    } <= {seg2_a, seg2_b, seg2_c, seg2_d, seg2_e, seg2_f, seg2_g};

    {
        HEX0[0],
        HEX0[1],
        HEX0[2],
        HEX0[3],
        HEX0[4],
        HEX0[5],
        HEX0[6]
    } <= {seg1_a, seg1_b, seg1_c, seg1_d, seg1_e, seg1_f, seg1_g};

    LEDR[17] <= selecionaIn;
    LEDR[16] <= haltIn;
    LEDR[15:1] <= 15'b0;
    LEDR[1] <= reseta;
    LEDR[0] <= haltUni;

//saida_endereco = saida;
//saida_inst = instrucao;
//saida_ula = resultado;
//saida_mem = saidamemdados;
//saida_reg_rd = rd;
//saida_reg_rs = rs;
//saida_reg_rt = rt;
//saida_opcode = instrucao[31:27];
//saida_varx = rs;
//saida_vary = vary;
//saida_jump = jump;
//saida_clock = clockOut;
//escreve_mem = escreveM;
//escreve_reg = escreveR;
//entrada_reg = dados;
//reg_rd = instrucao[26:22];
//reg_rs = instrucao[21:17];
//reg_rt = instrucao[16:12];
end

endmodule
