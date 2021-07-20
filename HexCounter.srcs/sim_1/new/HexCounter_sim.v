`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CSUST
// Engineer: Joy Dee
// 
// Create Date: 2021/06/07 23:20:34
// Design Name: 74LS191计数器
// Module Name: HexCounter_sim
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module HexCounter_sim();
    reg s, ld, ud, clk;
    reg[3:0] x;
    wire[3:0] cnt;
    wire y;
    HexCounter test(
        .s(s), 
        .ld(ld),
        .ud(ud),
        .clk(clk),
        .x(x),
        .cnt(cnt),
        .y(y)
    );
    initial
    begin
        clk = 0;
        s = 0; 
        ld = 1;
        ud = 0;
        x = 4'b0000;
        //#100;
    end
    always #20 clk = ~clk;
    
endmodule
