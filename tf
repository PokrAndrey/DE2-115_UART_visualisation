#! /usr/bin/vvp
:ivl_version "0.9.7 " "(v0_9_7)";
:vpi_time_precision - 10;
:vpi_module "system";
:vpi_module "v2005_math";
:vpi_module "va_math";
S_0x146c7a0 .scope module, "test_VGA_SRAM" "test_VGA_SRAM" 2 2;
 .timescale -9 -10;
v0x14cddb0_0 .var "R", 0 0;
v0x14cde80_0 .var "S", 0 0;
v0x14cdf00_0 .var "SRAM_DQ", 15 0;
v0x14cdfd0_0 .var "clk", 0 0;
v0x14ce050_0 .var "stop", 0 0;
S_0x14ab7b0 .scope module, "VGAandSRAMandControl" "VGAandSRAMandControl" 2 11, 3 1, S_0x146c7a0;
 .timescale 0 0;
v0x14cd3a0_0 .net "R", 0 0, v0x14cddb0_0; 1 drivers
v0x14cd440_0 .net "S", 0 0, v0x14cde80_0; 1 drivers
v0x14cd510_0 .net "SRAM_DQ", 15 0, v0x14cdf00_0; 1 drivers
v0x14cd590_0 .net "ce_addr", 0 0, v0x14cb7f0_0; 1 drivers
v0x14cd660_0 .net "clr", 0 0, v0x14c9810_0; 1 drivers
v0x14cd730_0 .net "counterLines", 9 0, v0x14ccd20_0; 1 drivers
v0x14cd7b0_0 .net "counterPclkH", 11 0, v0x14ccf90_0; 1 drivers
v0x14cd830_0 .net "en_shift", 0 0, L_0x14cefa0; 1 drivers
v0x14cd900_0 .net "op", 0 0, v0x14cc7c0_0; 1 drivers
v0x14cd980_0 .net "par", 9 0, L_0x14d0e10; 1 drivers
v0x14cda00_0 .net "parity_counterPclkH", 0 0, L_0x14cf990; 1 drivers
v0x14cdad0_0 .net "pixel_clk", 0 0, v0x14cdfd0_0; 1 drivers
v0x14cdbe0_0 .net "shift_counter", 9 0, v0x14cbd90_0; 1 drivers
v0x14cdcb0_0 .net "stop", 0 0, v0x14ce050_0; 1 drivers
S_0x14cc090 .scope module, "VGA_signals" "VGA_signals" 3 19, 4 1, S_0x14ab7b0;
 .timescale 0 0;
L_0x14c8920 .functor AND 1, v0x14cc560_0, v0x14cc7c0_0, C4<1>, C4<1>;
L_0x14cc9d0 .functor AND 1, L_0x14ce1c0, L_0x14ce330, C4<1>, C4<1>;
v0x14cc3e0_0 .net "EOL", 0 0, L_0x14ce1c0; 1 drivers
v0x14cc460_0 .net "EoFrame", 0 0, L_0x14cc9d0; 1 drivers
v0x14cc4e0_0 .var "HSYNC", 0 0;
v0x14cc560_0 .var "H_BLANK_N", 0 0;
v0x14cc5e0_0 .net "VGA_BLANK_N", 0 0, L_0x14c8920; 1 drivers
RS_0x7f2ce00a8068 .resolv tri, C4<1>, C4<1>, C4<z>, C4<z>;
v0x14cc660_0 .net8 "VGA_SYNC_N", 0 0, RS_0x7f2ce00a8068; 2 drivers
v0x14cc720_0 .var "VSYNC", 0 0;
v0x14cc7c0_0 .var "V_BLANK_N", 0 0;
v0x14cc8b0_0 .net *"_s10", 9 0, C4<1100011111>; 1 drivers
v0x14cc950_0 .net *"_s12", 0 0, L_0x14ce330; 1 drivers
v0x14cca50_0 .net *"_s6", 11 0, C4<010100011111>; 1 drivers
v0x14ccaf0_0 .var "control_sign", 3 0;
v0x14ccc00_0 .var "control_sign1", 3 0;
v0x14ccca0_0 .var "control_sign2", 3 0;
v0x14ccdc0_0 .var "control_sign3", 3 0;
v0x14cce60_0 .var "control_sign4", 3 0;
v0x14ccd20_0 .var "counterLines", 9 0;
v0x14ccf90_0 .var "counterPclkH", 11 0;
v0x14cd0b0_0 .var "delay_HSYNC", 0 0;
v0x14cd130_0 .var "delay_VGA_BLANK_N", 0 0;
v0x14cd010_0 .var "delay_VGA_SYNC_N", 0 0;
v0x14cd260_0 .var "delay_VSYNC", 0 0;
v0x14cd1d0_0 .alias "pixel_clk", 0 0, v0x14cdad0_0;
L_0x14ce1c0 .cmp/eq 12, v0x14ccf90_0, C4<010100011111>;
L_0x14ce330 .cmp/eq 10, v0x14ccd20_0, C4<1100011111>;
S_0x14c9fb0 .scope module, "SRAM" "SRAM" 3 21, 5 1, S_0x14ab7b0;
 .timescale 0 0;
