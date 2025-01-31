`timescale 1ns/1ps
/* verilator lint_off UNUSED */
module ahb_rom(input  logic        HCLK, HSEL,
               input  logic [15:2] HADDR,
               output logic [31:0] HRDATA);

  logic [31:0] rom[16383:0]; // 64KB ROM organized as 32K x 32 bits;

  initial begin
    //$readmemh("isim/ex7_27_memfile.dat", rom);
//    $readmemh("isim/mem_access.dat", rom);
    /* turn led on */
    rom[0]  = 32'he3a00002; // mov     r0, #2
    rom[1]  = 32'he1a00400; // lsl     r0, r0, #8
    rom[2]  = 32'he2800002; // add     r0, r0, #2
    rom[3]  = 32'he1a00a00; // lsl     r0, r0, #20
    rom[4]  = 32'he3a01001; // mov     r1, #1
    rom[5]  = 32'he5801000; // str     r1, [r0]
    rom[6]  = 32'he1a01081; // lsl     r1, r1, #1
    rom[7]  = 32'he5801000; // str     r1, [r0]
    rom[8]  = 32'he1a01081; // lsl     r1, r1, #1
    rom[9]  = 32'he5801000; // str     r1, [r0]
    rom[10] = 32'he3a01001; // mov     r1, #1
    rom[11] = 32'heafffff8; // b       14 <loop>
    rom[12] = 32'heafffff7;

    rom[13] = 32'heafffff7;
    rom[14] = 32'heafffff7;
    rom[15] = 32'heafffff7;
    rom[16] = 32'heafffff7;
    rom[17] = 32'heafffff7;
    rom[18] = 32'heafffff7;
    rom[18] = 32'heafffff7;
    rom[20] = 32'heafffff7;
    rom[21] = 32'heafffff7;
    rom[22] = 32'heafffff7;
    rom[23] = 32'heafffff7;

    /* Count -> works on goboard */
    /*
    rom[0]  = 32'he04f000f;
    rom[1]  = 32'he04f100f;
    rom[2]  = 32'he04f200f;
    rom[3]  = 32'he04f300f;
    rom[4]  = 32'he2833001;
    rom[5]  = 32'he0531002;
    rom[6]  = 32'h0a000003;
    rom[7]  = 32'he2833001;
    rom[8]  = 32'he5803014;
    rom[9]  = 32'he0531002;
    rom[10] = 32'h1afffff9;
    rom[11] = 32'he5803000;
    rom[12] = 32'heafffff7;

    rom[13] = 32'heafffff7;
    rom[14] = 32'heafffff7;
    rom[15] = 32'heafffff7;
    rom[16] = 32'heafffff7;
    rom[17] = 32'heafffff7;
    rom[18] = 32'heafffff7;
    rom[18] = 32'heafffff7;
    rom[20] = 32'heafffff7;
    rom[21] = 32'heafffff7;
    rom[22] = 32'heafffff7;
    rom[23] = 32'heafffff7;
    */
  end

//  always_ff @(posedge HCLK)
//    HRDATA <= rom[HADDR];
  assign HRDATA = rom[HADDR];
endmodule
