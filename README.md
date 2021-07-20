# 74LS191
基于FPGA实现的74LS191（同步16进制加/减计数器）

## 引言

本仓库存放的是我们数字电路实验的第三次课程设计，设计一个计数器，实现74LS191的全部功能。

由于源项目超过100MB，无法上传至GitHub，故仓库仅存放了最核心的三个文件：`HexCounter.v` （源代码）、`HexCounter_sim.v`（仿真代码）、`HexCounter_cons.xdc`（约束文件）。

## 实验环境

+ 开发板型号：[Nexys 4 DDR](https://reference.digilentinc.com/programmable-logic/nexys-4-ddr/start?redirect=1)

+ 芯片型号：`xc7a100tcsg324-1`

+ 集成设计环境：[Vivado 2019.1](https://www.xilinx.com/support/download/index.html/content/xilinx/en/downloadNav/vivado-design-tools/archive.html)
  
    > 软件参考教程：[Vivado如何获取License](https://blog.csdn.net/pengwangguo/article/details/75502866)

## 实验内容

1. 设计一个计数器，实现74LS191的全部功能。

2. 把设计的计数器封装成一个IP核，请参考[视频教程](https://www.bilibili.com/video/BV1Nt4y197jB)

## 实验原理

### 输入变量

+ 变量 ld、s、ud ， 均为一位的二进制信号
+ 变量 clk ，代表时钟信号，为更好地操作实验结果，此处的时钟信号与按键进行绑定
+ 变量 x ，是宽度为 4 位的二进制置数代码


### 输出变量

+ 变量 y ，是一位的二进制输出信号，表示进位输出
+ 变量 cnt ，是宽度为 4 位的二进制代码，表示当前计数状态


### 功能分析

功能表参考于《数字电路技术基础》（第6版）表 6.3.5 ：

<img src="https://cdn.joydee.cloud//20210721023053.png"/>

+ 当 s 与 ld 同时为高电平时，无论时钟信号 clk 如何，电路处于保持状态；

+ 当 ld 为低电平时，无论时钟信号 clk 如何、s 状态如何，电路处于置数状态，将此时 x 的二进制信号置入当前的计数状态；

+ 当 s 为低电平、 ld 为高电平，且 clk 处于上升沿时，若 ud 为低电平，电路处于加法计数状态；

+ 当 s 为低电平、 ld 为高电平，且 clk 处于上升沿时，若 ud 为高电平，电路处于减法计数状态；

