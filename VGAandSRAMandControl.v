module VGAandSRAMandControl (
    input pixel_clk,
    input [15:0]SRAM_DQ,
    input S,
    input R,
    input stop
    );

    wire [11:0]counterPclkH;
    wire [9:0]counterLines;
    wire op;
    wire clr;
    wire en_shift;
    wire ce_addr;
    wire [9:0]shift_counter;
    wire parity_counterPclkH;
    wire [9:0]par;

    VGA_signals VGA_signals (.pixel_clk(pixel_clk), .counterPclkH(counterPclkH), .counterLines(counterLines), .V_BLANK_N(op));

    SRAM SRAM (.pixel_clk(pixel_clk), .counterPclkH(counterPclkH), .counterLines(counterLines), .data_out(SRAM_DQ), .clr(clr), .stop(stop), .shift_counter(shift_counter), .en_shift(en_shift), .ce_addr(ce_addr), .parity_counterPclkH(parity_counterPclkH), .S(S), .par(par));

    SRAM_control SRAM_control(.pixel_clk(pixel_clk), .R(R), .S(S), .counterPclkH(counterPclkH), .shift_counter(shift_counter), .clr(clr), .counterLines(counterLines), .en_shift(en_shift), .ce_addr(ce_addr), .parity_counterPclkH(parity_counterPclkH));

    Gen_parabola Gen_parabola (.pixel_clk(pixel_clk), .en_shift(en_shift), .par(par));


endmodule
