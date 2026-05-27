`timescale 1ns / 1ps

module pe(

    input logic clk,
    input logic rst,
    input logic en,

    input logic valid_in,

    input logic signed [7:0] data_in,
    input logic signed [7:0] weight_in,

    output logic signed [7:0] data_out,
    output logic signed [7:0] weight_out,

    output logic valid_right_out,
    output logic valid_down_out,

    output logic signed [31:0] acc_out

);
    mac inst_mac(
        .clk(clk),
        .rst(rst),
        .en(en),
        .valid_in(valid_in),
        .a(data_in),
        .b(weight_in),
        .acc(acc_out)
    );
    always_ff @(posedge clk)
    begin

        if (rst)
        begin
            data_out <= 0;
            weight_out <= 0;
            valid_right_out <= 0;
            valid_down_out  <= 0;
        end
        else if (en)
        begin
            data_out <= data_in;
            weight_out <= weight_in;
            valid_right_out <= valid_in;
            valid_down_out  <= valid_in;
        end
    end
endmodule