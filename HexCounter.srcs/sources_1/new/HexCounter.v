`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CSUST
// Engineer: Joy Dee
// 
// Create Date: 2021/06/07 22:25:37
// Design Name: 74LS191计数器
// Module Name: HexCounter
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

module HexCounter(
    s, ld, ud, clk, x, cnt, y
    );
    input s, ld, ud, clk;
    input[3:0] x;
    output reg[3:0] cnt;
    output reg y;

    initial cnt = 0;
    
    always @(posedge clk or negedge ld or posedge s)
    begin
        
        if(s && ld)
            cnt = cnt; //异步，保持状态
        else if(!ld)
            cnt = x; //异步置数
        else
        
            begin
                if(!ud) //加法计数
                    if(cnt == 4'b1111)
                    begin
                        cnt = 4'b0000; //计数状态置0
                        y = 1; //输出进位信号
                    end
                    
                    else
                    begin
                        y = 0;
                        cnt = cnt + 4'b0001; //加法计数，+1
                    end
                else  //减法计数
                    if(cnt == 4'b0000)
                    begin 
                        cnt = 4'b1111; 
                        y = 1; //输出借位信号
                    end
                    
                    else
                    begin
                        y = 0;
                        cnt = cnt - 4'b0001; //减法计数，-1
                    end
            end
    end

endmodule
