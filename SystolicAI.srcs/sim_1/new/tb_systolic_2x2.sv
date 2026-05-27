`timescale 1ns / 1ps

module tb_systolic_2x2;

logic clk;
logic rst;
logic en;

logic valid_in;

logic signed [7:0] data0;
logic signed [7:0] data1;

logic signed [7:0] weight0;
logic signed [7:0] weight1;

logic signed [31:0] acc00;
logic signed [31:0] acc01;
logic signed [31:0] acc10;
logic signed [31:0] acc11;

systolic_2x2 dut(

    .clk(clk),
    .rst(rst),
    .en(en),

    .valid_in(valid_in),

    .data0_in(data0),
    .data1_in(data1),

    .weight0_in(weight0),
    .weight1_in(weight1),

    .acc00(acc00),
    .acc01(acc01),
    .acc10(acc10),
    .acc11(acc11)

);

always #5 clk = ~clk;

initial begin

    clk = 0;

    rst = 1;
    en  = 0;

    valid_in = 0;

    data0 = 0;
    data1 = 0;

    weight0 = 0;
    weight1 = 0;

    #10;

    rst = 0;
    en  = 1;

    valid_in = 1;

    data0 = 5;
    data1 = 10;

    weight0 = 6;
    weight1 = 8;

    #10;

    valid_in = 0;

    #40;

    $finish;

end

endmodule