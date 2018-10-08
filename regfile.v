//------------------------------------------------------------------------------
// MIPS register file
//   width: 32 bits
//   depth: 32 words (reg[0] is static zero register)
//   2 asynchronous read ports
//   1 synchronous, positive edge triggered write port
//------------------------------------------------------------------------------
`include "register32.v"
`include "register32zero.v"
`include "mux32to1by32.v"
`include "decoder1to32.v"

module regfile
(
output[31:0]	ReadData1,	// Contents of first register read
output[31:0]	ReadData2,	// Contents of second register read
input[31:0]	WriteData,	// Contents to write to register
input[4:0]	ReadRegister1,	// Address of first register to read
input[4:0]	ReadRegister2,	// Address of second register to read
input[4:0]	WriteRegister,	// Address of register to write
input		RegWrite,	// Enable writing of register when High
input		Clk		// Clock (Positive Edge Triggered)
);

    wire[31:0] register[31:0];
    wire[31:0] decode;

    decoder1to32 decoder0(decode, RegWrite, WriteRegister);
    register32zero reg0(register[0], WriteData, decode[0], Clk);
    genvar i;
    generate
        for (i=1;i<=31;i=i+1)
        begin:genblock
            register32 regi(register[i],
                            WriteData,
                            decode[i], Clk);
        end
    endgenerate

    mux32to1by32 mux1(ReadData1, ReadRegister1,
                      register[0],
                      register[1],
                      register[2],
                      register[3],
                      register[4],
                      register[5],
                      register[6],
                      register[7],
                      register[8],
                      register[9],
                      register[10],
                      register[11],
                      register[12],
                      register[13],
                      register[14],
                      register[15],
                      register[16],
                      register[17],
                      register[18],
                      register[19],
                      register[20],
                      register[21],
                      register[22],
                      register[23],
                      register[24],
                      register[25],
                      register[26],
                      register[27],
                      register[28],
                      register[29],
                      register[30],
                      register[31]);
    mux32to1by32 mux2(ReadData2, ReadRegister2,
                      register[0],
                      register[1],
                      register[2],
                      register[3],
                      register[4],
                      register[5],
                      register[6],
                      register[7],
                      register[8],
                      register[9],
                      register[10],
                      register[11],
                      register[12],
                      register[13],
                      register[14],
                      register[15],
                      register[16],
                      register[17],
                      register[18],
                      register[19],
                      register[20],
                      register[21],
                      register[22],
                      register[23],
                      register[24],
                      register[25],
                      register[26],
                      register[27],
                      register[28],
                      register[29],
                      register[30],
                      register[31]);
endmodule
