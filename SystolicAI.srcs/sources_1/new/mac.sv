`timescale 1ns / 1ps

module mac(

    input logic clk,
    input logic rst,
    input logic en,
    input logic valid_in,
    output logic valid_out,
    input logic signed [7:0] a,
    input logic signed [7:0] b,
    output logic signed [31:0] acc

);
always_ff @(posedge clk)
begin
    if (rst)
    begin
        acc <= 0;
        valid_out <= 0;
    end
    else if (en)
    begin
        valid_out <= valid_in;
        if (valid_in)
        begin
            acc <= acc + (a * b);
        end
    end
end

endmodule