4-3 Verilog Instantiation Template
===

## Purpose

學習直接透過 Verilog 語法呼叫 Block BRAM

## Project flow

Lab 3-3 的範例較為簡單，主要會著重在 Verilog Template 的講解。

只需將 `src/top.v`、`src/shift.v`、`xdc/pynq-z2_v1.0.xdc` 加入 Project，並直接產生 Bitstream 燒錄做觀察即可。

## Verilog Template

主要分成兩個部分 : **Available Attributes** 、 **Port Descriptions**

- Available Attributes : 可設定 Block RAM 的操作模式、初始值、資料寬度等等參數。

- Port Descriptions : 定義 Block RAM 的 I/O Ports。

#### Code Architecture

```v
RAMB36E1 #(
  Available Attributes
)
RAMB36E1_inst (
  Port Descriptions
);
```

## Reference

[Vivado Design Suite 7 Series FPGA and Zynq-7000 SoC Libraries Guide](https://www.xilinx.com/support/documentation/sw_manuals/xilinx2020_2/ug953-vivado-7series-libraries.pdf)

> Page 551
