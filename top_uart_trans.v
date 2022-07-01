`define number_of_bytes 16
module top_uart_trans (
    input clk,
    input en_shift,
    output wire [39:0]ver_data,
    output reg ver_valid,
    output wire TXD
    );

    reg [`number_of_bytes*8 - 1:0]data = 0;

    reg [16:0]delay_cn = 0;

    wire st = &delay_cn & EoBit;
    wire prev_st = delay_cn[16] & ~(|(delay_cn[15:0])) & EoBit; //(delay_cn == 10'b1000000000)
    reg t_prev_st = 0;
    
    wire [3:0]T_bit;
    wire EoBit;

    wire [9:0]par;
    wire [9:0]saw;

    Gen_parabola_trans Gen_parabola_trans (.clk(clk), .ce(prev_st), .par(par));
    Gen_saw Gen_saw (.clk(clk), .ce(prev_st), .saw(saw));
    uart_trans uart_trans (.clk(clk), .st(st), .EoBit(EoBit), .TXD(TXD), .data(data));

    always @(posedge clk)
    begin
        delay_cn <= EoBit ? delay_cn + 1 : delay_cn;

        t_prev_st <= prev_st;
        data[15:6] <= t_prev_st ? par : data[15:6];
        data[31:22] <= t_prev_st ? 10'd256 : data[31:22];
        data[47:38] <= t_prev_st ? -256 : data[47:38];
        data[63:54] <= t_prev_st ? saw : data[63:54];
		data[5:0] <= 0;
		data[21:16] <= 0;
		data[37:32] <= 0;
		data[53:48] <= 0;
		data[127:64] <= 0;

        ver_valid <= st ? 1 : en_shift ? 0 : ver_valid;
		  
    end

    assign ver_data = {data[63:54], data[47:38], data[31:22], data[15:6]};
    

endmodule

