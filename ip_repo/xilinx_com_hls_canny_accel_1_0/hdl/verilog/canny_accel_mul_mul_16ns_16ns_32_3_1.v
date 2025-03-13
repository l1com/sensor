
`timescale 1 ns / 1 ps

  module canny_accel_mul_mul_16ns_16ns_32_3_1_DSP48_0(clk, rst, ce, a, b, p);
input clk;
input rst;
input ce;
input [16 - 1 : 0] a;
input [16 - 1 : 0] b;
output [32 - 1 : 0] p;

reg [32 - 1 : 0] p_reg; 

reg [16 - 1 : 0] a_reg; 
reg [16 - 1 : 0] b_reg; 

always @ (posedge clk) begin
    if (ce) begin
        a_reg <= a;
        b_reg <= b;
        p_reg <= $unsigned (a_reg) * $unsigned (b_reg);
    end
end

assign p = p_reg;

endmodule
`timescale 1 ns / 1 ps
module canny_accel_mul_mul_16ns_16ns_32_3_1(
    clk,
    reset,
    ce,
    din0,
    din1,
    dout);

parameter ID = 32'd1;
parameter NUM_STAGE = 32'd1;
parameter din0_WIDTH = 32'd1;
parameter din1_WIDTH = 32'd1;
parameter dout_WIDTH = 32'd1;
input clk;
input reset;
input ce;
input[din0_WIDTH - 1:0] din0;
input[din1_WIDTH - 1:0] din1;
output[dout_WIDTH - 1:0] dout;



canny_accel_mul_mul_16ns_16ns_32_3_1_DSP48_0 canny_accel_mul_mul_16ns_16ns_32_3_1_DSP48_0_U(
    .clk( clk ),
    .rst( reset ),
    .ce( ce ),
    .a( din0 ),
    .b( din1 ),
    .p( dout ));

endmodule

