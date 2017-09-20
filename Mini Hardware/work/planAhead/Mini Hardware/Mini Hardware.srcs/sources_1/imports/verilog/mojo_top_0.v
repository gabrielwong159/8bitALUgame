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
    input a,
    input b,
    input c,
    input out1,
    input out2
  );
  
  
  
  reg rst;
  
  wire [1-1:0] M_reset_cond_out;
  reg [1-1:0] M_reset_cond_in;
  reset_conditioner_1 reset_cond (
    .clk(clk),
    .in(M_reset_cond_in),
    .out(M_reset_cond_out)
  );
  wire [1-1:0] M_evaluater_fpgasum;
  wire [1-1:0] M_evaluater_fpgacarry;
  reg [1-1:0] M_evaluater_a;
  reg [1-1:0] M_evaluater_b;
  reg [1-1:0] M_evaluater_c;
  evaluation_2 evaluater (
    .clk(clk),
    .rst(rst),
    .a(M_evaluater_a),
    .b(M_evaluater_b),
    .c(M_evaluater_c),
    .fpgasum(M_evaluater_fpgasum),
    .fpgacarry(M_evaluater_fpgacarry)
  );
  
  always @* begin
    M_evaluater_a = a;
    M_evaluater_b = b;
    M_evaluater_c = c;
    M_reset_cond_in = ~rst_n;
    rst = M_reset_cond_out;
    led[0+0-:1] = a;
    led[1+0-:1] = b;
    led[2+0-:1] = c;
    led[3+0-:1] = out1;
    led[4+0-:1] = out2;
    led[5+0-:1] = M_evaluater_fpgasum;
    led[6+0-:1] = M_evaluater_fpgacarry;
    led[7+0-:1] = (M_evaluater_fpgasum == out1) & (M_evaluater_fpgacarry == out2);
    spi_miso = 1'bz;
    spi_channel = 4'bzzzz;
    avr_rx = 1'bz;
  end
endmodule