L_0x14ce6d0 .functor AND 1, L_0x14ce540, L_0x14ce630, C4<1>, C4<1>;
L_0x14cea70 .functor NOT 1, L_0x14ce940, C4<0>, C4<0>, C4<0>;
L_0x14cead0 .functor AND 1, L_0x14ce850, L_0x14cea70, C4<1>, C4<1>;
L_0x14cebd0 .functor OR 1, L_0x14ce6d0, L_0x14cead0, C4<0>, C4<0>;
L_0x14cee00 .functor AND 1, L_0x14cebd0, L_0x14ced10, C4<1>, C4<1>;
L_0x14cef00 .functor NOT 1, v0x14cb7f0_0, C4<0>, C4<0>, C4<0>;
L_0x14cefa0 .functor AND 1, L_0x14cee00, L_0x14cef00, C4<1>, C4<1>;
L_0x14cf430 .functor AND 1, L_0x14cf250, L_0x14cf340, C4<1>, C4<1>;
L_0x14cf830 .functor NOT 1, L_0x14cf730, C4<0>, C4<0>, C4<0>;
L_0x14cf890 .functor AND 1, L_0x14cf580, L_0x14cf830, C4<1>, C4<1>;
L_0x14cf9f0 .functor OR 1, L_0x14cf430, L_0x14cf890, C4<0>, C4<0>;
L_0x14cfba0 .functor AND 1, L_0x14cf9f0, L_0x14cfb00, C4<1>, C4<1>;
L_0x14cf7d0 .functor XOR 1, L_0x14cfca0, L_0x14cfdb0, C4<0>, C4<0>;
L_0x14cf990 .functor NOT 1, L_0x14cf7d0, C4<0>, C4<0>, C4<0>;
v0x14ca0a0_0 .var "BLUE", 7 0;
v0x14ca160_0 .var "DRd", 15 0;
v0x14ca200_0 .var "DWr", 15 0;
v0x14ca2a0_0 .var "GREEN", 7 0;
v0x14ca320_0 .var "RED", 7 0;
v0x14ca3c0_0 .alias "S", 0 0, v0x14cd440_0;
v0x14ca440_0 .net "S_column_clr", 0 0, L_0x14cfba0; 1 drivers
v0x14ca4c0_0 .net *"_s0", 11 0, C4<010100011110>; 1 drivers
v0x14ca560_0 .net *"_s10", 0 0, L_0x14ce850; 1 drivers
v0x14ca600_0 .net *"_s13", 0 0, L_0x14ce940; 1 drivers
v0x14ca6a0_0 .net *"_s14", 0 0, L_0x14cea70; 1 drivers
v0x14ca740_0 .net *"_s16", 0 0, L_0x14cead0; 1 drivers
v0x14ca7e0_0 .net *"_s18", 0 0, L_0x14cebd0; 1 drivers
v0x14ca880_0 .net *"_s2", 0 0, L_0x14ce540; 1 drivers
v0x14ca9a0_0 .net *"_s20", 9 0, C4<1100011111>; 1 drivers
v0x14caa40_0 .net *"_s22", 0 0, L_0x14ced10; 1 drivers
v0x14ca900_0 .net *"_s24", 0 0, L_0x14cee00; 1 drivers
v0x14cab90_0 .net *"_s26", 0 0, L_0x14cef00; 1 drivers
v0x14cacb0_0 .net *"_s32", 11 0, C4<010100011101>; 1 drivers
v0x14cad30_0 .net *"_s34", 0 0, L_0x14cf250; 1 drivers
v0x14cac10_0 .net *"_s37", 0 0, L_0x14cf340; 1 drivers
v0x14cae60_0 .net *"_s38", 0 0, L_0x14cf430; 1 drivers
v0x14cadb0_0 .net *"_s40", 11 0, C4<010100011110>; 1 drivers
v0x14cafa0_0 .net *"_s42", 0 0, L_0x14cf580; 1 drivers
v0x14caf00_0 .net *"_s45", 0 0, L_0x14cf730; 1 drivers
v0x14cb0f0_0 .net *"_s46", 0 0, L_0x14cf830; 1 drivers
v0x14cb040_0 .net *"_s48", 0 0, L_0x14cf890; 1 drivers
v0x14cb250_0 .net *"_s5", 0 0, L_0x14ce630; 1 drivers
v0x14cb190_0 .net *"_s50", 0 0, L_0x14cf9f0; 1 drivers
v0x14cb3c0_0 .net *"_s52", 9 0, C4<1011111111>; 1 drivers
v0x14cb2d0_0 .net *"_s54", 0 0, L_0x14cfb00; 1 drivers
v0x14cb540_0 .net *"_s59", 0 0, L_0x14cfca0; 1 drivers
v0x14cb440_0 .net *"_s6", 0 0, L_0x14ce6d0; 1 drivers
v0x14cb6d0_0 .net *"_s61", 0 0, L_0x14cfdb0; 1 drivers
v0x14cb5c0_0 .net *"_s62", 0 0, L_0x14cf7d0; 1 drivers
v0x14cb870_0 .net *"_s8", 11 0, C4<010100011111>; 1 drivers
v0x14cb750_0 .var "address", 19 0;
v0x14cb7f0_0 .var "ce_addr", 0 0;
v0x14cba30_0 .alias "clr", 0 0, v0x14cd660_0;
v0x14cbab0_0 .var "column_clr", 0 0;
v0x14cb8f0_0 .alias "counterLines", 9 0, v0x14cd730_0;
v0x14cb9a0_0 .alias "counterPclkH", 11 0, v0x14cd7b0_0;
v0x14cbc90_0 .alias "data_out", 15 0, v0x14cd510_0;
v0x14cbd10_0 .var "datumPix", 9 0;
v0x14cbb30_0 .alias "en_shift", 0 0, v0x14cd830_0;
v0x14cbbb0_0 .alias "par", 9 0, v0x14cd980_0;
v0x14cbf10_0 .alias "parity_counterPclkH", 0 0, v0x14cda00_0;
v0x14cbf90_0 .alias "pixel_clk", 0 0, v0x14cdad0_0;
v0x14cbd90_0 .var "shift_counter", 9 0;
v0x14cbe10_0 .alias "stop", 0 0, v0x14cdcb0_0;
v0x14cbe90_0 .var "strings_counter", 9 0;
v0x14cc1b0_0 .net "ver_addr", 9 0, L_0x14cf0e0; 1 drivers
v0x14cc010_0 .var "wr_addr", 19 0;
L_0x14ce540 .cmp/eq 12, v0x14ccf90_0, C4<010100011110>;
L_0x14ce630 .part v0x14cbd90_0, 0, 1;
L_0x14ce850 .cmp/eq 12, v0x14ccf90_0, C4<010100011111>;
L_0x14ce940 .part v0x14cbd90_0, 0, 1;
L_0x14ced10 .cmp/eq 10, v0x14ccd20_0, C4<1100011111>;
L_0x14cf0e0 .part v0x14cb750_0, 9, 10;
L_0x14cf250 .cmp/eq 12, v0x14ccf90_0, C4<010100011101>;
L_0x14cf340 .part v0x14cbd90_0, 0, 1;
L_0x14cf580 .cmp/eq 12, v0x14ccf90_0, C4<010100011110>;
L_0x14cf730 .part v0x14cbd90_0, 0, 1;
L_0x14cfb00 .cmp/eq 10, v0x14ccd20_0, C4<1011111111>;
L_0x14cfca0 .part v0x14cbd90_0, 0, 1;
L_0x14cfdb0 .part v0x14ccf90_0, 0, 1;
S_0x14c95c0 .scope module, "SRAM_control" "SRAM_control" 3 23, 6 1, S_0x14ab7b0;
 .timescale 0 0;
L_0x14cffc0 .functor OR 1, v0x14c9af0_0, v0x14c9c30_0, C4<0>, C4<0>;
v0x14c93b0_0 .alias "R", 0 0, v0x14cd3a0_0;
v0x14c96d0_0 .alias "S", 0 0, v0x14cd440_0;
v0x14c9770_0 .alias "ce_addr", 0 0, v0x14cd590_0;
v0x14c9810_0 .var "clr", 0 0;
v0x14c98b0_0 .alias "counterLines", 9 0, v0x14cd730_0;
v0x14c9950_0 .alias "counterPclkH", 11 0, v0x14cd7b0_0;
v0x14c99f0_0 .alias "en_shift", 0 0, v0x14cd830_0;
v0x14c9a70_0 .var "nCE", 0 0;
v0x14c9af0_0 .var "nLB", 0 0;
v0x14c9b90_0 .net "nOE", 0 0, L_0x14cffc0; 1 drivers
v0x14c9c30_0 .var "nUB", 0 0;
v0x14c9cd0_0 .var "nWE", 0 0;
v0x14c9d70_0 .alias "parity_counterPclkH", 0 0, v0x14cda00_0;
v0x14c9e10_0 .alias "pixel_clk", 0 0, v0x14cdad0_0;
v0x14c9f10_0 .alias "shift_counter", 9 0, v0x14cdbe0_0;
S_0x14a6b70 .scope module, "Gen_parabola" "Gen_parabola" 3 25, 7 1, S_0x14ab7b0;
 .timescale 0 0;
L_0x14cfaa0 .functor OR 1, L_0x14d0020, L_0x14d0110, C4<0>, C4<0>;
L_0x14d0450 .functor OR 1, L_0x14cfaa0, L_0x14d0360, C4<0>, C4<0>;
L_0x14d0740 .functor OR 1, L_0x14d0450, L_0x14d0610, C4<0>, C4<0>;
L_0x14d0840 .functor NOT 1, L_0x14d0740, C4<0>, C4<0>, C4<0>;
v0x1499550_0 .net *"_s0", 5 0, C4<111111>; 1 drivers
v0x14c8300_0 .net *"_s10", 5 0, C4<001111>; 1 drivers
v0x14c83a0_0 .net *"_s12", 0 0, L_0x14d0360; 1 drivers
v0x14c8440_0 .net *"_s14", 0 0, L_0x14d0450; 1 drivers
v0x14c84f0_0 .net *"_s16", 5 0, C4<101111>; 1 drivers
v0x14c8590_0 .net *"_s18", 0 0, L_0x14d0610; 1 drivers
v0x14c8670_0 .net *"_s2", 0 0, L_0x14d0020; 1 drivers
v0x14c8710_0 .net *"_s20", 0 0, L_0x14d0740; 1 drivers
v0x14c8800_0 .net *"_s24", 19 0, C4<11111111111111111111>; 1 drivers
v0x14c88a0_0 .net *"_s27", 19 0, L_0x14d0930; 1 drivers
v0x14c89a0_0 .net *"_s28", 19 0, L_0x14d0a80; 1 drivers
v0x14c8a40_0 .net *"_s31", 10 0, C4<00000000000>; 1 drivers
v0x14c8b50_0 .net *"_s32", 19 0, L_0x14d0cd0; 1 drivers
v0x14c8bf0_0 .net *"_s4", 5 0, C4<011111>; 1 drivers
v0x14c8d10_0 .net *"_s6", 0 0, L_0x14d0110; 1 drivers
v0x14c8db0_0 .net *"_s8", 0 0, L_0x14cfaa0; 1 drivers
v0x14c8c70_0 .net "change", 0 0, L_0x14d0840; 1 drivers
v0x14c8f00_0 .var "cn_period", 5 0;
v0x14c9020_0 .alias "en_shift", 0 0, v0x14cd830_0;
v0x14c90a0_0 .var "mod_par", 8 0;
v0x14c8f80_0 .alias "par", 9 0, v0x14cd980_0;
v0x14c91d0_0 .alias "pixel_clk", 0 0, v0x14cdad0_0;
v0x14c9120_0 .var "sign", 0 0;
v0x14c9310_0 .var "t_en_shift", 0 0;
v0x14c9270_0 .var "up", 0 0;
v0x14c9460_0 .var "x", 3 0;
E_0x14a2090 .event posedge, v0x14c91d0_0;
L_0x14d0020 .cmp/eq 6, v0x14c8f00_0, C4<111111>;
L_0x14d0110 .cmp/eq 6, v0x14c8f00_0, C4<011111>;
L_0x14d0360 .cmp/eq 6, v0x14c8f00_0, C4<001111>;
L_0x14d0610 .cmp/eq 6, v0x14c8f00_0, C4<101111>;
L_0x14d0930 .arith/mult 20, v0x14c90a0_0, C4<11111111111111111111>;
L_0x14d0a80 .concat [ 9 11 0 0], v0x14c90a0_0, C4<00000000000>;
L_0x14d0cd0 .functor MUXZ 20, L_0x14d0a80, L_0x14d0930, v0x14c9120_0, C4<>;
L_0x14d0e10 .part L_0x14d0cd0, 0, 10;
    .scope S_0x14cc090;
