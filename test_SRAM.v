`timescale 1 ns / 100 ps
module test_SRAM( 
    );

    reg clk;
    reg [15:0]Dout;

    SRAM SRAM (.pixel_clk(clk), .Dout(Dout));

    always 
    begin
        clk = 0;
        #1;
        clk = 1;
        #1;        
    end    
    initial
    begin
        Dout = 123;
        $dumpvars;
        #4085000 $finish;
    end

endmodule
