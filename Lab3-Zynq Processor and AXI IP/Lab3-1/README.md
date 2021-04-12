# FPGA Design Lab 3-1 - Zynq Processor
## Purpose
Zynq開發分為兩大部分，分別為PS(Processing System)端跟PL(Programmable Logic)端。
本次使用 PYNQ-Z2 上現有的 Zynq Processor 實作一個簡單的 C/C++ Project。
## Step 1. Download PuTTY
Here's [PuTTY](https://www.putty.org/)
## Step 2. Create a new project
由於本次是使用 FPGA 上固有的 Processor，所以不需加入任何 HDL code 及 Constraints。
## Step 3. Create block design
加入 ZYNQ7 Processing System IP

![](https://i.imgur.com/OCVqG7V.png)

按下 Run Block Automation

![](https://i.imgur.com/oD6ZAz2.png)

執行完畢 ZYNQ processor 會連出兩個 ports。

點開 ZYNQ processor 更改設定。本次實驗只需用到 ZYNQ processor 本身，所以要把沒用到的 I/O 取消。

![](https://i.imgur.com/F8AfFRg.png)

PS-PL Configurations > General > Enable Clock Resets > FCLK_RESET0_N 取消勾選。
PS-PL Configurations > AXI Non Secure Enablement > GP Master AXI Interface > M AXI GP0 Interface 取消勾選。

![](https://i.imgur.com/wDtuSvY.png)

Peripheral I/O Pins 僅留下 UART0 其餘取消勾選。

![](https://i.imgur.com/zx7TVdX.png)

Clock Configuration > PL Fabric Clocks > FCLK_CLK0 取消勾選。

![](https://i.imgur.com/TdLfQKi.png)

OK 後 Diagram 的 ZYNQ7 processor 會變成如下圖所示。

![](https://i.imgur.com/lta5MfT.png)

將完成的 block design 包成 HDL wrapper (Lab2-2 Step5 最後一步)。
## Step 4. Run Implementation
按下 PROJECT MANAGER > Run Implementation。
>NOTE: 由於本次實驗僅使用 ZYNQ 現有的 ARM processor，無需產生 bitstream 所以只需執行到 Run Implementation 即可。
## Step 5. Launch Vitis IDE
File > Export > Export Hardware。

![](https://i.imgur.com/2XBRRF0.png)

Tools > Launch Vitis IDE

![](https://i.imgur.com/Tit0HjA.png)

路徑選擇專案路徑，Launch

![](https://i.imgur.com/QQh5zdJ.png)

## Step 6. Write a hello world program
File > New > Application Project > Next

![](https://i.imgur.com/VUGGlAH.png)

Creat a new platform from hardware(XSA) > Browse > 選擇剛剛Export Hardware所生成的`.xsa`

![](https://i.imgur.com/VhZrHNO.png)

Application project name

![](https://i.imgur.com/3h6m6Op.png)

Operating System: standlone(預設)
Processor: ps7_cortexa9_0(預設)

![](https://i.imgur.com/aBkrTgw.png)

選擇Empty Application > Finish

![](https://i.imgur.com/G5XEMhm.png)

新增空的 source file(檔名main.c) 並將 `Lab3-1/src/hello.c` 的內容貼上。

![](https://i.imgur.com/0cpP6nF.png)

開啟 PuTTY，選擇 Serial，輸入連接 FPGA 的 COM，設定 Baud rate 為 115200。
>NOTE: 接上板子並開啟電源後 -> 在 開始 右鍵 -> 裝置管理員 -> 連接埠(COM和LPT) 即可看 FPGA 是連接至哪一個 COM

![](https://i.imgur.com/B4tnXJd.png)
![](https://i.imgur.com/23jFkHM.png)

回到 Vitis，Build Project。

![](https://i.imgur.com/tqExgx7.png)

Run > Run Configuration。

![](https://i.imgur.com/LaSHVkc.png)

Single Application Debug(GDB) 點兩下後會出現此專案的GDB > Main。

![](https://i.imgur.com/9TgcDgH.png)

到 Application 選擇創建的 project。

![](https://i.imgur.com/MX54rX5.png)

Target Setup

![](https://i.imgur.com/A0UyVph.png)

按下 Run，切換到剛剛開啟的 PuTTY 畫面會出現 "Hello World!" 表示成功。

![](https://i.imgur.com/thmRY3M.png)