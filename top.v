module top ( // Implement top level module
    input [6:0] sw,
    output [1:0] led
    
    );
     
     wire banana;
      circuit_a circuia(
          .A(sw[0]),
          .B(sw[1]),
          .C(sw[2]),
          .D(sw[3]),
          .Y(banana)
      );
      
      circuit_b circuib(
          .A(banana),
          .B(sw[4]),
          .C(sw[5]),
          .D(sw[6]),
          .Y(led[1])
      );
      
 assign  led[0] = banana;
      
endmodule