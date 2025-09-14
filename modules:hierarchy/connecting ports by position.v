module top_module (
    input a,
    input b,
    input c,
    input d,
    output out1,
    output out2
);
    // Instantiate the given submodule
    mod_a instance1 (
        out1,   // connect to output out1
        out2,   // connect to output out2
        a,      // input a
        b,      // input b
        c,      // input c
        d       // input d
    );
endmodule
