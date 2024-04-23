module sram_cntrlr (
	input               clk                       , // Clock
	input               rst_n                     , // Asynchronous reset active low
	///avalon-mm
	input        [18:0] avalon_slave_address      ,
	input               avalon_slave_read         ,
	output logic [31:0] avalon_slave_readdata     ,
	output logic        avalon_slave_readdatavalid,
	input               avalon_slave_write        ,
	input        [31:0] avalon_slave_writedata    ,
	output logic        avalon_slave_waitrequest  ,
	input        [ 3:0] avalon_slave_byteenable   ,
	/// conduit
	inout        [15:0] dq                        ,
	output logic [20:0] addr                      ,
	output logic        sram_cen                  ,
	output logic        sram_oen                  ,
	output logic        sram_wen                  ,
	output logic        sram_bwan                 ,
	output logic        sram_bwbn
);


enum logic [6:0] {
	STATE_IDLE,
	STATE_CEN_R,
	STATE_CEN_W,
	STATE_OEN,
	STATE_READ_LATCH,
	STATE_WEN,
	STATE_WRITE_LATCH
}state;

logic msb;
logic data_out_en;
logic [1:0][15:0] data_out;
logic [15:0] data_in;
logic [1:0][1:0] be_out;
assign dq = data_out_en ? data_out[msb] : 'z;

always_ff @(posedge clk or negedge rst_n) begin
	if(~rst_n) begin
		state <= STATE_IDLE;
		sram_cen <= '1;		
		data_out_en <= 1'b0;
		avalon_slave_readdatavalid <= 1'b0;
		avalon_slave_waitrequest <= 1'b1;
	end else begin
		sram_cen <= 1'b1;
		sram_oen <= 1'b1;
		sram_wen <= 1'b1;
		sram_bwan <= 1'b0;
		sram_bwbn <= 1'b0;

		data_out_en <= 1'b0;	
		avalon_slave_readdatavalid <= 1'b0;

		case (state)
			STATE_IDLE:begin
				msb <= 1'b0;
				avalon_slave_waitrequest <= 1'b0;

				if( ( avalon_slave_read || avalon_slave_write ) )begin
					avalon_slave_waitrequest <= 1'b1;
					// addr_out <= avalon_slave_address;
					data_out <= avalon_slave_writedata;
					sram_cen <= 1'b0;
					addr <= {avalon_slave_address,2'd0};
					be_out <= avalon_slave_byteenable;
				end

				if(avalon_slave_read)
					state <= STATE_CEN_R;

				if(avalon_slave_write)
					state <= STATE_CEN_W;
			end
			


			STATE_CEN_R:begin
				sram_cen <= 1'b0;
				sram_oen <= 1'b0;
				state <= STATE_OEN;
			end				
			STATE_OEN:begin
				sram_cen <= 1'b0;
				sram_oen <= 1'b0;
				state <= STATE_READ_LATCH;
			end
			STATE_READ_LATCH:begin
				data_in <= dq;
				msb <= 1'b1;
				if(msb)begin
					state <= STATE_IDLE;
					avalon_slave_waitrequest <= 1'b0;
					avalon_slave_readdatavalid <= 1'b1;
					avalon_slave_readdata <= {dq,data_in};
				end
				else begin
					sram_cen <= 1'b0;
					addr <= addr + 'd2;
					state <= STATE_CEN_R;
				end

			end






			STATE_CEN_W:begin
				sram_cen <= 1'b0;				
				state <= STATE_WEN;
			end
			STATE_WEN:begin
				sram_cen <= 1'b0;
				sram_wen <= 1'b0;
				{sram_bwbn,sram_bwan} <= ~be_out[msb];
				data_out_en <= 1'b1;
				state <= STATE_WRITE_LATCH;
			end
			STATE_WRITE_LATCH:begin				
				msb <= 1'b1;
				if(msb)begin
					state <= STATE_IDLE;
					avalon_slave_waitrequest <= 1'b0;
				end
				else begin
					sram_cen <= 1'b0;
					addr <= addr + 'd2;
					state <= STATE_CEN_W;
				end

			end

			default : state <= STATE_IDLE;
			endcase	

	end
end

endmodule : sram_cntrlr