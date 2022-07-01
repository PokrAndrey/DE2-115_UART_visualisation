module Gen_parabola_trans (
    input clk,
    input ce,
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
    
    always @(posedge clk)
    begin
        cn_period <= ce ? cn_period + 1 : cn_period;
        up <= ((cn_period == 0) | (cn_period == 6'd31) & ce) ? 1 : ((cn_period == 6'd16) | (cn_period == 6'd47) & ce) ? 0 : up;
        sign <= ((cn_period == 6'd63)  & ce) ? 0 : ((cn_period == 6'd31)  & ce) ? 1 : sign;
        //t_en_shift <= en_shift;
        x <= (up & ce & change) ? x - 1 : (~up & ce & change) ? x + 1 : x;
        mod_par <= (up & ce) ? mod_par + (x<<1) + 1 : (~up & ce) ? mod_par - (x<<1) - 1 : mod_par;
    end

    

endmodule
