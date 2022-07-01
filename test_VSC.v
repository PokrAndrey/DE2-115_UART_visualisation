`timescale 1 ns / 100 ps
module test_VGA_SRAM( 
    );

    reg clk;
    reg [15:0]SRAM_DQ;
    reg S;
    reg R;
    reg stop;

    VGAandSRAMandControl VGAandSRAMandControl (.pixel_clk(clk), .SRAM_DQ(SRAM_DQ), .R(R), .S(S), .stop(stop));

    always 
    begin
        clk = 0;
        #1;
        clk = 1;
        SRAM_DQ = SRAM_DQ + 1;
        #1;        
    end    
    initial
    begin
        SRAM_DQ = 0;
        S = 0;
        R = 0;
        stop = 0;

        $dumpvars;
        /*#10; S = 1;
        #2; S = 0;
        #400000; R = 1;
        #2; R = 0;*/
        
        #5106000 $finish;
    end

endmodule
