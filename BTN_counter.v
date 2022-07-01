module BTN_counter (
    input clk,
    input btn2,
    input btn3,
    output reg [2:0]counter = 0
    );

    always @(posedge clk)
    begin
        counter <= btn3 ? counter + 1 : btn2 ? counter - 1 : counter;
    end

endmodule
