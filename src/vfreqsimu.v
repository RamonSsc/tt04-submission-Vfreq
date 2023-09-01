`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////


module vfreqsimu();

    reg clk, rst;
    reg [7:0] cnt;
    wire [7:0] uo_out;
    wire [7:0] uio_in;
    wire [7:0] uio_oe,uio_out;

    
    tt_um_RS_Vfreq vfreq (
        .clk(clk),
        .ui_in(cnt),
        .rst_n(rst),
        .uo_out(uo_out),
        .uio_in(uio_in),
        .uio_out(uio_out),
        .uio_oe(uio_oe),
        .ena(1'd1)
    );

    always begin
        #5 
        clk = ~clk;
    end
    
    initial begin
        clk = 1'b0;
        rst = 1'b1;
        #1
        cnt = 8'd3;
        #500
        cnt = 8'd10;
        #1000;
        cnt = 8'd32;
    end
endmodule
