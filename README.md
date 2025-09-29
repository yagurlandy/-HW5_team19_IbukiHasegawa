# Lab 05 – Combinatorial Logic 

Ibuki Hasegawa & Erandy Lopez-Martinez

## Summary  
In this lab, I learned how to derive and simplify logic expressions from truth tables, then implement them using both **minterms (SOP)** and **maxterms (POS)**. I also practiced verifying the correctness of these expressions and coding them in Verilog. Beyond coding, I gained an understanding of how the **top-level file** and the **constraints file** work together to connect the logical design to the physical FPGA hardware. This lab tied together theoretical digital logic design with practical FPGA implementation.  

---

## Question 1: Role of the Top-Level File  
The **top-level file** is the entry point of the design. It integrates the submodules and establishes how signals flow between them. In this lab, **Circuit A** and **Circuit B** were instantiated, with the output of Circuit A connected to the input of Circuit B. Additionally, FPGA hardware mapping was defined, with `sw[0..6]` assigned to input switches and `led[0..1]` assigned to output LEDs. Without the top-level file, the circuits would exist independently but would not interact with each other or the FPGA hardware.  

---

## Question 2: Function of the Constraints File  
The **constraints file (.xdc)** maps Verilog signals to the FPGA’s physical pins. For example, `sw[0]` in Verilog may correspond to pin `V17` on the Basys3 board. By uncommenting the correct lines, logical ports are tied to physical switches and LEDs. The file also specifies the I/O standard (e.g., `LVCMOS33`) so that voltage levels are compatible with the hardware. Without this file, the design might compile successfully, but the FPGA would not respond to switches or light up LEDs.  

---

## Question 3: Selection of Minterm and Maxterm  
Yes, the selection was correct for both circuits:  

- **Circuit A** used **maxterms (POS)**, simplifying to:  
Y = ~A & D

- **Circuit B** used **minterms (SOP)**, simplifying to:  
Y = A & B | B & ~D | ~C & ~D

Both circuits matched their truth tables and were implemented properly. If I had the choice, I would often prefer minterms (SOP) because Verilog naturally expresses logic as ORs of ANDs, making it easier to code. However, maxterms (POS) are equally valid and can sometimes yield simpler hardware.