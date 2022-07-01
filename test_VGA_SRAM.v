`timescale 1 ns / 100 ps
module test_VGA_SRAM( 
    );

    reg clk;
    reg [15:0]SRAM_DQ;

    VGA_SRAM VGA_SRAM (.pixel_clk(clk), .SRAM_DQ(SRAM_DQ));

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
        $dumpvars;
        #4085000 $finish;
    end

endmodule