T_0 ;
    %set/v v0x14cd010_0, 0, 1;
    %end;
    .thread T_0;
    .scope S_0x14cc090;
T_1 ;
    %set/v v0x14cd130_0, 0, 1;
    %end;
    .thread T_1;
    .scope S_0x14cc090;
T_2 ;
    %set/v v0x14cd0b0_0, 0, 1;
    %end;
    .thread T_2;
    .scope S_0x14cc090;
T_3 ;
    %set/v v0x14cd260_0, 0, 1;
    %end;
    .thread T_3;
    .scope S_0x14cc090;
T_4 ;
    %set/v v0x14ccf90_0, 0, 12;
    %end;
    .thread T_4;
    .scope S_0x14cc090;
T_5 ;
    %set/v v0x14ccd20_0, 0, 10;
    %end;
    .thread T_5;
    .scope S_0x14cc090;
T_6 ;
    %set/v v0x14cc7c0_0, 1, 1;
    %end;
    .thread T_6;
    .scope S_0x14cc090;
T_7 ;
    %set/v v0x14ccc00_0, 0, 4;
    %end;
    .thread T_7;
    .scope S_0x14cc090;
T_8 ;
    %set/v v0x14ccca0_0, 0, 4;
    %end;
    .thread T_8;
    .scope S_0x14cc090;
T_9 ;
    %set/v v0x14ccdc0_0, 0, 4;
    %end;
    .thread T_9;
    .scope S_0x14cc090;
T_10 ;
    %set/v v0x14cce60_0, 0, 4;
    %end;
    .thread T_10;
    .scope S_0x14cc090;
T_11 ;
    %set/v v0x14ccaf0_0, 0, 4;
    %end;
    .thread T_11;
    .scope S_0x14cc090;
T_12 ;
    %set/v v0x14cc560_0, 1, 1;
    %end;
    .thread T_12;
    .scope S_0x14cc090;
T_13 ;
    %set/v v0x14cc4e0_0, 1, 1;
    %end;
    .thread T_13;
    .scope S_0x14cc090;
T_14 ;
    %set/v v0x14cc720_0, 1, 1;
    %end;
    .thread T_14;
    .scope S_0x14cc090;
T_15 ;
    %wait E_0x14a2090;
    %load/v 8, v0x14ccd20_0, 10;
   %cmpi/u 8, 800, 10;
    %jmp/0xz  T_15.0, 5;
    %load/v 8, v0x14cc3e0_0, 1;
    %jmp/0  T_15.2, 8;
    %mov 9, 0, 32;
    %jmp/1  T_15.4, 8;
T_15.2 ; End of true expr.
    %load/v 41, v0x14ccf90_0, 12;
    %mov 53, 0, 20;
    %addi 41, 1, 32;
    %jmp/0  T_15.3, 8;
 ; End of false expr.
    %blend  9, 41, 32; Condition unknown.
    %jmp  T_15.4;
T_15.3 ;
    %mov 9, 41, 32; Return false value
T_15.4 ;
    %ix/load 0, 12, 0;
    %assign/v0 v0x14ccf90_0, 0, 9;
T_15.0 ;
    %load/v 8, v0x14ccd20_0, 10;
    %cmpi/u 8, 799, 10;
    %mov 8, 4, 1;
    %load/v 9, v0x14cc3e0_0, 1;
    %and 8, 9, 1;
    %jmp/0  T_15.5, 8;
    %mov 9, 0, 32;
    %jmp/1  T_15.7, 8;
T_15.5 ; End of true expr.
    %load/v 41, v0x14cc3e0_0, 1;
    %jmp/0  T_15.8, 41;
    %load/v 42, v0x14ccd20_0, 10;
    %mov 52, 0, 22;
    %addi 42, 1, 32;
    %jmp/1  T_15.10, 41;
T_15.8 ; End of true expr.
    %load/v 74, v0x14ccd20_0, 10;
    %mov 84, 0, 1;
    %mov 85, 0, 21;
    %jmp/0  T_15.9, 41;
 ; End of false expr.
    %blend  42, 74, 32; Condition unknown.
    %jmp  T_15.10;
T_15.9 ;
    %mov 42, 74, 32; Return false value
T_15.10 ;
    %jmp/0  T_15.6, 8;
 ; End of false expr.
    %blend  9, 42, 32; Condition unknown.
    %jmp  T_15.7;
T_15.6 ;
    %mov 9, 42, 32; Return false value
T_15.7 ;
    %ix/load 0, 10, 0;
    %assign/v0 v0x14ccd20_0, 0, 9;
    %load/v 8, v0x14cc720_0, 1;
    %load/v 9, v0x14cc4e0_0, 1;
    %load/v 10, v0x14cc5e0_0, 1;
    %load/v 11, v0x14cc660_0, 1;
    %ix/load 0, 4, 0;
    %assign/v0 v0x14ccc00_0, 0, 8;
    %load/v 8, v0x14ccc00_0, 4;
    %ix/load 0, 4, 0;
    %assign/v0 v0x14ccca0_0, 0, 8;
    %load/v 8, v0x14ccca0_0, 4;
    %ix/load 0, 4, 0;
    %assign/v0 v0x14ccdc0_0, 0, 8;
    %load/v 8, v0x14ccdc0_0, 4;
    %ix/load 0, 4, 0;
    %assign/v0 v0x14cce60_0, 0, 8;
    %load/v 8, v0x14cce60_0, 4;
    %ix/load 0, 4, 0;
    %assign/v0 v0x14ccaf0_0, 0, 8;
    %ix/load 1, 3, 0;
    %mov 4, 0, 1;
    %jmp/1 T_15.11, 4;
    %load/x1p 8, v0x14ccaf0_0, 1;
    %jmp T_15.12;
T_15.11 ;
    %mov 8, 2, 1;
T_15.12 ;
; Save base=8 wid=1 in lookaside.
    %ix/load 0, 1, 0;
    %assign/v0 v0x14cd010_0, 0, 8;
    %ix/load 1, 2, 0;
    %mov 4, 0, 1;
    %jmp/1 T_15.13, 4;
    %load/x1p 8, v0x14ccaf0_0, 1;
    %jmp T_15.14;
T_15.13 ;
    %mov 8, 2, 1;
T_15.14 ;
; Save base=8 wid=1 in lookaside.
    %ix/load 0, 1, 0;
    %assign/v0 v0x14cd130_0, 0, 8;
    %ix/load 1, 1, 0;
    %mov 4, 0, 1;
    %jmp/1 T_15.15, 4;
    %load/x1p 8, v0x14ccaf0_0, 1;
    %jmp T_15.16;
T_15.15 ;
    %mov 8, 2, 1;
T_15.16 ;
; Save base=8 wid=1 in lookaside.
    %ix/load 0, 1, 0;
    %assign/v0 v0x14cd0b0_0, 0, 8;
    %load/v 8, v0x14ccaf0_0, 1; Only need 1 of 4 bits
; Save base=8 wid=1 in lookaside.
    %ix/load 0, 1, 0;
    %assign/v0 v0x14cd260_0, 0, 8;
    %load/v 8, v0x14cc3e0_0, 1;
    %jmp/0  T_15.17, 8;
    %mov 9, 1, 1;
    %jmp/1  T_15.19, 8;
