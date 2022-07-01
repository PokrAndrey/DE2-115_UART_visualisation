module receiver (
    input clk,
    input RXD,
    output reg pause = 1,
    output wire F16x,
    output reg [7:0]PAR = 0,
    output reg ready = 0
    );

    reg [3:0]bit_cn = 0;
    reg [3:0]Tbit_cn = 0;
    
    reg [6:0]SHR = 0;

    reg [3:0]T_F16x_cn = 0;
    assign F16x = &T_F16x_cn;

    always @(posedge clk)
    begin
        T_F16x_cn <= T_F16x_cn + 1;
    end 

    always @(posedge clk)
    begin
        Tbit_cn <= (pause & RXD) ? 0 : F16x ? Tbit_cn + 1 : Tbit_cn;
        bit_cn <= pause ? 0 : (F16x & (Tbit_cn == 4'hF)) ? bit_cn + 1 : bit_cn;
        pause <= (bit_cn == 4'd9) ? 1 : ((Tbit_cn == 4'd7) & pause) ? 0 : pause;
        SHR <= ((Tbit_cn == 4'd12) & F16x) ? {RXD, SHR[6:1]} : SHR;
        PAR <= ((bit_cn == 4'd8) & (Tbit_cn == 4'd12) & F16x) ? {RXD, SHR[6:0]} : PAR;
        ready <= ((bit_cn == 4'd8) & (Tbit_cn == 4'd12) & F16x) ? 1 : ready ? 0 : ready;
    end 


endmodule
