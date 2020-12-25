# SD Card Binary Readout

This project reads the data from an SD card and outputs it in groups of 32 bits
to the Mimas A7 Artix 7's 7-segment display.

## Overview

## Seven Segment Display Subsystem

The seven segment display is expanded from the
[previous project](https://github.com/sharmavins23/Binary-Decoder) to include
16-bit hexadecimal displays, or span the entirety of the screen. As such, some
key changes are enabled.

A decoder is necessary to swap between the individual displays. This one-cold
decoder outputs the enable signals for the various segments, and works alongside
the multiplexer (now with four inputs instead of two) to write the proper data
in the proper location.

In the previous implementation, two displays were utilized with the output
switching at a rate of 95.367 Hz (using a division value of 20). Since this is
the switching frequency, the clock frequency is half this, thus generating a
clock signal of 47.684 Hz. The two displays were swapped individually, so one
would expect an output LED display frequency of 23.842 Hz. However, instead of
using a decoder to write the enable, the clock signal itself was used for the
enable (such that the rightmost segment was written on the negative edge of the
clock, and the other segment was written on the positive edge.) Now that signals
are only written on positive edges of the clock, the clock division calculation
needed modification.

In short, the switching frequency of the CMOS clock signal is changed from 100
MHz down to 381.470 Hz using a divider value of 18. This signal is halved to get
the output divided clock. This signal is quartered thanks to the two bit
counter, which also serves to generate the decoder input for the enable line
signal. This sets an output frequency for each individual segment of 47.684 Hz,
which is the same frequency utilized in the previous project's implementation.

## Helpful Links

Here are some helpful links that are useful to read up alongside the project.

-   [Wikipedia's article on Serial Peripheral Interfaces](https://en.wikipedia.org/wiki/Serial_Peripheral_Interface):
    A cursory detailing of the SPI protocol, including its implementation and
    operation.
-   [SD Card Info](http://chlazza.nfshost.com/sdcardinfo.html): A document by
    Chlazza detailing the entirety of the SD card protocol, including the
    relevant bit and command indices.
-   [FPGAForFun's SD Card Guide](https://www.fpga4fun.com/SD.html): A basic
    guide on interfacing with SD cards. Contains one basic implementation of the
    previous link, as well as a large amount of information on various FPGA
    projects.
