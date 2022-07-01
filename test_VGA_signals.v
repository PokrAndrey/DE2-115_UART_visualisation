`timescale 1 ns / 100 ps
module test_VGA_signals( 
    );

    reg clk;

    VGA_signals VGA_signals (.pixel_clk(clk));

    always 
    begin
        clk = 0;
        #1;
        clk = 1;
        #1;        
    end    
    initial
    begin
        $dumpvars;
        #4085000 $finish;
    end

endmodule
