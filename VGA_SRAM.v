module VGA_SRAM (
    input pixel_clk,
    input [15:0]SRAM_DQ
    );

    wire [11:0]counterPclkH;
    wire [9:0]counterLines;
    wire nOE;

    VGA_signals VGA_signals (.pixel_clk(pixel_clk), .counterPclkH(counterPclkH), .counterLines(counterLines), .VGA_BLANK_N(nOE));

    SRAM SRAM (.pixel_clk(pixel_clk), .counterPclkH(counterPclkH), .counterLines(counterLines), .SRAM_DQ(SRAM_DQ), .nOE(nOE));

endmodule
