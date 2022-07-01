`define number_of_bytes 16
module uart_trans (
    input clk,
    input st,
    output wire EoBit,
    output wire TXD,
    input wire [`number_of_bytes*8 - 1:0]data
    );

    parameter [2:0]log = 4; //log(number_of_bytes)

    wire [7:0]CRC_L;
    wire [7:0]CRC_H;
    reg t_st = 0;
    reg t_next = 0;
    reg Tx_St = 0;
    reg [log:0]SM_Tx = 0;
    wire load = Tx_St & t_next | t_st;
    wire [7:0]byte = (SM_Tx == `number_of_bytes)     ? CRC_L :
                     (SM_Tx == `number_of_bytes + 1) ? CRC_H : data[SM_Tx*8 +: 8];

    wire LOAD_CRC = (load & t_next | t_st) & ~(SM_Tx == `number_of_bytes) & ~(SM_Tx == `number_of_bytes + 1);

    UTx UTx (.clk(clk), .next(next), .start(load), .data_out(TXD), .data_in(byte), .EoBit(EoBit));
    CRC16_trans CRC16_trans (.clk(clk), .init(st), .LOAD(LOAD_CRC), .byte(byte), .CRC_L(CRC_L), .CRC_H(CRC_H));

    always @(posedge clk)
    begin
        Tx_St <= t_st ? 1 : (SM_Tx == `number_of_bytes + 1) ? 0 : Tx_St;
        SM_Tx <= st ? 0 : (next & Tx_St) ? SM_Tx + 1 : SM_Tx;
        t_st <= st;
        t_next <= next;
    end

endmodule 
