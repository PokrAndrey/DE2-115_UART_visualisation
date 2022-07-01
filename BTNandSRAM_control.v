module BTNandSRAM_control (
    input pixel_clk,
    input key,
    input EoFrame

    );

    wire moment_of_press;
    
    button button (.moment_of_press(moment_of_press), .key(key), .clk(pixel_clk));

    SRAM_control SRAM_control (.st(moment_of_press), .EoFrame(EoFrame), .pixel_clk(pixel_clk));

endmodule
     