T_15.17 ; End of true expr.
    %load/v 10, v0x14ccf90_0, 12;
    %cmpi/u 10, 1023, 12;
    %mov 10, 4, 1;
    %jmp/0  T_15.20, 10;
    %mov 11, 0, 1;
    %jmp/1  T_15.22, 10;
T_15.20 ; End of true expr.
    %load/v 12, v0x14cc560_0, 1;
    %jmp/0  T_15.21, 10;
 ; End of false expr.
    %blend  11, 12, 1; Condition unknown.
    %jmp  T_15.22;
T_15.21 ;
    %mov 11, 12, 1; Return false value
T_15.22 ;
    %jmp/0  T_15.18, 8;
 ; End of false expr.
    %blend  9, 11, 1; Condition unknown.
    %jmp  T_15.19;
T_15.18 ;
    %mov 9, 11, 1; Return false value
T_15.19 ;
    %ix/load 0, 1, 0;
    %assign/v0 v0x14cc560_0, 0, 9;
    %load/v 8, v0x14cc460_0, 1;
    %jmp/0  T_15.23, 8;
    %mov 9, 1, 1;
    %jmp/1  T_15.25, 8;
T_15.23 ; End of true expr.
    %load/v 10, v0x14cc3e0_0, 1;
    %load/v 11, v0x14ccd20_0, 10;
    %cmpi/u 11, 767, 10;
    %mov 11, 4, 1;
    %and 10, 11, 1;
    %jmp/0  T_15.26, 10;
    %mov 11, 0, 1;
    %jmp/1  T_15.28, 10;
T_15.26 ; End of true expr.
    %load/v 12, v0x14cc7c0_0, 1;
    %jmp/0  T_15.27, 10;
 ; End of false expr.
    %blend  11, 12, 1; Condition unknown.
    %jmp  T_15.28;
T_15.27 ;
    %mov 11, 12, 1; Return false value
T_15.28 ;
    %jmp/0  T_15.24, 8;
 ; End of false expr.
    %blend  9, 11, 1; Condition unknown.
    %jmp  T_15.25;
T_15.24 ;
    %mov 9, 11, 1; Return false value
T_15.25 ;
    %ix/load 0, 1, 0;
    %assign/v0 v0x14cc7c0_0, 0, 9;
    %load/v 8, v0x14ccf90_0, 12;
    %cmpi/u 8, 1135, 12;
    %mov 8, 4, 1;
    %jmp/0  T_15.29, 8;
    %mov 9, 1, 1;
    %jmp/1  T_15.31, 8;
T_15.29 ; End of true expr.
    %load/v 10, v0x14ccf90_0, 12;
    %cmpi/u 10, 1039, 12;
    %mov 10, 4, 1;
    %jmp/0  T_15.32, 10;
    %mov 11, 0, 1;
    %jmp/1  T_15.34, 10;
T_15.32 ; End of true expr.
    %load/v 12, v0x14cc4e0_0, 1;
    %jmp/0  T_15.33, 10;
 ; End of false expr.
    %blend  11, 12, 1; Condition unknown.
    %jmp  T_15.34;
T_15.33 ;
    %mov 11, 12, 1; Return false value
T_15.34 ;
    %jmp/0  T_15.30, 8;
 ; End of false expr.
    %blend  9, 11, 1; Condition unknown.
    %jmp  T_15.31;
T_15.30 ;
    %mov 9, 11, 1; Return false value
T_15.31 ;
    %ix/load 0, 1, 0;
    %assign/v0 v0x14cc4e0_0, 0, 9;
    %load/v 8, v0x14cc3e0_0, 1;
    %load/v 9, v0x14ccd20_0, 10;
    %cmpi/u 9, 771, 10;
    %mov 9, 4, 1;
    %and 8, 9, 1;
    %jmp/0  T_15.35, 8;
    %mov 9, 1, 1;
    %jmp/1  T_15.37, 8;
T_15.35 ; End of true expr.
    %load/v 10, v0x14cc3e0_0, 1;
    %load/v 11, v0x14ccd20_0, 10;
    %cmpi/u 11, 768, 10;
    %mov 11, 4, 1;
    %and 10, 11, 1;
    %jmp/0  T_15.38, 10;
    %mov 11, 0, 1;
    %jmp/1  T_15.40, 10;
T_15.38 ; End of true expr.
    %load/v 12, v0x14cc720_0, 1;
    %jmp/0  T_15.39, 10;
 ; End of false expr.
    %blend  11, 12, 1; Condition unknown.
    %jmp  T_15.40;
T_15.39 ;
    %mov 11, 12, 1; Return false value
T_15.40 ;
    %jmp/0  T_15.36, 8;
 ; End of false expr.
    %blend  9, 11, 1; Condition unknown.
    %jmp  T_15.37;
T_15.36 ;
    %mov 9, 11, 1; Return false value
T_15.37 ;
    %ix/load 0, 1, 0;
    %assign/v0 v0x14cc720_0, 0, 9;
    %jmp T_15;
    .thread T_15;
    .scope S_0x14c9fb0;
T_16 ;
    %set/v v0x14cb7f0_0, 1, 1;
    %end;
    .thread T_16;
    .scope S_0x14c9fb0;
T_17 ;
    %set/v v0x14cbab0_0, 0, 1;
    %end;
    .thread T_17;
    .scope S_0x14c9fb0;
T_18 ;
    %set/v v0x14ca200_0, 0, 16;
    %end;
    .thread T_18;
    .scope S_0x14c9fb0;
T_19 ;
    %set/v v0x14ca320_0, 0, 8;
    %end;
    .thread T_19;
    .scope S_0x14c9fb0;
T_20 ;
    %set/v v0x14ca2a0_0, 0, 8;
    %end;
    .thread T_20;
    .scope S_0x14c9fb0;
T_21 ;
    %set/v v0x14ca0a0_0, 0, 8;
    %end;
    .thread T_21;
    .scope S_0x14c9fb0;
T_22 ;
    %movi 8, 1, 10;
    %set/v v0x14cbd90_0, 8, 10;
    %end;
    .thread T_22;
    .scope S_0x14c9fb0;
T_23 ;
    %set/v v0x14cb750_0, 0, 20;
    %end;
    .thread T_23;
    .scope S_0x14c9fb0;
T_24 ;
    %set/v v0x14ca160_0, 0, 16;
    %end;
    .thread T_24;
    .scope S_0x14c9fb0;
T_25 ;
    %set/v v0x14cbd10_0, 0, 10;
    %end;
    .thread T_25;
    .scope S_0x14c9fb0;
T_26 ;
    %set/v v0x14cc010_0, 0, 20;
    %end;
    .thread T_26;
    .scope S_0x14c9fb0;
T_27 ;
    %set/v v0x14cbe90_0, 0, 10;
    %end;
    .thread T_27;
    .scope S_0x14c9fb0;
T_28 ;
    %wait E_0x14a2090;
    %load/v 8, v0x14cba30_0, 1;
    %jmp/0  T_28.0, 8;
    %load/v 9, v0x14cc010_0, 20;
    %jmp/1  T_28.2, 8;
T_28.0 ; End of true expr.
    %load/v 29, v0x14cbb30_0, 1;
    %jmp/0  T_28.3, 29;
    %ix/load 1, 1, 0;
    %mov 4, 0, 1;
    %jmp/1 T_28.6, 4;
    %load/x1p 50, v0x14cbd90_0, 9;
    %jmp T_28.7;
T_28.6 ;
    %mov 50, 2, 9;
T_28.7 ;
    %mov 30, 50, 9; Move signal select into place
    %mov 39, 0, 11;
    %jmp/1  T_28.5, 29;
T_28.3 ; End of true expr.
    %load/v 50, v0x14cb7f0_0, 1;
    %load/v 51, v0x14cbf10_0, 1;
    %and 50, 51, 1;
    %jmp/0  T_28.8, 50;
    %ix/load 1, 1, 0;
    %mov 4, 0, 1;
    %jmp/1 T_28.11, 4;
    %load/x1p 71, v0x14cb9a0_0, 9;
    %jmp T_28.12;
T_28.11 ;
    %mov 71, 2, 9;
T_28.12 ;
; Save base=71 wid=9 in lookaside.
    %ix/load 1, 1, 0;
    %mov 4, 0, 1;
    %jmp/1 T_28.13, 4;
    %load/x1p 80, v0x14cbd90_0, 9;
    %jmp T_28.14;
