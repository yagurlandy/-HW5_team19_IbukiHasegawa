module circuit_b(
   input A, B, C, D, // Declare inputs
    output Y // Declare Y output
);

   assign Y = ~D & ( B | ~C) | ( A & B );  // Enter logic equation here

endmodule
