// Sub-module using Behavioral Modeling
module hex_to_7seg_logic (
    input [3:0] bin,
    output reg [6:0] tens,
    output reg [6:0] ones
);

    // Segment order is {g, f, e, d, c, b, a}
    // 1 = ON, 0 = OFF (Common Cathode)
    always @(*) begin
        case(bin)
            // 0 to 9: Tens is '0', Ones counts up
            4'b0000: begin tens = 7'b0111111; ones = 7'b0111111; end // 0
            4'b0001: begin tens = 7'b0111111; ones = 7'b0000110; end // 1
            4'b0010: begin tens = 7'b0111111; ones = 7'b1011011; end // 2
            4'b0011: begin tens = 7'b0111111; ones = 7'b1001111; end // 3
            4'b0100: begin tens = 7'b0111111; ones = 7'b1100110; end // 4
            4'b0101: begin tens = 7'b0111111; ones = 7'b1101101; end // 5
            4'b0110: begin tens = 7'b0111111; ones = 7'b1111101; end // 6
            4'b0111: begin tens = 7'b0111111; ones = 7'b0000111; end // 7
            4'b1000: begin tens = 7'b0111111; ones = 7'b1111111; end // 8
            4'b1001: begin tens = 7'b0111111; ones = 7'b1101111; end // 9
            
            // 10 to 15 (A-F): Custom condition (AA, bb, CC...)
            4'b1010: begin tens = 7'b1110111; ones = 7'b1110111; end // A
            4'b1011: begin tens = 7'b1111100; ones = 7'b1111100; end // b
            4'b1100: begin tens = 7'b0111001; ones = 7'b0111001; end // C
            4'b1101: begin tens = 7'b1011110; ones = 7'b1011110; end // d
            4'b1110: begin tens = 7'b1111001; ones = 7'b1111001; end // E
            4'b1111: begin tens = 7'b1110001; ones = 7'b1110001; end // F
            
            // Safety default
            default: begin tens = 7'b0000000; ones = 7'b0000000; end 
        endcase
    end
endmodule