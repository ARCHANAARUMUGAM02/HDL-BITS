module top_module (
    input a, b, c, d,
    output out1, out2
);
    // Correct positional port mapping
   mod_a inst (.out1(out1), .out2(out2), .in1(a), .in2(b), .in3(c), .in4(d));

endmodule
