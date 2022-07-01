module SRAM_control (
    input pixel_clk,
    input R,
    input S,
    input en_shift,
    input ce_addr,
    input [9:0]counterLines,
    input [11:0]counterPclkH,
    input [9:0]shift_counter,
    input wire parity_counterPclkH,
    output reg nCE = 0,
    output wire nOE,
    output reg nWE = 1,
    output reg nLB = 0,
    output reg nUB = 0,
    output reg clr = 0
    );   

    assign nOE = (nLB | nUB);

    always @(posedge pixel_clk)
    begin
        clr <= R ? 0 : S ? 1 : clr; //clear
        nWE <= (clr) ? ~counterPclkH[0] : ((nLB | nUB) & ~en_shift) ? parity_counterPclkH : 1;

    if (parity_counterPclkH | en_shift)
    begin
        nLB <= (~ce_addr & ~en_shift & ~clr) ?  shift_counter[0] : 0; 
        nUB <= (~ce_addr & ~en_shift & ~clr) ? ~shift_counter[0] : 0;
    end

    end

endmodule
