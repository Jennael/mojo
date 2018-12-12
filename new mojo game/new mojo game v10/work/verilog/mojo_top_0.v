/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module mojo_top_0 (
    input clk,
    input rst_n,
    output reg [7:0] led,
    input cclk,
    output reg spi_miso,
    input spi_ss,
    input spi_mosi,
    input spi_sck,
    output reg [3:0] spi_channel,
    input avr_tx,
    output reg avr_rx,
    input avr_rx_busy,
    input [4:0] button,
    output reg red_led,
    output reg [1:0] enter_led,
    output reg [1:0] guess_led,
    output reg [5:0] button_col,
    input [4:0] button_row,
    output reg [6:0] seven_seg,
    output reg [5:0] seg_sel,
    output reg gnd,
    output reg pwr
  );
  
  
  
  reg rst;
  
  wire [1-1:0] M_reset_cond_out;
  reg [1-1:0] M_reset_cond_in;
  reset_conditioner_1 reset_cond (
    .clk(clk),
    .in(M_reset_cond_in),
    .out(M_reset_cond_out)
  );
  wire [5-1:0] M_question_read_data;
  reg [5-1:0] M_question_address;
  reg [5-1:0] M_question_write_data;
  reg [1-1:0] M_question_write_en;
  simple_ram_2 #(.SIZE(3'h5), .DEPTH(6'h20)) question (
    .clk(clk),
    .address(M_question_address),
    .write_data(M_question_write_data),
    .write_en(M_question_write_en),
    .read_data(M_question_read_data)
  );
  wire [5-1:0] M_answer_read_data;
  reg [5-1:0] M_answer_address;
  reg [5-1:0] M_answer_write_data;
  reg [1-1:0] M_answer_write_en;
  simple_ram_2 #(.SIZE(3'h5), .DEPTH(6'h20)) answer (
    .clk(clk),
    .address(M_answer_address),
    .write_data(M_answer_write_data),
    .write_en(M_answer_write_en),
    .read_data(M_answer_read_data)
  );
  reg [4:0] M_entry_count_d, M_entry_count_q = 1'h0;
  reg [0:0] M_occupied_d, M_occupied_q = 1'h0;
  reg [24:0] M_delay_d, M_delay_q = 1'h0;
  reg [7:0] M_score1_d, M_score1_q = 1'h0;
  reg [7:0] M_score2_d, M_score2_q = 1'h0;
  reg M_user_d, M_user_q = 1'h0;
  reg [3:0] M_speed_d, M_speed_q = 1'h1;
  reg [3:0] M_length_d, M_length_q = 1'h1;
  reg [3:0] M_count_d, M_count_q = 1'h0;
  wire [2-1:0] M_settings_newspeed;
  wire [26-1:0] M_settings_increment;
  reg [2-1:0] M_settings_speed;
  settings_4 settings (
    .clk(clk),
    .speed(M_settings_speed),
    .newspeed(M_settings_newspeed),
    .increment(M_settings_increment)
  );
  wire [1-1:0] M_s_edgeup_out;
  reg [1-1:0] M_s_edgeup_in;
  edge_detector_5 s_edgeup (
    .clk(clk),
    .in(M_s_edgeup_in),
    .out(M_s_edgeup_out)
  );
  wire [1-1:0] M_spd_btn_up_out;
  reg [1-1:0] M_spd_btn_up_in;
  button_conditioner_6 spd_btn_up (
    .clk(clk),
    .in(M_spd_btn_up_in),
    .out(M_spd_btn_up_out)
  );
  wire [1-1:0] M_s_edgedown_out;
  reg [1-1:0] M_s_edgedown_in;
  edge_detector_5 s_edgedown (
    .clk(clk),
    .in(M_s_edgedown_in),
    .out(M_s_edgedown_out)
  );
  wire [1-1:0] M_spd_btn_down_out;
  reg [1-1:0] M_spd_btn_down_in;
  button_conditioner_6 spd_btn_down (
    .clk(clk),
    .in(M_spd_btn_down_in),
    .out(M_spd_btn_down_out)
  );
  wire [1-1:0] M_l_edgeup_out;
  reg [1-1:0] M_l_edgeup_in;
  edge_detector_5 l_edgeup (
    .clk(clk),
    .in(M_l_edgeup_in),
    .out(M_l_edgeup_out)
  );
  wire [1-1:0] M_lth_btn_up_out;
  reg [1-1:0] M_lth_btn_up_in;
  button_conditioner_6 lth_btn_up (
    .clk(clk),
    .in(M_lth_btn_up_in),
    .out(M_lth_btn_up_out)
  );
  wire [1-1:0] M_l_edgedown_out;
  reg [1-1:0] M_l_edgedown_in;
  edge_detector_5 l_edgedown (
    .clk(clk),
    .in(M_l_edgedown_in),
    .out(M_l_edgedown_out)
  );
  wire [1-1:0] M_lth_btn_down_out;
  reg [1-1:0] M_lth_btn_down_in;
  button_conditioner_6 lth_btn_down (
    .clk(clk),
    .in(M_lth_btn_down_in),
    .out(M_lth_btn_down_out)
  );
  wire [1-1:0] M_start_edge_out;
  reg [1-1:0] M_start_edge_in;
  edge_detector_5 start_edge (
    .clk(clk),
    .in(M_start_edge_in),
    .out(M_start_edge_out)
  );
  wire [1-1:0] M_start_btn_out;
  reg [1-1:0] M_start_btn_in;
  button_conditioner_6 start_btn (
    .clk(clk),
    .in(M_start_btn_in),
    .out(M_start_btn_out)
  );
  localparam IDLE_game = 3'd0;
  localparam INPUT1_game = 3'd1;
  localparam DISPLAY_game = 3'd2;
  localparam REPEAT_game = 3'd3;
  localparam INPUT2_game = 3'd4;
  localparam CHECK_game = 3'd5;
  localparam SCORE_game = 3'd6;
  
  reg [2:0] M_game_d, M_game_q = IDLE_game;
  wire [6-1:0] M_detect_button_col;
  wire [2-1:0] M_detect_guessled;
  wire [5-1:0] M_detect_somechar;
  reg [5-1:0] M_detect_button_row;
  input_capture_15 detect (
    .clk(clk),
    .rst(rst),
    .button_row(M_detect_button_row),
    .button_col(M_detect_button_col),
    .guessled(M_detect_guessled),
    .somechar(M_detect_somechar)
  );
  wire [7-1:0] M_seg_seg;
  wire [6-1:0] M_seg_sel;
  reg [24-1:0] M_seg_values;
  multi_seven_seg_16 seg (
    .clk(clk),
    .rst(rst),
    .values(M_seg_values),
    .seg(M_seg_seg),
    .sel(M_seg_sel)
  );
  wire [1-1:0] M_dm_red_led;
  wire [5-1:0] M_dm_ra;
  wire [4-1:0] M_dm_value;
  reg [5-1:0] M_dm_data;
  reg [1-1:0] M_dm_play;
  reg [26-1:0] M_dm_incr;
  displaymorse_17 dm (
    .clk(clk),
    .rst(rst),
    .data(M_dm_data),
    .play(M_dm_play),
    .incr(M_dm_incr),
    .red_led(M_dm_red_led),
    .ra(M_dm_ra),
    .value(M_dm_value)
  );
  wire [5-1:0] M_check_address;
  wire [2-1:0] M_check_enter_led;
  wire [2-1:0] M_check_guess_led;
  wire [4-1:0] M_check_count;
  wire [4-1:0] M_check_tens;
  wire [4-1:0] M_check_ones;
  reg [5-1:0] M_check_adata;
  reg [5-1:0] M_check_bdata;
  reg [1-1:0] M_check_calc;
  check_18 check (
    .clk(clk),
    .rst(rst),
    .adata(M_check_adata),
    .bdata(M_check_bdata),
    .calc(M_check_calc),
    .address(M_check_address),
    .enter_led(M_check_enter_led),
    .guess_led(M_check_guess_led),
    .count(M_check_count),
    .tens(M_check_tens),
    .ones(M_check_ones)
  );
  
  localparam LENGTH = 2'h2;
  
  always @* begin
    M_game_d = M_game_q;
    M_occupied_d = M_occupied_q;
    M_entry_count_d = M_entry_count_q;
    M_speed_d = M_speed_q;
    M_score2_d = M_score2_q;
    M_length_d = M_length_q;
    M_score1_d = M_score1_q;
    M_delay_d = M_delay_q;
    M_user_d = M_user_q;
    
    M_reset_cond_in = ~rst_n;
    rst = M_reset_cond_out;
    led = 8'h00;
    red_led = 1'h0;
    enter_led = 2'h3;
    guess_led = 2'h3;
    M_seg_values = {M_speed_q, M_score1_q[4+3-:4], M_score1_q[0+3-:4], M_score2_q[4+3-:4], M_score2_q[0+3-:4], M_length_q};
    seven_seg = M_seg_seg;
    seg_sel = ~M_seg_sel;
    spi_miso = 1'bz;
    spi_channel = 4'bzzzz;
    avr_rx = 1'bz;
    gnd = 1'h0;
    pwr = 1'h1;
    M_spd_btn_up_in = button[1+0-:1];
    M_spd_btn_down_in = button[0+0-:1];
    M_lth_btn_up_in = button[3+0-:1];
    M_lth_btn_down_in = button[4+0-:1];
    M_start_btn_in = button[2+0-:1];
    M_s_edgeup_in = M_spd_btn_up_out;
    M_s_edgedown_in = M_spd_btn_down_out;
    M_l_edgeup_in = M_lth_btn_up_out;
    M_l_edgedown_in = M_lth_btn_down_out;
    M_start_edge_in = M_start_btn_out;
    M_question_address = M_entry_count_q;
    M_question_write_data = 8'bxxxxxxxx;
    M_question_write_en = 1'h0;
    M_answer_address = M_entry_count_q;
    M_answer_write_data = 8'bxxxxxxxx;
    M_answer_write_en = 1'h0;
    button_col = M_detect_button_col;
    M_detect_button_row = button_row;
    M_dm_data = M_question_read_data;
    M_dm_incr = M_settings_increment;
    M_dm_play = 1'h0;
    red_led = M_dm_red_led;
    M_settings_speed = 2'h0;
    M_check_adata = 5'h00;
    M_check_bdata = 5'h00;
    M_check_calc = 1'h0;
    
    case (M_game_q)
      IDLE_game: begin
        enter_led = 1'h0;
        M_score1_d = 1'h0;
        M_score2_d = 1'h0;
        M_user_d = 1'h0;
        if (M_s_edgeup_out == 1'h1 && M_speed_q < 3'h6) begin
          M_speed_d = M_speed_q + 1'h1;
          M_settings_speed = 2'h2;
        end
        if (M_s_edgedown_out && M_speed_q > 1'h1) begin
          M_speed_d = M_speed_q - 1'h1;
          M_settings_speed = 2'h1;
        end
        if (M_l_edgeup_out == 1'h1 && M_length_q < 4'hf) begin
          M_length_d = M_length_q + 1'h1;
        end
        if (M_l_edgedown_out && M_length_q > 1'h1) begin
          M_length_d = M_length_q - 1'h1;
        end
        if (M_start_edge_out == 1'h1) begin
          M_entry_count_d = 1'h0;
          M_occupied_d = 1'h0;
          M_game_d = INPUT1_game;
        end
      end
      INPUT1_game: begin
        if (M_user_q == 1'h0) begin
          enter_led[0+0-:1] = 1'h0;
        end else begin
          enter_led[1+0-:1] = 1'h0;
        end
        if (M_detect_somechar != 5'h1f && M_occupied_q == 1'h0) begin
          M_question_write_data = M_detect_somechar;
          M_question_write_en = 1'h1;
          M_occupied_d = 1'h1;
        end
        if (M_detect_somechar == 5'h1f && M_occupied_q == 1'h1) begin
          M_delay_d = M_delay_q + 1'h1;
          if (M_delay_q[18+0-:1] == 1'h1) begin
            M_entry_count_d = M_entry_count_q + 1'h1;
            M_occupied_d = 1'h0;
            M_delay_d = 1'h0;
          end
        end
        if (M_start_edge_out == 1'h1) begin
          M_question_write_en = 1'h0;
          M_entry_count_d = 1'h0;
          M_game_d = DISPLAY_game;
        end
      end
      DISPLAY_game: begin
        if (M_dm_ra < M_length_q) begin
          M_dm_play = 1'h1;
          M_question_address = M_dm_ra;
          M_dm_data = M_question_read_data;
        end else begin
          M_dm_play = 1'h0;
          M_game_d = REPEAT_game;
        end
      end
      REPEAT_game: begin
        if (M_start_edge_out == 1'h1) begin
          M_entry_count_d = 1'h0;
          M_occupied_d = 1'h0;
          M_game_d = INPUT2_game;
        end
        if (M_s_edgeup_out == 1'h1 || M_s_edgedown_out == 1'h1 || M_l_edgeup_out == 1'h1 || M_l_edgedown_out == 1'h1) begin
          M_game_d = DISPLAY_game;
        end
      end
      INPUT2_game: begin
        if (M_user_q == 1'h0) begin
          guess_led[1+0-:1] = 1'h0;
        end else begin
          guess_led[0+0-:1] = 1'h0;
        end
        if (M_detect_somechar != 5'h1f && M_occupied_q == 1'h0) begin
          M_answer_write_data = M_detect_somechar;
          M_answer_write_en = 1'h1;
          M_occupied_d = 1'h1;
        end
        if (M_detect_somechar == 5'h1f && M_occupied_q == 1'h1) begin
          M_delay_d = M_delay_q + 1'h1;
          if (M_delay_q[18+0-:1] == 1'h1) begin
            M_entry_count_d = M_entry_count_q + 1'h1;
            M_occupied_d = 1'h0;
            M_delay_d = 1'h0;
          end
        end
        if (M_start_edge_out == 1'h1) begin
          M_entry_count_d = 1'h0;
          M_occupied_d = 1'h0;
          M_check_calc = 1'h1;
          M_game_d = CHECK_game;
        end
      end
      CHECK_game: begin
        guess_led[0+0-:1] = 1'h1;
        M_check_calc = 1'h1;
        M_question_write_en = 1'h0;
        M_answer_write_en = 1'h0;
        M_question_address = M_check_address;
        M_answer_address = M_check_address;
        M_check_adata = M_question_read_data;
        M_check_bdata = M_answer_read_data;
        M_seg_values[16+3-:4] = M_check_tens;
        M_seg_values[12+3-:4] = M_check_ones;
        M_seg_values[8+3-:4] = M_check_address;
        M_seg_values[4+3-:4] = M_check_count;
        if (M_check_address >= M_length_q) begin
          M_check_calc = 1'h0;
          if (M_user_q == 1'h0) begin
            M_score1_d[4+3-:4] = M_score1_q[4+3-:4] + M_check_tens;
            M_score1_d[0+3-:4] = M_score1_q[0+3-:4] + M_check_ones;
          end else begin
            M_score2_d[4+3-:4] = M_score2_q[4+3-:4] + M_check_tens;
            M_score2_d[0+3-:4] = M_score2_q[0+3-:4] + M_check_ones;
          end
          M_game_d = SCORE_game;
        end
      end
      SCORE_game: begin
        guess_led = 1'h0;
        if (M_start_edge_out == 1'h1) begin
          if (M_user_q == 1'h0) begin
            M_user_d = 1'h1;
            M_game_d = INPUT1_game;
          end else begin
            M_game_d = IDLE_game;
          end
        end
      end
    endcase
  end
  
  always @(posedge clk) begin
    M_entry_count_q <= M_entry_count_d;
    M_occupied_q <= M_occupied_d;
    M_delay_q <= M_delay_d;
    M_score1_q <= M_score1_d;
    M_score2_q <= M_score2_d;
    M_user_q <= M_user_d;
    M_speed_q <= M_speed_d;
    M_length_q <= M_length_d;
    M_count_q <= M_count_d;
    
    if (rst == 1'b1) begin
      M_game_q <= 1'h0;
    end else begin
      M_game_q <= M_game_d;
    end
  end
  
endmodule
