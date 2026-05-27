module tb_mac();

 logic clk;
 logic rst;
 logic en;
 logic signed [7:0]a;
 logic signed [7:0]b;
 logic signed [31:0] acc;

mac dut (.clk(clk),.rst(rst),.en(en),.a(a),.b(b),.acc(acc));
always #5 clk=~clk;
initial begin
   clk = 0;
    rst = 1;
    en  = 0;
    a = 0;
    b = 0;
    #10;
    rst = 0;
    en  = 1;
    a = 2;
    b = 3;
    #10;
    en=1;
    a=5;
    b=10;
    #10;
    a=0;
    b=0;

end


endmodule