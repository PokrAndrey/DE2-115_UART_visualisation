`define number_of_bytes 16 
module top_uart_rx (
	input clk,
	input RXD,
    input en_shift,
	output wire [8*`number_of_bytes - 1:0]univ_com_wire,
	output reg valid_data
	);

	parameter [4:0]N = `number_of_bytes ;

	reg [7:0]univ_com[N-1:0];

	function [2:0]log;
		input [3:0]number;
		begin :func_log
			integer i;
			for (i = 1; (1<<i) < number; i = i + 1)
			begin
				log = i;
			end
			log = log + 1;
		end
	endfunction
	
	parameter [2:0]n_wire = 4;//log(`number_of_bytes);

	reg [8:0]Lpause_cn = 0;
	reg Lpause = 1;
	reg t_pause = 0;
	wire Rx_ok;
	wire [N-1:0]ENA;
	reg [n_wire - 1:0]sel_ENA = 0;
	

	wire [7:0]DRX;
	wire pause;
	wire F16x;
	wire ready;
	wire check_sum;

	wire rst_fifo = Lpause & ~check_sum | en_shift;
	wire [7:0]data_out_fifo;

	wire new_packet = ~pause & t_pause & Lpause;
	reg rd_en = 0;
	reg t_rd_en = 0;
    reg tt_rd_en = 0;
    reg ttt_rd_en = 0;
    reg tttt_rd_en = 0;

	wire last_byte = (sel_ENA == (`number_of_bytes-1'd1));
    //wire beg_valid_data = t_rd_en & ~rd_en;
    wire beg_valid_data = tttt_rd_en & ~ttt_rd_en;

    wire full;
    wire empty;
    wire rd_req = rd_en & ~empty;
    wire wr_req = ready & ~full;

	receiver receiver (.clk(clk), .RXD(RXD), .ready(ready), .PAR(DRX), .pause(pause), .F16x(F16x));
	CRC16 CRC16 (.clk(clk), .init(new_packet), .byte(DRX), .LOAD(ready), .check_sum(check_sum));
	fifo_uart fifo_uart(.clock(clk), .data(DRX), .rdreq(rd_req), .sclr(rst_fifo), .wrreq(wr_req), .q(data_out_fifo), .full(full), .empty(empty));
	
	always @(posedge clk)
	begin
		Lpause_cn <= (ready | Lpause) ? 0 : (F16x & pause) ? Lpause_cn + 1 : Lpause_cn;
		Lpause <= ready ? 0 : (&Lpause_cn & F16x) ? 1 : Lpause;
		t_pause <= pause;
		rd_en <= (&Lpause_cn & check_sum & F16x) ? 1 : last_byte ? 0 : rd_en;

        t_rd_en <= rd_en;
        tt_rd_en <= t_rd_en;
        ttt_rd_en <= tt_rd_en;
        tttt_rd_en <= ttt_rd_en;

        valid_data <= beg_valid_data ? 1 : en_shift ? 0 : valid_data;
        sel_ENA <= last_byte ? 0 : rd_en ? sel_ENA + 1 : sel_ENA;
	end

	genvar j;
	generate
		for( j = 0; j < N; j = j+1 )
		begin: commutation
			assign ENA[j] = (sel_ENA == j) ;
			assign univ_com_wire[j*8 + 7: j*8] = univ_com[j];
			always @(posedge clk)
			begin
				univ_com[j] <= (ENA[j]) ? data_out_fifo : univ_com[j];
			end
		end
	endgenerate	
	

endmodule