T_28.13 ;
    %mov 80, 2, 9;
T_28.14 ;
; Save base=80 wid=9 in lookaside.
    %add 71, 80, 9;
    %mov 51, 71, 9;
    %load/v 60, v0x14cb8f0_0, 10;
    %mov 70, 0, 1;
    %jmp/1  T_28.10, 50;
T_28.8 ; End of true expr.
    %load/v 71, v0x14cbf10_0, 1;
    %load/v 72, v0x14cbab0_0, 1;
    %inv 72, 1;
    %and 71, 72, 1;
    %jmp/0  T_28.15, 71;
    %ix/load 1, 1, 0;
    %mov 4, 0, 1;
    %jmp/1 T_28.18, 4;
    %load/x1p 92, v0x14cbd90_0, 9;
    %jmp T_28.19;
T_28.18 ;
    %mov 92, 2, 9;
T_28.19 ;
    %mov 72, 92, 9; Move signal select into place
    %ix/load 0, 384, 0;
    %load/vp0 92, v0x14cbd10_0, 10;
    %mov 81, 92, 10;
    %mov 91, 0, 1;
    %jmp/1  T_28.17, 71;
T_28.15 ; End of true expr.
    %load/v 92, v0x14cbf10_0, 1;
    %load/v 93, v0x14cbab0_0, 1;
    %and 92, 93, 1;
    %jmp/0  T_28.20, 92;
    %ix/load 1, 1, 0;
    %mov 4, 0, 1;
    %jmp/1 T_28.23, 4;
    %load/x1p 113, v0x14cbd90_0, 9;
    %jmp T_28.24;
T_28.23 ;
    %mov 113, 2, 9;
T_28.24 ;
    %mov 93, 113, 9; Move signal select into place
    %load/v 102, v0x14cc010_0, 10; Select 10 out of 20 bits
    %mov 112, 0, 1;
    %jmp/1  T_28.22, 92;
T_28.20 ; End of true expr.
    %load/v 113, v0x14cb750_0, 20;
    %jmp/0  T_28.21, 92;
 ; End of false expr.
    %blend  93, 113, 20; Condition unknown.
    %jmp  T_28.22;
T_28.21 ;
    %mov 93, 113, 20; Return false value
T_28.22 ;
    %jmp/0  T_28.16, 71;
 ; End of false expr.
    %blend  72, 93, 20; Condition unknown.
    %jmp  T_28.17;
T_28.16 ;
    %mov 72, 93, 20; Return false value
T_28.17 ;
    %jmp/0  T_28.9, 50;
 ; End of false expr.
    %blend  51, 72, 20; Condition unknown.
    %jmp  T_28.10;
T_28.9 ;
    %mov 51, 72, 20; Return false value
T_28.10 ;
    %jmp/0  T_28.4, 29;
 ; End of false expr.
    %blend  30, 51, 20; Condition unknown.
    %jmp  T_28.5;
T_28.4 ;
    %mov 30, 51, 20; Return false value
T_28.5 ;
    %jmp/0  T_28.1, 8;
 ; End of false expr.
    %blend  9, 30, 20; Condition unknown.
    %jmp  T_28.2;
T_28.1 ;
    %mov 9, 30, 20; Return false value
T_28.2 ;
    %ix/load 0, 20, 0;
    %assign/v0 v0x14cb750_0, 0, 9;
    %load/v 8, v0x14cc010_0, 20;
    %movi 28, 393215, 20;
    %cmp/u 8, 28, 20;
    %mov 8, 4, 1;
    %load/v 9, v0x14cba30_0, 1;
    %and 8, 9, 1;
    %load/v 9, v0x14cba30_0, 1;
    %inv 9, 1;
    %load/v 10, v0x14cb7f0_0, 1;
    %and 9, 10, 1;
    %or 8, 9, 1;
    %load/v 9, v0x14cbf10_0, 1;
    %and 8, 9, 1;
    %jmp/0  T_28.25, 8;
    %mov 9, 0, 32;
    %jmp/1  T_28.27, 8;
T_28.25 ; End of true expr.
    %load/v 41, v0x14cbf10_0, 1;
    %load/v 42, v0x14cba30_0, 1;
    %load/v 43, v0x14cbab0_0, 1;
    %or 42, 43, 1;
    %and 41, 42, 1;
    %jmp/0  T_28.28, 41;
    %load/v 42, v0x14cc010_0, 20;
    %mov 62, 0, 12;
    %addi 42, 1, 32;
    %jmp/1  T_28.30, 41;
T_28.28 ; End of true expr.
    %load/v 74, v0x14cc010_0, 20;
    %mov 94, 0, 1;
    %mov 95, 0, 11;
    %jmp/0  T_28.29, 41;
 ; End of false expr.
    %blend  42, 74, 32; Condition unknown.
    %jmp  T_28.30;
T_28.29 ;
    %mov 42, 74, 32; Return false value
T_28.30 ;
    %jmp/0  T_28.26, 8;
 ; End of false expr.
    %blend  9, 42, 32; Condition unknown.
    %jmp  T_28.27;
T_28.26 ;
    %mov 9, 42, 32; Return false value
T_28.27 ;
    %ix/load 0, 20, 0;
    %assign/v0 v0x14cc010_0, 0, 9;
    %load/v 8, v0x14cbf10_0, 1;
    %jmp/0  T_28.31, 8;
    %load/v 9, v0x14cbc90_0, 16;
    %jmp/1  T_28.33, 8;
T_28.31 ; End of true expr.
    %ix/load 1, 8, 0;
    %mov 4, 0, 1;
    %jmp/1 T_28.34, 4;
    %load/x1p 41, v0x14ca160_0, 8;
    %jmp T_28.35;
T_28.34 ;
    %mov 41, 2, 8;
T_28.35 ;
    %mov 25, 41, 8; Move signal select into place
    %mov 33, 1, 8;
    %jmp/0  T_28.32, 8;
 ; End of false expr.
    %blend  9, 25, 16; Condition unknown.
    %jmp  T_28.33;
T_28.32 ;
    %mov 9, 25, 16; Return false value
T_28.33 ;
    %ix/load 0, 16, 0;
    %assign/v0 v0x14ca160_0, 0, 9;
    %mov 8, 1, 5;
    %ix/load 1, 5, 0;
    %mov 4, 0, 1;
    %jmp/1 T_28.36, 4;
    %load/x1p 16, v0x14ca160_0, 3;
    %jmp T_28.37;
T_28.36 ;
    %mov 16, 2, 3;
T_28.37 ;
    %mov 13, 16, 3; Move signal select into place
    %ix/load 0, 8, 0;
    %assign/v0 v0x14ca320_0, 0, 8;
    %mov 8, 1, 5;
    %ix/load 1, 2, 0;
    %mov 4, 0, 1;
    %jmp/1 T_28.38, 4;
    %load/x1p 16, v0x14ca160_0, 3;
    %jmp T_28.39;
T_28.38 ;
    %mov 16, 2, 3;
T_28.39 ;
    %mov 13, 16, 3; Move signal select into place
    %ix/load 0, 8, 0;
    %assign/v0 v0x14ca2a0_0, 0, 8;
    %mov 8, 1, 6;
    %load/v 14, v0x14ca160_0, 2; Select 2 out of 16 bits
    %ix/load 0, 8, 0;
    %assign/v0 v0x14ca0a0_0, 0, 8;
    %load/v 8, v0x14cbb30_0, 1;
    %jmp/0  T_28.40, 8;
    %mov 9, 1, 1;
    %jmp/1  T_28.42, 8;
T_28.40 ; End of true expr.
    %load/v 10, v0x14cb9a0_0, 12;
    %cmpi/u 10, 1309, 12;
    %mov 10, 4, 1;
    %load/v 11, v0x14cbd90_0, 1; Only need 1 of 10 bits
; Save base=11 wid=1 in lookaside.
    %and 10, 11, 1;
    %load/v 11, v0x14cb9a0_0, 12;
    %cmpi/u 11, 1310, 12;
    %mov 11, 4, 1;
    %load/v 12, v0x14cbd90_0, 1; Only need 1 of 10 bits
; Save base=12 wid=1 in lookaside.
    %inv 12, 1;
    %and 11, 12, 1;
    %or 10, 11, 1;
    %load/v 11, v0x14cb8f0_0, 10;
    %cmpi/u 11, 767, 10;
    %mov 11, 4, 1;
    %and 10, 11, 1;
    %jmp/0  T_28.43, 10;
    %mov 11, 0, 1;
    %jmp/1  T_28.45, 10;
