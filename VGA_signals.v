module VGA_signals (
    input pixel_clk,
    input valid_data,
    output reg delay_VGA_SYNC_N = 0,
    output reg delay_VGA_BLANK_N = 0,
    output reg delay_HSYNC = 0,
    output reg delay_VSYNC = 0,
    output reg [11:0]counterPclkH = 0,
    output reg [9:0]counterLines = 0,
    output wire EoFrame,
    output wire EOL,
    output wire VGA_BLANK_N,
    output reg V_BLANK_N = 1
    //output wire [7:0]RED,
    //output wire [7:0]GREEN,
    //output wire [7:0]BLUE
    );

    //reg [11:0]counterPclkH = 0;
    //reg [9:0]counterLines = 0;

    reg [3:0]control_sign1= 0;
    reg [3:0]control_sign2 = 0;
    reg [3:0]control_sign3 = 0;
    reg [3:0]control_sign4 = 0;
    reg [3:0]control_sign = 0;

    reg H_BLANK_N = 1;

    wire VGA_SYNC_N = 1;
    reg HSYNC = 1;
    reg VSYNC = 1;

    assign VGA_SYNC_N = 1;

    assign VGA_BLANK_N = H_BLANK_N & V_BLANK_N;

        //assign RED = {8{(VGA_BLANK_N & (counterLines == 0 | counterLines == 767 | counterPclkH == 0 | counterPclkH == 1023))}};
   //assign GREEN = {8{(VGA_BLANK_N & (counterLines == 0 | counterLines == 767 | counterPclkH == 0 | counterPclkH == 1023))}};
    //assign BLUE = {8{(VGA_BLANK_N & (counterLines == 0 | counterLines == 767 | counterPclkH == 0 | counterPclkH == 1023))}};

    assign EOL = (counterPclkH == 11'd1311);

    always @(posedge pixel_clk)
    begin
        if (counterLines < 10'd800)
        begin
            counterPclkH <= EOL ? 0 : counterPclkH + 1;
        end
        counterLines <= ((counterLines == 10'd799) & EOL) ? 0 : EOL ? counterLines + 1 : counterLines;
        


        control_sign1 <= {VGA_SYNC_N, VGA_BLANK_N, HSYNC, VSYNC};
        control_sign2 <= control_sign1;
        control_sign3 <= control_sign2;
        control_sign4 <= control_sign3;
        control_sign <= control_sign4;
        delay_VGA_SYNC_N <= control_sign[3];
        delay_VGA_BLANK_N <= control_sign[2];
        delay_HSYNC <= control_sign[1];
        delay_VSYNC <= control_sign[0];

        H_BLANK_N <= EOL ? 1 : (counterPclkH == 10'd1023) ? 0 : H_BLANK_N;
        V_BLANK_N <= EoFrame ? 1 : (EOL & (counterLines == 10'd767)) ? 0 : V_BLANK_N;

        HSYNC <= (counterPclkH == 11'd1135) ? 1 : (counterPclkH == 11'd1039) ? 0 : HSYNC;
        VSYNC <= (EOL & (counterLines == 10'd771)) ? 1 : (EOL & (counterLines == 10'd768)) ? 0 : VSYNC;
    end

    /*assign H_BLANK_N = (counterPclkH < 1024); 
    assign V_BLANK_N = (counterLines < 768);

    assign HSYNC = ~(counterPclkH >= 1040 & counterPclkH < 1136);
    assign VSYNC = ~(counterLines >= 769  & counterLines < 772);*/

    assign EoFrame = EOL & (counterLines == 10'd799);

endmodule

