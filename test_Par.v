`timescale 1 ns / 100 ps
module test_Par( 
    );

    reg clk;
    reg en_shift;

    Gen_parabola Gen_parabola (.pixel_clk(clk), .en_shift(en_shift));

    always 
    begin
        clk = 0;
        #1;
        clk = 1;
        #1;        
    end 

     always 
    begin
        en_shift = 0;
        #8;
        en_shift = 1;
        #2;        
    end
   
    initial
    begin
        $dumpvars;
        #40850 $finish;
    end

endmodule
