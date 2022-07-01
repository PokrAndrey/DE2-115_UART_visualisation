module Gen_parabola (
    input pixel_clk,
    input en_shift,
    output wire [9:0]par
    ); 

    //parameter A = 256; //амплитуда
    //parameter period = 64;

    reg [3:0]x = 4'hF;

    reg up = 1;
    reg sign = 0;//знак параболы "0"<->"+"

    //reg t_en_shift = 0;

    reg [5:0]cn_period = 0;

    reg [8:0]mod_par = 0;
    wire change = ~((cn_period == 6'd63) | (cn_period == 6'd31) | (cn_period == 6'd15) | (cn_period == 6'd47));

    assign par = sign ? -1 * mod_par : mod_par;
    
    always @(posedge pixel_clk)
    begin
        cn_period <= en_shift ? cn_period + 1 : cn_period;
        up <= ((cn_period == 0) | (cn_period == 6'd31) & en_shift) ? 1 : ((cn_period == 6'd16) | (cn_period == 6'd47) & en_shift) ? 0 : up;
        sign <= ((cn_period == 6'd63)  & en_shift) ? 0 : ((cn_period == 6'd31)  & en_shift) ? 1 : sign;
        //t_en_shift <= en_shift;
        x <= (up & en_shift & change) ? x - 1 : (~up & en_shift & change) ? x + 1 : x;
        mod_par <= (up & en_shift) ? mod_par + (x<<1) + 1 : (~up & en_shift) ? mod_par - (x<<1) - 1 : mod_par;
    end

    

endmodule
