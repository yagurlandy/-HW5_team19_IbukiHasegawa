# Lab 05 - Combinatorial Logic

In this lab, you’ve learned real world applications of digital logic, as well
as how to assemble your own Verilog modules. In addition, you’ve learned how
the constraints file maps your inputs and outputs to real pins on the FPGA.

summarry
Through this lab, I learned how to derive logic expressions from truth tables and design circuits using minterms (SOP) and maxterms (POS).
I also practiced verifying the resulting expressions and implementing them as code.
In addition, I understood that the top-level file plays a central role in connecting modules together and linking them to the actual switches and LEDs on the FPGA.
 

## Rubric

| Item | Description | Value |
| ---- | ----------- | ----- |
| Summary Answers | Your writings about what you learned in this lab. | 25% |
| Question 1 | Your answers to the question | 25% |
| Question 2 | Your answers to the question | 25% |
| Question 3 | Your answers to the question | 25% |

## Lab Questions

### 1 - Explain the role of the Top Level file.
The top-level file serves as the entry point of the entire design, bringing together and connecting the individual modules.
In this lab, Circuit A and Circuit B were instantiated, and the output of Circuit A was connected to the input A of Circuit B.
In addition, sw[0..6] were assigned as input switches, and led[0..1] were assigned as output LEDs.
With the top-level file, the FPGA switches and LEDs are correctly linked to the logical signals of the modules, allowing the entire design to function properly.


### 2 - Explain the function of the Constraints file.
The constraints file (constraints.xdc) maps the logical signals in Verilog to the actual pins on the FPGA. For example, sw[0] in Verilog must be tied to pin V17 on the Basys3 board. By uncommenting the correct lines in the XDC file, we ensure that the synthesis and implementation stages know which physical FPGA resources correspond to each port. It also sets the I/O standard (such as LVCMOS33), making sure the signal levels match the hardware. Without the constraints file, the design would compile but the FPGA would not respond to the switches or light up the LEDs correctly.


### 3 - Was the selection of Minterm and Maxterm correct for each circuit? What would you have chosen?

Yes, the selection was correct:
Circuit A was specified to be implemented using maxterms (POS). From the truth table, we saw that the simplified expression reduced to 
Y = ~A & D
Circuit B was specified to be implemented using minterms (SOP). After simplification, the final result was 
Y = A&B | B&~D  |  ~C & ~D
Both circuits were therefore implemented correctly according to the lab instructions.
If I had a free choice, I would often select minterms (SOP) for easier direct implementation, since Verilog naturally expresses logic as ORs of ANDs. However, using maxterms (POS) is equally valid and can sometimes result in simpler hardware depending on the truth table.