T_28.43 ; End of true expr.
    %load/v 12, v0x14cb7f0_0, 1;
    %jmp/0  T_28.44, 10;
 ; End of false expr.
    %blend  11, 12, 1; Condition unknown.
    %jmp  T_28.45;
T_28.44 ;
    %mov 11, 12, 1; Return false value
T_28.45 ;
    %jmp/0  T_28.41, 8;
 ; End of false expr.
    %blend  9, 11, 1; Condition unknown.
    %jmp  T_28.42;
T_28.41 ;
    %mov 9, 11, 1; Return false value
T_28.42 ;
    %ix/load 0, 1, 0;
    %assign/v0 v0x14cb7f0_0, 0, 9;
    %load/v 8, v0x14ca440_0, 1;
    %jmp/0  T_28.46, 8;
    %mov 9, 1, 1;
    %jmp/1  T_28.48, 8;
T_28.46 ; End of true expr.
    %load/v 10, v0x14cb9a0_0, 12;
    %cmpi/u 10, 221, 12;
    %mov 10, 4, 1;
    %load/v 11, v0x14cbd90_0, 1; Only need 1 of 10 bits
; Save base=11 wid=1 in lookaside.
    %and 10, 11, 1;
    %load/v 11, v0x14cb9a0_0, 12;
    %cmpi/u 11, 222, 12;
    %mov 11, 4, 1;
    %load/v 12, v0x14cbd90_0, 1; Only need 1 of 10 bits
; Save base=12 wid=1 in lookaside.
    %inv 12, 1;
    %and 11, 12, 1;
    %or 10, 11, 1;
    %load/v 11, v0x14cb8f0_0, 10;
    %cmpi/u 11, 769, 10;
    %mov 11, 4, 1;
    %and 10, 11, 1;
    %jmp/0  T_28.49, 10;
    %mov 11, 0, 1;
    %jmp/1  T_28.51, 10;
T_28.49 ; End of true expr.
    %load/v 12, v0x14cbab0_0, 1;
    %jmp/0  T_28.50, 10;
 ; End of false expr.
    %blend  11, 12, 1; Condition unknown.
    %jmp  T_28.51;
T_28.50 ;
    %mov 11, 12, 1; Return false value
T_28.51 ;
    %jmp/0  T_28.47, 8;
 ; End of false expr.
    %blend  9, 11, 1; Condition unknown.
    %jmp  T_28.48;
T_28.47 ;
    %mov 9, 11, 1; Return false value
T_28.48 ;
    %ix/load 0, 1, 0;
    %assign/v0 v0x14cbab0_0, 0, 9;
    %load/v 8, v0x14cbf10_0, 1;
    %jmp/0xz  T_28.52, 8;
    %load/v 8, v0x14cbab0_0, 1;
    %jmp/0  T_28.54, 8;
    %mov 9, 0, 16;
    %jmp/1  T_28.56, 8;
T_28.54 ; End of true expr.
    %load/v 25, v0x14cb9a0_0, 12;
    %movi 37, 226, 12;
    %load/v 49, v0x14cbd90_0, 1; Select 1 out of 10 bits
    %mov 50, 0, 11;
    %add 37, 49, 12;
    %cmp/u 25, 37, 12;
    %mov 25, 4, 1;
    %load/v 26, v0x14cb8f0_0, 10;
    %cmpi/u 26, 769, 10;
    %mov 26, 4, 1;
    %and 25, 26, 1;
    %jmp/0  T_28.57, 25;
    %mov 26, 1, 16;
    %jmp/1  T_28.59, 25;
T_28.57 ; End of true expr.
    %load/v 42, v0x14cb9a0_0, 12;
    %movi 54, 228, 12;
    %load/v 66, v0x14cbd90_0, 1; Select 1 out of 10 bits
    %mov 67, 0, 11;
    %add 54, 66, 12;
    %cmp/u 42, 54, 12;
    %mov 42, 4, 1;
    %load/v 43, v0x14cb8f0_0, 10;
    %cmpi/u 43, 769, 10;
    %mov 43, 4, 1;
    %and 42, 43, 1;
    %jmp/0  T_28.60, 42;
    %movi 43, 34952, 16;
    %jmp/1  T_28.62, 42;
T_28.60 ; End of true expr.
    %load/v 59, v0x14cb9a0_0, 12;
    %movi 71, 230, 12;
    %load/v 83, v0x14cbd90_0, 1; Select 1 out of 10 bits
    %mov 84, 0, 11;
    %add 71, 83, 12;
    %cmp/u 59, 71, 12;
    %mov 59, 4, 1;
    %load/v 60, v0x14cb8f0_0, 10;
    %cmpi/u 60, 769, 10;
    %mov 60, 4, 1;
    %and 59, 60, 1;
    %jmp/0  T_28.63, 59;
    %movi 60, 21845, 16;
    %jmp/1  T_28.65, 59;
T_28.63 ; End of true expr.
    %movi 76, 48059, 16;
    %jmp/0  T_28.64, 59;
 ; End of false expr.
    %blend  60, 76, 16; Condition unknown.
    %jmp  T_28.65;
T_28.64 ;
    %mov 60, 76, 16; Return false value
T_28.65 ;
    %jmp/0  T_28.61, 42;
 ; End of false expr.
    %blend  43, 60, 16; Condition unknown.
    %jmp  T_28.62;
T_28.61 ;
    %mov 43, 60, 16; Return false value
T_28.62 ;
    %jmp/0  T_28.58, 25;
 ; End of false expr.
    %blend  26, 43, 16; Condition unknown.
    %jmp  T_28.59;
T_28.58 ;
    %mov 26, 43, 16; Return false value
T_28.59 ;
    %jmp/0  T_28.55, 8;
 ; End of false expr.
    %blend  9, 26, 16; Condition unknown.
    %jmp  T_28.56;
T_28.55 ;
    %mov 9, 26, 16; Return false value
T_28.56 ;
    %ix/load 0, 16, 0;
    %assign/v0 v0x14ca200_0, 0, 9;
T_28.52 ;
    %load/v 8, v0x14cb8f0_0, 10;
    %cmpi/u 8, 769, 10;
    %mov 8, 4, 1;
    %load/v 9, v0x14cbf10_0, 1;
    %and 8, 9, 1;
    %jmp/0xz  T_28.66, 8;
    %load/v 8, v0x14cb9a0_0, 12;
    %movi 20, 224, 12;
    %load/v 32, v0x14cbd90_0, 1; Select 1 out of 10 bits
    %mov 33, 0, 11;
    %add 20, 32, 12;
    %cmp/u 8, 20, 12;
    %mov 8, 4, 1;
    %jmp/0  T_28.68, 8;
    %load/v 9, v0x14cbd90_0, 10;
    %jmp/1  T_28.70, 8;
T_28.68 ; End of true expr.
    %load/v 19, v0x14cb9a0_0, 12;
    %movi 31, 226, 12;
    %load/v 43, v0x14cbd90_0, 1; Select 1 out of 10 bits
    %mov 44, 0, 11;
    %add 31, 43, 12;
    %cmp/u 19, 31, 12;
    %mov 19, 4, 1;
    %jmp/0  T_28.71, 19;
    %load/v 20, v0x14cbbb0_0, 10;
    %jmp/1  T_28.73, 19;
T_28.71 ; End of true expr.
    %load/v 30, v0x14cb9a0_0, 12;
    %movi 42, 228, 12;
    %load/v 54, v0x14cbd90_0, 1; Select 1 out of 10 bits
    %mov 55, 0, 11;
    %add 42, 54, 12;
    %cmp/u 30, 42, 12;
    %mov 30, 4, 1;
    %jmp/0  T_28.74, 30;
    %movi 31, 257, 10;
    %jmp/1  T_28.76, 30;
T_28.74 ; End of true expr.
    %movi 41, 767, 10;
    %jmp/0  T_28.75, 30;
 ; End of false expr.
    %blend  31, 41, 10; Condition unknown.
    %jmp  T_28.76;
T_28.75 ;
    %mov 31, 41, 10; Return false value
T_28.76 ;
    %jmp/0  T_28.72, 19;
 ; End of false expr.
    %blend  20, 31, 10; Condition unknown.
    %jmp  T_28.73;
