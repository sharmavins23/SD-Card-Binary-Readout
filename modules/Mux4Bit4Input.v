`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////
// Module Name: Multiplexer - 4 Bit, 4 Input
//
// Description: Selects between four individual input signals.
////////////////////////////////////////////////////////////////////////////////


module Mux4Bit4Input (
    // Inputs
    input [1:0] selector,
    input [3:0] nibbleA,
    input [3:0] nibbleB,
    input [3:0] nibbleC,
    input [3:0] nibbleD,
    // Outputs
    output reg [3:0] nibbleOut
    );

    always @(*) begin
        case(selector)
            2'b11: nibbleOut = nibbleA;
            2'b10: nibbleOut = nibbleB;
            2'b01: nibbleOut = nibbleC;
            2'b00: nibbleOut = nibbleD;
        endcase
    end
endmodule
