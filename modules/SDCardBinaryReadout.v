`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////
// Module Name: Secure Digital Card Binary Readout
//
// Description: Top level module that contains all other individual modules for
//              synthesis.
////////////////////////////////////////////////////////////////////////////////


module SDCardBinaryReadout(
    // Inputs
    input cmosClock,
    // Outputs
    output reg [3:0] sevenSegmentEnable,
    output reg [7:0] sevenSegmentData
    );

    // Module wiring
    wire sevenSegClock;
    wire [17:0] sevenSegClockDividerCounter;
    wire [1:0] sevenSegCounter;

    // Module instantiation
    SevenSegClockDivider sevenSegClockDivider(
        cmosClock,
        sevenSegClock,
        sevenSegClockDividerCounter,
        sevenSegClock,
        sevenSegClockDividerCounter
    );
    Counter2Bit counter2Bit(sevenSegClock, sevenSegCounter, sevenSegCounter);

    always @(*) begin
        
    end
endmodule
