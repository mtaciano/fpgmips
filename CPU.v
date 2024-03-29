module CPU(
    CLOCK_50,
    SW,
    KEY,
    HEX0,
    HEX1,
    HEX2,
    HEX3,
    HEX4,
//	 debug_quantum,
//	 debug_write_quantum,
//  debug_pc,
//  debug_preempt_pc,
//  debug_program_finished,
    LEDR
);

// nova instrucao que muda o quantum
// quantum == 0 desligado
// ligar quando der jump e desligar quando acabar para voltar para o so
// guardar pc na memoria 0

input wire CLOCK_50;
input wire [17:0] SW;
input wire [3:0] KEY;

output reg [6:0] HEX0;
output reg [6:0] HEX1;
output reg [6:0] HEX2;
output reg [6:0] HEX3;
output reg [6:0] HEX4;
output reg [17:0] LEDR;

//output wire [31:0] debug_quantum;
//output wire debug_write_quantum;
//output wire [31:0] debug_pc;
//output wire [31:0] debug_preempt_pc;
//output wire [31:0] debug_program_finished;
//assign debug_pc = saida;
//assign debug_preempt_pc = preemptPc;
//assign debug_program_finished = programEnded;
//assign debug_write_quantum = escreverQ;
//assign debug_quantum = rd;

// TODO: melhorar as conexões
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
wire [1:0] muxreg;
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
wire escreverQ;
wire haltOutput;

wire seg5_a;
wire seg5_b;
wire seg5_c;
wire seg5_d;
wire seg5_e;
wire seg5_f;
wire seg5_g;

wire programEnded;
wire [31:0] preemptPc;
wire [31:0] saidamempc;


ClockDivider clock_divider_mod (
    .input_clock(CLOCK_50),
    .halt(haltOut),
    .output_clock(clockOut)
);


Debouncer debouncer_mod1 (
    .clock(CLOCK_50),
    .button(KEY[3]),
    .output_button(selecionaIn)
);


Debouncer debouncer_mod2 (
    .clock(CLOCK_50),
    .button(KEY[0]),
    .output_button(reseta)
);


PC pc_mod (
    .clock(clockOut),
    .halt(haltUni),
    .jump(jump),
    .reset(reseta),
    .write_quantum(escreverQ),
    .quantum(rd),
    .jump_address(jumpE),
    .output_address(saida),
    .program_ended(programEnded)
);


Input input_mod (
    .clock(CLOCK_50),
    .button(selecionaIn),
    .output_enable(escreverIn),
    .switches(SW),
    .halt_from_input(haltIn),
    .output_value(saidaInput)
);


Out out_mod (
    .clock(CLOCK_50),
    .button(selecionaIn),
    .write_enable(escreverOut),
    .input_value(resultado),
    .sevn_seg1(setseg1),
    .sevn_seg2(setseg2),
    .sevn_seg3(setseg3),
    .sevn_seg4(setseg4),
    .halt_from_output(haltOutput)
);


Halt halt_mod (
    .halt1(haltIn),
    .halt2(haltOutput),
    .haltOut(haltOut)
);


Mux3 mux3_mod (
    .selecao(muxreg),
    .entrada1(saidaultimo),
    .entrada2(saidamemdados),
    .entrada3(saidamempc),
    .saida(saidaescrita)
);


Mux2 mux2_mod2 (
    .selecao(imediato),
    .entrada1(rt),
    .entrada2(extensor),
    .saida(vary)
);


Mux2 mux2_mod3 (
    .selecao(selulmux),
    .entrada1(resultado),
    .entrada2(extensor),
    .saida(saidaultimo)
);


Mux2 mux2_mod4 (
    .selecao(seldados),
    .entrada1(extensor),
    .entrada2(saidaescrita),
    .saida(dados)
);


Extensor extensor_mod (
    .selecao(selextensor),
    .entrada_1(instrucao[16:0]),
    .entrada_2(instrucao[21:0]),
    .entrada_in(saidaInput),
    .saida(extensor)
);


UniControle uni_controle_mod (
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
    .jumpE(jumpE),
    .escreverQuantum(escreverQ)
);


