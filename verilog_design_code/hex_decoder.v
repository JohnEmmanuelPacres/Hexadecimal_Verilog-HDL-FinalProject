// Structural and Dataflow Modeling

module hex_decoder (
    input [3:0] bin_in,
    input reset,
    output [6:0] seg_tens,
    output [6:0] seg_ones
);

    wire [6:0] logic_tens;
    wire [6:0] logic_ones;

    // Instantiate the behavioral decoder
    hex_to_7seg_logic decoder_inst (
        .bin(bin_in),
        .tens(logic_tens),
        .ones(logic_ones)
    );

    // Apply the reset condition
    assign seg_tens = reset ? 7'b0000000 : logic_tens;
    assign seg_ones = reset ? 7'b0000000 : logic_ones;

endmodule

// Behavioral Modeling
module hex_to_7seg_logic (
    input [3:0] bin,
    output reg [6:0] tens,
    output reg [6:0] ones
);

    wire A = bin[3];
    wire B = bin[2];
    wire C = bin[1];
    wire D = bin[0];

    // Segment order is {g, f, e, d, c, b, a}
    // 1 = ON, 0 = OFF (Common Cathode)
    always @(*) begin
        // Segment tens
        tens[0] = ~A | (~B & ~C) | (B & C) | ~D;     // a
        tens[1] = ~A | (~B & ~D) | (~C & D);         // b
        tens[2] = ~A | ~B | (~C & D);                // c
        tens[3] = ~A | (~B & D) | (B & ~D) | ~C;     // d
        tens[4] = 1'b1;                              // e
        tens[5] = ~A | ~B | C | ~D;                  // f
        tens[6] = (A & B & D) | (A & C);             // g

        // Segment ones
        ones[0] = (~B & ~D) | (~A & C) | (B & C) | (A & ~D) | (~A & B & D) | (A & ~B & ~C); // a
        ones[1] = (~B & ~D) | (~B & ~C) | (~A & C & D) | (~A & ~C & ~D) | (A & ~C & D);     // b
        ones[2] = (~A & B) | (A & ~B) | (~C & D) | (~B & ~C) | (~A & C & D);                // c
        ones[3] = (~A & C & ~D) | (A & ~C) | (~B & ~C & ~D) | (~B & C & D) | (B & ~C & D) | (B & C & ~D); // d
        ones[4] = (A & B) | (A & C) | (~B & ~D) | (C & ~D);                                 // e
        ones[5] = (~A & B & ~C) | (A & ~B) | (A & C) | (B & ~D) | (~C & ~D);                // f
        ones[6] = (~A & B & ~C) | (A & ~B) | (A & D) | (~B & C) | (C & ~D);                 // g
    end
endmodule