T_28.72 ;
    %mov 20, 31, 10; Return false value
T_28.73 ;
    %jmp/0  T_28.69, 8;
 ; End of false expr.
    %blend  9, 20, 10; Condition unknown.
    %jmp  T_28.70;
T_28.69 ;
    %mov 9, 20, 10; Return false value
T_28.70 ;
    %ix/load 0, 10, 0;
    %assign/v0 v0x14cbd10_0, 0, 9;
T_28.66 ;
    %load/v 8, v0x14cbb30_0, 1;
    %load/v 9, v0x14cbe10_0, 1;
    %inv 9, 1;
    %and 8, 9, 1;
    %jmp/0  T_28.77, 8;
    %load/v 9, v0x14cbd90_0, 10;
    %mov 19, 0, 22;
    %addi 9, 1, 32;
    %jmp/1  T_28.79, 8;
T_28.77 ; End of true expr.
    %load/v 41, v0x14cbd90_0, 10;
    %mov 51, 0, 1;
    %mov 52, 0, 21;
    %jmp/0  T_28.78, 8;
 ; End of false expr.
    %blend  9, 41, 32; Condition unknown.
    %jmp  T_28.79;
T_28.78 ;
    %mov 9, 41, 32; Return false value
T_28.79 ;
    %ix/load 0, 10, 0;
    %assign/v0 v0x14cbd90_0, 0, 9;
    %jmp T_28;
    .thread T_28;
    .scope S_0x14c95c0;
T_29 ;
    %set/v v0x14c9a70_0, 0, 1;
    %end;
    .thread T_29;
    .scope S_0x14c95c0;
T_30 ;
    %set/v v0x14c9cd0_0, 1, 1;
    %end;
    .thread T_30;
    .scope S_0x14c95c0;
T_31 ;
    %set/v v0x14c9af0_0, 0, 1;
    %end;
    .thread T_31;
    .scope S_0x14c95c0;
T_32 ;
    %set/v v0x14c9c30_0, 0, 1;
    %end;
    .thread T_32;
    .scope S_0x14c95c0;
T_33 ;
    %set/v v0x14c9810_0, 0, 1;
    %end;
    .thread T_33;
    .scope S_0x14c95c0;
T_34 ;
    %wait E_0x14a2090;
    %load/v 8, v0x14c93b0_0, 1;
    %jmp/0  T_34.0, 8;
    %mov 9, 0, 1;
    %jmp/1  T_34.2, 8;
T_34.0 ; End of true expr.
    %load/v 10, v0x14c96d0_0, 1;
    %jmp/0  T_34.3, 10;
    %mov 11, 1, 1;
    %jmp/1  T_34.5, 10;
T_34.3 ; End of true expr.
    %load/v 12, v0x14c9810_0, 1;
    %jmp/0  T_34.4, 10;
 ; End of false expr.
    %blend  11, 12, 1; Condition unknown.
    %jmp  T_34.5;
T_34.4 ;
    %mov 11, 12, 1; Return false value
T_34.5 ;
    %jmp/0  T_34.1, 8;
 ; End of false expr.
    %blend  9, 11, 1; Condition unknown.
    %jmp  T_34.2;
T_34.1 ;
    %mov 9, 11, 1; Return false value
T_34.2 ;
    %ix/load 0, 1, 0;
    %assign/v0 v0x14c9810_0, 0, 9;
    %load/v 8, v0x14c9810_0, 1;
    %jmp/0  T_34.6, 8;
    %load/v 9, v0x14c9950_0, 1; Only need 1 of 12 bits
; Save base=9 wid=1 in lookaside.
    %inv 9, 1;
    %jmp/1  T_34.8, 8;
T_34.6 ; End of true expr.
    %load/v 10, v0x14c9af0_0, 1;
    %load/v 11, v0x14c9c30_0, 1;
    %or 10, 11, 1;
    %load/v 11, v0x14c99f0_0, 1;
    %inv 11, 1;
    %and 10, 11, 1;
    %jmp/0  T_34.9, 10;
    %load/v 11, v0x14c9d70_0, 1;
    %jmp/1  T_34.11, 10;
T_34.9 ; End of true expr.
    %jmp/0  T_34.10, 10;
 ; End of false expr.
    %blend  11, 1, 1; Condition unknown.
    %jmp  T_34.11;
T_34.10 ;
    %mov 11, 1, 1; Return false value
T_34.11 ;
    %jmp/0  T_34.7, 8;
 ; End of false expr.
    %blend  9, 11, 1; Condition unknown.
    %jmp  T_34.8;
T_34.7 ;
    %mov 9, 11, 1; Return false value
T_34.8 ;
    %ix/load 0, 1, 0;
    %assign/v0 v0x14c9cd0_0, 0, 9;
    %load/v 8, v0x14c9d70_0, 1;
    %load/v 9, v0x14c99f0_0, 1;
    %or 8, 9, 1;
    %jmp/0xz  T_34.12, 8;
    %load/v 8, v0x14c9770_0, 1;
    %inv 8, 1;
    %load/v 9, v0x14c99f0_0, 1;
    %inv 9, 1;
    %and 8, 9, 1;
    %load/v 9, v0x14c9810_0, 1;
    %inv 9, 1;
    %and 8, 9, 1;
    %jmp/0  T_34.14, 8;
    %load/v 9, v0x14c9f10_0, 1; Only need 1 of 10 bits
; Save base=9 wid=1 in lookaside.
    %jmp/1  T_34.16, 8;
T_34.14 ; End of true expr.
    %jmp/0  T_34.15, 8;
 ; End of false expr.
    %blend  9, 0, 1; Condition unknown.
    %jmp  T_34.16;
T_34.15 ;
    %mov 9, 0, 1; Return false value
T_34.16 ;
    %ix/load 0, 1, 0;
    %assign/v0 v0x14c9af0_0, 0, 9;
    %load/v 8, v0x14c9770_0, 1;
    %inv 8, 1;
    %load/v 9, v0x14c99f0_0, 1;
    %inv 9, 1;
    %and 8, 9, 1;
    %load/v 9, v0x14c9810_0, 1;
    %inv 9, 1;
    %and 8, 9, 1;
    %jmp/0  T_34.17, 8;
    %load/v 9, v0x14c9f10_0, 1; Only need 1 of 10 bits
; Save base=9 wid=1 in lookaside.
    %inv 9, 1;
    %jmp/1  T_34.19, 8;
T_34.17 ; End of true expr.
    %jmp/0  T_34.18, 8;
 ; End of false expr.
    %blend  9, 0, 1; Condition unknown.
    %jmp  T_34.19;
T_34.18 ;
    %mov 9, 0, 1; Return false value
T_34.19 ;
    %ix/load 0, 1, 0;
    %assign/v0 v0x14c9c30_0, 0, 9;
T_34.12 ;
    %jmp T_34;
    .thread T_34;
    .scope S_0x14a6b70;
T_35 ;
    %set/v v0x14c9460_0, 1, 4;
    %end;
    .thread T_35;
    .scope S_0x14a6b70;
T_36 ;
    %set/v v0x14c9270_0, 1, 1;
    %end;
    .thread T_36;
    .scope S_0x14a6b70;
T_37 ;
    %set/v v0x14c9120_0, 0, 1;
    %end;
    .thread T_37;
    .scope S_0x14a6b70;
T_38 ;
    %set/v v0x14c9310_0, 0, 1;
    %end;
    .thread T_38;
    .scope S_0x14a6b70;
T_39 ;
    %set/v v0x14c8f00_0, 0, 6;
    %end;
    .thread T_39;
    .scope S_0x14a6b70;
T_40 ;
    %set/v v0x14c90a0_0, 0, 9;
    %end;
    .thread T_40;
    .scope S_0x14a6b70;
T_41 ;
    %wait E_0x14a2090;
    %load/v 8, v0x14c9020_0, 1;
    %jmp/0  T_41.0, 8;
    %load/v 9, v0x14c8f00_0, 6;
    %mov 15, 0, 26;
    %addi 9, 1, 32;
    %jmp/1  T_41.2, 8;
T_41.0 ; End of true expr.
    %load/v 41, v0x14c8f00_0, 6;
    %mov 47, 0, 1;
    %mov 48, 0, 25;
    %jmp/0  T_41.1, 8;
 ; End of false expr.
    %blend  9, 41, 32; Condition unknown.
    %jmp  T_41.2;
