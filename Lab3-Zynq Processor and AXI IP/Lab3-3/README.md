# FPGA Design Lab3-3 - Package a Custom AXI IP

## Introduction to AXI Interface

![](https://i.imgur.com/RTLPaMn.png)


## Step 1. Create a new project

加入本實驗所提供的`.xdc`。

## Step 2. Create new IP

選擇 Create a new AXI4 peripheral，最後選擇 Edit IP。

![](https://i.imgur.com/1NpoBUR.png)

創建完後加入`src/hdl/adder.v`，並修改產生的 HDL code。

>下面這些步驟主要是在連接 AXI Interface Register 和我們建立的 IP 的 I/O。 [AXI 總線簡介](https://www.twblogs.net/a/5b8cb90d2b7177188334d3a7)

![](https://i.imgur.com/bu091vX.png)

![](https://i.imgur.com/hP2Il10.png)

![](https://i.imgur.com/cusGNcu.png)

![](https://i.imgur.com/Zq3eZxY.png)

![](https://i.imgur.com/Xn2ZL1f.png)

HDL code 修改完後，回到 package IP 畫面將沒有打勾的部分點進去修改，最後 Package IP。

![](https://i.imgur.com/UZP4vf9.png)

回到 create new IP 前的 project，refresh 加入的 IP。

![](https://i.imgur.com/9axgBho.png)

本次實驗的 Block design。

![](https://i.imgur.com/SeFJStm.png)

Block design設計完後，到 Address Editor 中設定 AXI 之 base address。(右鍵 -> assign，預設為0X43C0_0000)

![](https://i.imgur.com/g5wrdli.png)

## Step 3. Write user IP driver and software program
Create HDL Wrapper 且產生 Bitstream 後，Export Hardware 並開啟 Vitis，建立 Project 加入檔案 `src/software/main.c`

將 `src/driver/` 內的程式複製到下圖紅色部分。

![](https://i.imgur.com/qeyksP3.png)

並修改 platform 中的三個 makefile:
1. Platform/hw/drivers/<CustomIP_name>/src/Makefile
2. Platform/ps7_cortex_a9_0/standalone_domain/bsp/ps7_cortex_a9_0/libsrc/<CustomIP_name>/src/Makefile
3. Platform/zynq_fsbl/zynq_fsbl_bsp/ps7_cortex_a9_0/libsrc/<CustomIP_name>/src/Makefile

將makefile中的 `OUTS = *.o` 修改為 `OUTS=$(addsuffix .o, $(basename $(wildcard *.c)))`