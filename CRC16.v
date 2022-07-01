module CRC16 (
    input clk,
    input LOAD,
    input [7:0]byte,
    input init,
    output wire check_sum 
    );

    reg [15:0]CRC = 16'hFFFF;
    reg sh_bit = 0;
    reg [3:0]sh_cn = 0;  
    reg go = 0;
    wire [15:0]xor_sh = w_xor >> 1;
    wire [15:0]w_xor = (CRC ^ 16'ha001);
    assign check_sum = (CRC == 16'h0000);

    always @(posedge clk)
    begin
        if (LOAD)
        begin
            CRC <= {CRC[15:8], CRC[7:0] ^ byte};
            sh_bit <= 0;
            go <= 1;
        end

        else
        begin
            if (go)
            begin
                sh_bit <= (~sh_cn[0]) ? CRC[0] : sh_bit;
                sh_cn <= sh_cn + 1;
                CRC <= (~sh_cn[0]) ? {1'b0, CRC[15:1]} : sh_bit ? CRC ^ 16'ha001 : CRC;
                go <= (&sh_cn) ? 0 : go;
            end
            else
            begin
                CRC <= init ? 16'hFFFF : CRC;
            end
        end
    end

endmodule