ALU alu_mod (
    .selection(alucrt),
    .x(rs),
    .y(vary),
    .is_negative(n),
    .is_zero(z),
    .output_result(resultado)
);


InstructionMemory instruction_memory_mod (
    .clock(clockOut),
    .address(saida),
    .output_instruction(instrucao)
);


DataMemory data_memory_mod (
    .clock(clockOut),
    .write_enable(escreveM),
    .input_data(rd),
    .address(saidaultimo),
    .pc(saida),
    .program_ended(programEnded),
    .output_data(saidamemdados),
    .output_saved_pc(saidamempc)
);


Registers registers_mod (
    .clock(clockOut),
    .write_enable(escreveR),
    .address_l1(instrucao[21:17]),
    .address_l2(instrucao[16:12]),
    .address_e(instrucao[26:22]),
    .data(dados),
    .output_rs(rs),
    .output_rd(rd),
    .output_rt(rt)
);


Display7Seg display_7seg_mod4 (
    .in(setseg4),
    .a(seg4_a),
    .b(seg4_b),
    .c(seg4_c),
    .d(seg4_d),
    .e(seg4_e),
    .f(seg4_f),
    .g(seg4_g)
);


Display7Seg display_7seg_mod3 (
    .in(setseg3),
    .a(seg3_a),
    .b(seg3_b),
    .c(seg3_c),
    .d(seg3_d),
    .e(seg3_e),
    .f(seg3_f),
    .g(seg3_g)
);


Display7Seg display_7seg_mod2 (
    .in(setseg2),
    .a(seg2_a),
    .b(seg2_b),
    .c(seg2_c),
    .d(seg2_d),
    .e(seg2_e),
    .f(seg2_f),
    .g(seg2_g)
);


Display7Seg display_7seg_mod1 (
    .in(setseg1),
    .a(seg1_a),
    .b(seg1_b),
    .c(seg1_c),
    .d(seg1_d),
    .e(seg1_e),
    .f(seg1_f),
    .g(seg1_g)
);

ProgramNumber program_number_mod (
    .in(saida),
    .a(seg5_a),
    .b(seg5_b),
    .c(seg5_c),
    .d(seg5_d),
    .e(seg5_e),
    .f(seg5_f),
    .g(seg5_g)
);



always @(*) begin
    {
        HEX4[0],
        HEX4[1],
        HEX4[2],
        HEX4[3],
        HEX4[4],
        HEX4[5],
        HEX4[6]
    } = {seg5_a, seg5_b, seg5_c, seg5_d, seg5_e, seg5_f, seg5_g};

    {
        HEX3[0],
        HEX3[1],
        HEX3[2],
        HEX3[3],
        HEX3[4],
        HEX3[5],
        HEX3[6]
    } = {seg4_a, seg4_b, seg4_c, seg4_d, seg4_e, seg4_f, seg4_g};

    {
        HEX2[0],
        HEX2[1],
        HEX2[2],
        HEX2[3],
        HEX2[4],
        HEX2[5],
        HEX2[6]
    } = {seg3_a, seg3_b, seg3_c, seg3_d, seg3_e, seg3_f, seg3_g};

    {
        HEX1[0],
        HEX1[1],
        HEX1[2],
        HEX1[3],
        HEX1[4],
        HEX1[5],
        HEX1[6]
    } = {seg2_a, seg2_b, seg2_c, seg2_d, seg2_e, seg2_f, seg2_g};

    {
        HEX0[0],
        HEX0[1],
        HEX0[2],
        HEX0[3],
        HEX0[4],
        HEX0[5],
        HEX0[6]
    } = {seg1_a, seg1_b, seg1_c, seg1_d, seg1_e, seg1_f, seg1_g};

    LEDR[17] = selecionaIn;
    LEDR[16] = haltIn;
    LEDR[15] = haltOutput;
    LEDR[14:3] = 12'b0;
    LEDR[2] = haltOut;
    LEDR[1] = reseta;
    LEDR[0] = haltUni;
end

endmodule
