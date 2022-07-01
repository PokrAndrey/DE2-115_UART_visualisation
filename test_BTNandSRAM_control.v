`timescale 1 ns / 100 ps
module test_VGA_SRAM( 
    );

    reg clk;
    reg EoFrame;
    reg key;

    BTNandSRAM_control BTNandSRAM_control (.pixel_clk(clk), .EoFrame(EoFrame), .key(key));

    always 
    begin
        clk = 0;
        #1;
        clk = 1;
        #1;        
    end    
    initial
    begin
        EoFrame = 0;

        key = 1;
        $dumpvars;

        #10;
        key = 0;
        #20;
        key = 1;  
    
        #10;
        EoFrame = 1;
        #2;
        EoFrame = 0;      
        
        #4085000 $finish;
    end

endmodule