T_41.1 ;
    %mov 9, 41, 32; Return false value
T_41.2 ;
    %ix/load 0, 6, 0;
    %assign/v0 v0x14c8f00_0, 0, 9;
    %load/v 8, v0x14c8f00_0, 6;
    %mov 14, 0, 1;
    %cmpi/u 8, 0, 7;
    %mov 8, 4, 1;
    %load/v 9, v0x14c8f00_0, 6;
    %cmpi/u 9, 31, 6;
    %mov 9, 4, 1;
    %load/v 10, v0x14c9020_0, 1;
    %and 9, 10, 1;
    %or 8, 9, 1;
    %jmp/0  T_41.3, 8;
    %mov 9, 1, 1;
    %jmp/1  T_41.5, 8;
T_41.3 ; End of true expr.
    %load/v 10, v0x14c8f00_0, 6;
    %cmpi/u 10, 16, 6;
    %mov 10, 4, 1;
    %load/v 11, v0x14c8f00_0, 6;
    %cmpi/u 11, 47, 6;
    %mov 11, 4, 1;
    %load/v 12, v0x14c9020_0, 1;
    %and 11, 12, 1;
    %or 10, 11, 1;
    %jmp/0  T_41.6, 10;
    %mov 11, 0, 1;
    %jmp/1  T_41.8, 10;
T_41.6 ; End of true expr.
    %load/v 12, v0x14c9270_0, 1;
    %jmp/0  T_41.7, 10;
 ; End of false expr.
    %blend  11, 12, 1; Condition unknown.
    %jmp  T_41.8;
T_41.7 ;
    %mov 11, 12, 1; Return false value
T_41.8 ;
    %jmp/0  T_41.4, 8;
 ; End of false expr.
    %blend  9, 11, 1; Condition unknown.
    %jmp  T_41.5;
T_41.4 ;
    %mov 9, 11, 1; Return false value
T_41.5 ;
    %ix/load 0, 1, 0;
    %assign/v0 v0x14c9270_0, 0, 9;
    %load/v 8, v0x14c8f00_0, 6;
    %cmpi/u 8, 63, 6;
    %mov 8, 4, 1;
    %load/v 9, v0x14c9020_0, 1;
    %and 8, 9, 1;
    %jmp/0  T_41.9, 8;
    %mov 9, 0, 1;
    %jmp/1  T_41.11, 8;
T_41.9 ; End of true expr.
    %load/v 10, v0x14c8f00_0, 6;
    %cmpi/u 10, 31, 6;
    %mov 10, 4, 1;
    %load/v 11, v0x14c9020_0, 1;
    %and 10, 11, 1;
    %jmp/0  T_41.12, 10;
    %mov 11, 1, 1;
    %jmp/1  T_41.14, 10;
T_41.12 ; End of true expr.
    %load/v 12, v0x14c9120_0, 1;
    %jmp/0  T_41.13, 10;
 ; End of false expr.
    %blend  11, 12, 1; Condition unknown.
    %jmp  T_41.14;
T_41.13 ;
    %mov 11, 12, 1; Return false value
T_41.14 ;
    %jmp/0  T_41.10, 8;
 ; End of false expr.
    %blend  9, 11, 1; Condition unknown.
    %jmp  T_41.11;
T_41.10 ;
    %mov 9, 11, 1; Return false value
T_41.11 ;
    %ix/load 0, 1, 0;
    %assign/v0 v0x14c9120_0, 0, 9;
    %load/v 8, v0x14c9020_0, 1;
    %ix/load 0, 1, 0;
    %assign/v0 v0x14c9310_0, 0, 8;
    %load/v 8, v0x14c9270_0, 1;
    %load/v 9, v0x14c9020_0, 1;
    %and 8, 9, 1;
    %load/v 9, v0x14c8c70_0, 1;
    %and 8, 9, 1;
    %jmp/0  T_41.15, 8;
    %load/v 9, v0x14c9460_0, 4;
    %mov 13, 0, 28;
    %subi 9, 1, 32;
    %jmp/1  T_41.17, 8;
T_41.15 ; End of true expr.
    %load/v 41, v0x14c9270_0, 1;
    %inv 41, 1;
    %load/v 42, v0x14c9020_0, 1;
    %and 41, 42, 1;
    %load/v 42, v0x14c8c70_0, 1;
    %and 41, 42, 1;
    %jmp/0  T_41.18, 41;
    %load/v 42, v0x14c9460_0, 4;
    %mov 46, 0, 28;
    %addi 42, 1, 32;
    %jmp/1  T_41.20, 41;
T_41.18 ; End of true expr.
    %load/v 74, v0x14c9460_0, 4;
    %mov 78, 0, 28;
    %jmp/0  T_41.19, 41;
 ; End of false expr.
    %blend  42, 74, 32; Condition unknown.
    %jmp  T_41.20;
T_41.19 ;
    %mov 42, 74, 32; Return false value
T_41.20 ;
    %jmp/0  T_41.16, 8;
 ; End of false expr.
    %blend  9, 42, 32; Condition unknown.
    %jmp  T_41.17;
T_41.16 ;
    %mov 9, 42, 32; Return false value
T_41.17 ;
    %ix/load 0, 4, 0;
    %assign/v0 v0x14c9460_0, 0, 9;
    %load/v 8, v0x14c9270_0, 1;
    %load/v 9, v0x14c9020_0, 1;
    %and 8, 9, 1;
    %jmp/0  T_41.21, 8;
    %load/v 9, v0x14c90a0_0, 9;
    %mov 18, 0, 25;
    %load/v 43, v0x14c9460_0, 4;
    %mov 47, 0, 30;
    %ix/load 0, 1, 0;
    %mov 4, 0, 1;
    %shiftl/i0  43, 34;
    %add 9, 43, 34;
    %addi 9, 1, 34;
    %jmp/1  T_41.23, 8;
T_41.21 ; End of true expr.
    %load/v 43, v0x14c9270_0, 1;
    %inv 43, 1;
    %load/v 44, v0x14c9020_0, 1;
    %and 43, 44, 1;
    %jmp/0  T_41.24, 43;
    %load/v 44, v0x14c90a0_0, 9;
    %mov 53, 0, 25;
    %load/v 78, v0x14c9460_0, 4;
    %mov 82, 0, 30;
    %ix/load 0, 1, 0;
    %mov 4, 0, 1;
    %shiftl/i0  78, 34;
    %sub 44, 78, 34;
    %subi 44, 1, 34;
    %jmp/1  T_41.26, 43;
T_41.24 ; End of true expr.
    %load/v 78, v0x14c90a0_0, 9;
    %mov 87, 0, 25;
    %jmp/0  T_41.25, 43;
 ; End of false expr.
    %blend  44, 78, 34; Condition unknown.
    %jmp  T_41.26;
T_41.25 ;
    %mov 44, 78, 34; Return false value
T_41.26 ;
    %jmp/0  T_41.22, 8;
 ; End of false expr.
    %blend  9, 44, 34; Condition unknown.
    %jmp  T_41.23;
T_41.22 ;
    %mov 9, 44, 34; Return false value
T_41.23 ;
    %ix/load 0, 9, 0;
    %assign/v0 v0x14c90a0_0, 0, 9;
    %jmp T_41;
    .thread T_41;
    .scope S_0x146c7a0;
T_42 ;
    %set/v v0x14cdfd0_0, 0, 1;
    %delay 10, 0;
    %set/v v0x14cdfd0_0, 1, 1;
    %load/v 8, v0x14cdf00_0, 16;
    %mov 24, 0, 16;
    %addi 8, 1, 32;
    %set/v v0x14cdf00_0, 8, 16;
    %delay 10, 0;
    %jmp T_42;
    .thread T_42;
    .scope S_0x146c7a0;
T_43 ;
    %set/v v0x14cdf00_0, 0, 16;
    %set/v v0x14cde80_0, 0, 1;
    %set/v v0x14cddb0_0, 0, 1;
    %set/v v0x14ce050_0, 0, 1;
    %vpi_call 2 28 "$dumpvars";
    %delay 51060000, 0;
    %vpi_call 2 34 "$finish";
    %end;
    .thread T_43;
# The file index is used to find the file name in the following table.
:file_names 8;
    "N/A";
    "<interactive>";
    "test_VSC.v";
    "VGAandSRAMandControl.v";
    "VGA_signals.v";
    "SRAM.v";
    "SRAM_control.v";
    "Gen_parabola.v";
