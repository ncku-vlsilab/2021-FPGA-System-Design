// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Mon Apr 19 16:29:51 2021
// Host        : DESKTOP-K6VGPJ0 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               d:/2021-FPGA-System-Design/Lab4-BlockRAM/Lab4-1_BRAM_Generator/project_2/project_2.gen/sources_1/bd/design_1/ip/design_1_blk_mem_gen_0_2/design_1_blk_mem_gen_0_2_sim_netlist.v
// Design      : design_1_blk_mem_gen_0_2
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "design_1_blk_mem_gen_0_2,blk_mem_gen_v8_4_4,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_4,Vivado 2020.2" *) 
(* NotValidForBitStream *)
module design_1_blk_mem_gen_0_2
   (clka,
    rsta,
    ena,
    wea,
    addra,
    dina,
    douta,
    rsta_busy);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE BRAM_CTRL, READ_WRITE_MODE READ_WRITE, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA RST" *) input rsta;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [3:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [31:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [31:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [31:0]douta;
  output rsta_busy;

  wire [31:0]addra;
  wire clka;
  wire [31:0]dina;
  wire [31:0]douta;
  wire ena;
  wire rsta;
  wire rsta_busy;
  wire [3:0]wea;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_rstb_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_sbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire [31:0]NLW_U0_doutb_UNCONNECTED;
  wire [31:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [31:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [31:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "32" *) 
  (* C_ADDRB_WIDTH = "32" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "8" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "0" *) 
  (* C_COUNT_36K_BRAM = "2" *) 
  (* C_CTRL_ECC_ALGO = "NONE" *) 
  (* C_DEFAULT_DATA = "0" *) 
  (* C_DISABLE_WARN_BHV_COLL = "0" *) 
  (* C_DISABLE_WARN_BHV_RANGE = "0" *) 
  (* C_ELABORATION_DIR = "./" *) 
  (* C_ENABLE_32BIT_ADDRESS = "1" *) 
  (* C_EN_DEEPSLEEP_PIN = "0" *) 
  (* C_EN_ECC_PIPE = "0" *) 
  (* C_EN_RDADDRA_CHG = "0" *) 
  (* C_EN_RDADDRB_CHG = "0" *) 
  (* C_EN_SAFETY_CKT = "1" *) 
  (* C_EN_SHUTDOWN_PIN = "0" *) 
  (* C_EN_SLEEP_PIN = "0" *) 
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     5.3746 mW" *) 
  (* C_FAMILY = "zynq" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "1" *) 
  (* C_HAS_ENB = "0" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_REGCEA = "0" *) 
  (* C_HAS_REGCEB = "0" *) 
  (* C_HAS_RSTA = "1" *) 
  (* C_HAS_RSTB = "0" *) 
  (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) 
  (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
  (* C_INITA_VAL = "0" *) 
  (* C_INITB_VAL = "0" *) 
  (* C_INIT_FILE = "NONE" *) 
  (* C_INIT_FILE_NAME = "no_coe_file_loaded" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "0" *) 
  (* C_MEM_TYPE = "0" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "2048" *) 
  (* C_READ_DEPTH_B = "2048" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "32" *) 
  (* C_READ_WIDTH_B = "32" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "1" *) 
  (* C_USE_BYTE_WEA = "1" *) 
  (* C_USE_BYTE_WEB = "1" *) 
  (* C_USE_DEFAULT_DATA = "0" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "4" *) 
  (* C_WEB_WIDTH = "4" *) 
  (* C_WRITE_DEPTH_A = "2048" *) 
  (* C_WRITE_DEPTH_B = "2048" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "32" *) 
  (* C_WRITE_WIDTH_B = "32" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  design_1_blk_mem_gen_0_2_blk_mem_gen_v8_4_4 U0
       (.addra({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,addra[12:2],1'b0,1'b0}),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(douta),
        .doutb(NLW_U0_doutb_UNCONNECTED[31:0]),
        .eccpipece(1'b0),
        .ena(ena),
        .enb(1'b0),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[31:0]),
        .regcea(1'b0),
        .regceb(1'b0),
        .rsta(rsta),
        .rsta_busy(rsta_busy),
        .rstb(1'b0),
        .rstb_busy(NLW_U0_rstb_busy_UNCONNECTED),
        .s_aclk(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[3:0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_dbiterr(NLW_U0_s_axi_dbiterr_UNCONNECTED),
        .s_axi_injectdbiterr(1'b0),
        .s_axi_injectsbiterr(1'b0),
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[31:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[31:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(wea),
        .web({1'b0,1'b0,1'b0,1'b0}));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2020.2"
`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="cds_rsa_key", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=64)
`pragma protect key_block
QGLtnqZzRetDH6gCWT4Js6wuLlZfrNx/VJp3sfR2NF+cxypO5AxN0oDKLJJtmdrtE/ueNDg+Qf7Z
TqBNRojORA==

`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
B6Ger3hRvfjHkaJ+W8639Kl3TzC9TogLuklOXEiMNdc4Im+DjEUzxb3DKlzu0VW3zxZqjJ3+wsW/
LnRmPCESi5Y9eRJaLFXg79EMfoj4X+nTdHAP6yCfltBADKegZ12gpnB/8ey5yn2KA74LUtPC7jna
iyjqSfsWLGnz6UdXzwk=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
BX+DxgMPRyZbYojCUR9Sk8Lq+3ZigBz4yMFHQkmurfdfDzyTPJCE827eGiPyTenK1QPVhEtf9g06
0BFXq/0COPuU1BWJwdkz1c4dE6/exDwhvEh+hPx3vRY6z8fDEf6aGVIXrHDvrmddehe7yMSIpo+k
aXHR06EEdfHCFY4TggYwhcJVXjkE+ApsVuyfmEfPmYjo8hCWyQyBsUWIOY03q1+MvUjjsmTwgs9g
fh5MY9ToaLfoJxPKdCpsqrBX4LJ+VDGFlAqIcqHTE2jCmPiToZAFXB7fzf1wDjFCBlJyFVDBGi0i
m+CouLSb7X1mvVhdDZgNrZDJMV688Bu3o54vew==

`pragma protect key_keyowner="ATRENTA", key_keyname="ATR-SG-2015-RSA-3", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
DaIU/Ddc8USbZ2mURzujJDWDH1JbHl5tFVOOQ2aVaUPIA71yyE38OXVLEtF8rNmujYH30nEeQ+FV
LVJ16aaHw+iiuaqorTM3K5KLohVlN+WlcEtSXHuPNHjw8ddqtzpaX7pH1zqZH+YmfCL5oaNLqDH4
rkBnUl0/Gm/hzSwKjYhXGQFYQ+gGP99OjXakzrAqZzp/Iq4gt+Z5902/JV9thd/isHQImJ0QyK8M
EKM579iPAfXGes2mbiNYHcvDmSPYmW1zlhOE++N1EKeea7j/msnKeyhlC+hGE4Xfn4TVvqgQexCT
rp/wS/MosY6WH1aKFQlFH2hEppA7KXUaQlvG+w==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
XmWoAt4X8hrCJ5yTyug4ajJW5UhfkLNibzjihWzZ4Cr9hQSvWZoTc8rjGsLPbz6Le+/9iI5KxecS
eR0wiAO+G2IkwhZgVBeZdKoFnlnTVAyLjk9wMAFXNyJZM6b1NDbfXlPcUsC6JePvPlwwdWknkSsC
r3KvgkWAS+O3xvRmaNw=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Hw3Y+rShKrXiUViyNU1/O2qv6TgheLHBnFMj1i9MUGrHYqh9pLfLYUgWR7S2vj4jv4S+Ks0BpP4p
dKEqVAFmTCfQNEUHaVcFPkOHgig6L4mhLY6HUUKJoRgiQepgLi/W3V+ZZPQSQFkB3CU4MsJzhXvR
yLcpDriZy8cnAHD87Zi5DrNGBzj3kigJeM0du6lCQbxtF5aEdoaNP+YTnIFtcqYhoYnswQlYt0sV
HKgFA8VzqzL5WYnpH7+1IKmFkJBHkyqHCa9wPK0qCKnxkuDj70YzPVqQ+cocdKU+/gNdpCOdZlci
F2HTxrgfrXndJru3TiDqu4UavqAe0MNuFp3t0w==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
XPVggoWL6aXz+MpODTOZhEUQDa0vfEnUDaYeEHXm2vGyqKJujN2c/FFAFBeBYdJATLsIsQ+BqoPc
pBbcFYXDBfOtFIW2dH6Y1OoD65KyJ/hAq8coa21kFgq4hFat5vzZ2iIfkCpTUr4vDZO7Xne8cZO9
WsHffoTCt5rS59wWm2b8I5R8Eh2TUbQg3RCyrcnD66cvcEnlXe1CNMQ4/loVJpA4IBinBf820Wjc
vw2fZbGI0jXC+ACSHOviH63Xwmn+aRV5Ppkup7IYoon/ieKapRQeASu3TTY37xSBXiInSdtMTzJ6
+4GfO4eSHVriCk/sWbuTBzfRzoSShrnHjzz5LA==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2020_08", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
L78XuiswVcgO2gtebzL7SA9BC/jJGAM0v6S9pzmyqL+QYzRneiYeGyDmsW33jEVVSTuNjTXkBLY7
yTOKQruatwe4V0OLi6174saSAmPgerSV1GyLP7KhmusLV/N61avC9TPam+tekhKeE0tds4EnJ3et
4JdLh+SE4Z4pcuqCjB5MFneIYKKWDx7siU6oesAQtoSJOesfMchX63MhOjOHFP/ch+1gHv3T45hg
IGF7V7TrdREVE4f9631tlVJ1o2Dypsmo/76Itz5WCGlTMjAnWXN8IXxKN+PZ3dyt1wjrZm2P/td+
xiGszFnSLrRvw/HferwtSmRx8q0fiHZ88roGTw==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
kDX5kq2QEe25429T6vQqBCFvV1McKTJRYfK99ymVNK2GGvGLXSzgwJHwB2fj9rM0wme3zYYY0vQR
x+9F4L7KLlOVY6qY3LB59uDzyXBI3mMZaS905HXHJkdZHWtQWpfHhl27LqL+8FSluaD6F+KFfYOV
CwIOVuCIp/XjxFXpNBik7YiPt4kHOlDA97IXNLnYUn/g1csGqeNWce4UTne50ggWvLYGbTFGmTjT
N67TpUiGRVRCSv8Tax72GWFIMFZk3Tlp68ZUSQEybZMWX1U9XdMdtxfvNGhf8mi5jQJ2SupSzKu4
T/+53IN9T8aLePAiGBKKG1ZBj4y1ZyYA7XYvjw==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 52800)
`pragma protect data_block
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
fJlDyukFR0vlxvGQq0Ii+KrM
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
