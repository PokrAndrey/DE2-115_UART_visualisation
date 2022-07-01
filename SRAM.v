module SRAM (
    input pixel_clk,
    input [15:0]data_out,
    input [11:0]counterPclkH,
    input [9:0]counterLines,
    input clr,
    input stop,
    input S,
    input [9:0]par,
    input valid_data,
    input [9:0]param1,
    input [9:0]param2,
    input [9:0]param3,
    input [9:0]param4,
    output wire parity_counterPclkH,
    output wire en_shift,
    output reg ce_addr = 1,
    output reg column_clr = 0,
    output reg [15:0]DWr = 0,
    output reg [7:0]RED = 0,
    output reg [7:0]GREEN = 0,
    output reg [7:0]BLUE = 0,
    output reg [9:0]shift_counter = 1,
    output reg [19:0]address = 0

    );

    reg [15:0]DRd = 0;
    reg [9:0]datumPix = 0;
    reg [19:0]wr_addr = 0;

    
    assign en_shift = ((counterPclkH == 11'd1310) & shift_counter[0] | (counterPclkH == 11'd1311) & ~shift_counter[0]) & (counterLines == 10'd799) & ~ce_addr;

    reg [9:0]strings_counter = 0;
   
    wire [9:0]ver_addr = address[18:9];

    wire S_column_clr = (((counterPclkH == 11'd1309) & shift_counter[0] | (counterPclkH == 11'd1310) & ~shift_counter[0]) & (counterLines == 10'd767));

    assign parity_counterPclkH = ~(shift_counter[0] ^ counterPclkH[0]);

    always @(posedge pixel_clk)
    begin
        //address <= (~counterPclkH[0] & (~clr & op)) ? {1'b0, counterLines, counterPclkH[9:1] + shift_counter} : (~counterPclkH[0] & clr) ? wr_addr : (~op & presence_new_data) ? {1'b0, wr_addr[18:0]} : address; //demonstration of shifting;


        address <= (clr) ? wr_addr :
                   (en_shift) ? {11'b0, shift_counter[9:1]} :                                    
                   (ce_addr & parity_counterPclkH) ? {1'b0, counterLines, counterPclkH[9:1] + shift_counter[9:1]} :                   
                   (parity_counterPclkH & ~column_clr) ? {1'b0, 10'd384 + datumPix, shift_counter[9:1]} :
                   (parity_counterPclkH &  column_clr) ? {1'b0, wr_addr[9:0], shift_counter[9:1]} : address;

        wr_addr <= (((wr_addr == {1'b0, 10'd767, 9'h1FF}) & clr | ~clr & ce_addr) & parity_counterPclkH) ? 0 : (parity_counterPclkH & (clr | column_clr)) ? wr_addr + 1 : wr_addr;

        DRd <= (parity_counterPclkH) ? data_out : { {8{1'b1}}, DRd[15:8] };
        RED <= {DRd[7:5], {5{1'b1}} };  
        GREEN <= {DRd[4:2], {5{1'b1}} };
        BLUE <= {DRd[1:0], {6{1'b1}} };

        ce_addr <= (en_shift) ? 1 : 
                   (((counterPclkH == 11'd1309) & shift_counter[0] | (counterPclkH == 11'd1310) & ~shift_counter[0]) & (counterLines == 10'd767)) ? 0 : ce_addr;

        column_clr <= S_column_clr ? 1 :
                      (((counterPclkH == 8'd221)  & shift_counter[0] | (counterPclkH == 8'd222)  & ~shift_counter[0]) & (counterLines == 10'd769)) ? 0 : column_clr;

        //DWr <= {wr_addr[7:0], wr_addr[7:0]}; //demonstration of shifting;
        if (parity_counterPclkH)
        begin
            DWr <= (column_clr) ? 16'h0000 : 
                   ((counterPclkH == 8'd226 + shift_counter[0]) & (counterLines == 10'd769)) ? 16'hFFFF : 
                   ((counterPclkH == 8'd228 + shift_counter[0]) & (counterLines == 10'd769)) ? 16'h8888 :     
                   ((counterPclkH == 8'd230 + shift_counter[0]) & (counterLines == 10'd769)) ? 16'h5555 : 16'ha2a2;
        end

        if ((counterLines == 10'd769) & parity_counterPclkH)
        begin
            datumPix <= (counterPclkH == 8'd224 + shift_counter[0]) ? param1 :
                        (counterPclkH == 8'd226 + shift_counter[0]) ? param2 :
                        (counterPclkH == 8'd228 + shift_counter[0]) ? param3 : param4;
        end 

        shift_counter <= (en_shift & ~stop & valid_data) ? shift_counter + 1 : shift_counter;
    end


endmodule
