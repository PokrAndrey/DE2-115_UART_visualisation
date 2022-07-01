module Gen_saw (
    input clk,
    input ce,
    output wire [9:0]saw
    ); 

    //parameter A = 256; //амплитуда
    //parameter period = 64;


    reg up = 1;
    reg sign = 0;//знак пилы "0"<->"+"


    reg [5:0]cn_period = 0;

    reg [8:0]mod_saw = 0;
    wire change = ~((cn_period == 6'd63) | (cn_period == 6'd31) | (cn_period == 6'd15) | (cn_period == 6'd47));

    assign saw = sign ? -1 * mod_saw : mod_saw;
    
    always @(posedge clk)
    begin
        cn_period <= ce ? cn_period + 1 : cn_period;
        up <= ((cn_period == 0) | (cn_period == 6'd31) & ce) ? 1 : ((cn_period == 6'd16) | (cn_period == 6'd47) & ce) ? 0 : up;
        sign <= ((cn_period == 6'd63)  & ce) ? 0 : ((cn_period == 6'd31)  & ce) ? 1 : sign;
        mod_saw <= (up & ce) ? mod_saw + 1 : (~up & ce) ? mod_saw - 1 : mod_saw;
    end

    

endmodule
