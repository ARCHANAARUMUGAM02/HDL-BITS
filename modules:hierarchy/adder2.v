module add1 (
    input  a,
    input  b,
    input  cin,
    output sum,
    output cout
);
    assign sum  = a ^ b ^ cin;
    assign cout = (a & b) | (a & cin) | (b & cin);
endmodule


// Top 32-bit Adder using two add16 modules
module top_module (
    input  [31:0] a,
    input  [31:0] b,
    output [31:0] sum
);

    wire carry16;

    // Lower 16 bits
    add16 u0 (
        .a    (a[15:0]),
        .b    (b[15:0]),
        .cin  (1'b0),      // no external cin
        .sum  (sum[15:0]),
        .cout (carry16)
    );

    // Upper 16 bits
    add16 u1 (
        .a    (a[31:16]),
        .b    (b[31:16]),
        .cin  (carry16),   // chain carry
        .sum  (sum[31:16]),
        .cout ()           // final cout ignored
    );

endmodule
