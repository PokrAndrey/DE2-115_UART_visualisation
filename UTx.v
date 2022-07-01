module UTx (
    input clk,
    input [7:0]data_in,
    input start,
    output wire data_out,
    output wire EoBit,
    output wire next
    );

    reg [3:0]T_bit = 0;
    reg [3:0]Bit_cn = 0;
    wire F16x = &F16x_cn;
    reg [3:0]F16x_cn = 0;
    reg [8:0]SHR = 9'h1FF;
    wire load = (start & ~GO);
    reg GO = 0;
    assign EoBit = (&T_bit & F16x);
    assign next = (Bit_cn == 4'd9) & EoBit;
    assign data_out = SHR[0];

    always @(posedge clk)
    begin
        F16x_cn <= start ? 0 : F16x_cn + 1;
        T_bit <= load ? 0 : F16x ? T_bit + 1 : T_bit;
        Bit_cn <= load ? 0 : (EoBit & GO) ? Bit_cn + 1 : Bit_cn;
        SHR <= load ? {data_in, 1'b0} : EoBit ? {1'b1, SHR[8:1]} : SHR;
        GO <= load ? 1 : ((Bit_cn == 4'd9) & (T_bit == 4'd14) & F16x) ? 0 : GO;
    end

endmodule
