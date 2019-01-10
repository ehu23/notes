# Verilog Info

## Basics:

- Similar to C (Operators: bitwise, arithmetic, comparison) Used to describe digital logic designs (synthesizable code) and model elements that interact with that design (behavioral/testbench code).

### Variables

Data types: (must be declared before used)

1. wire
    - models basic wire that holds transient values
    - only wires can be used on the LHS of continuous assign statement
    - input/output port signals default to wire
    - Ex: `wire s; assign s = a^b; //not in an always block, thus continuous`

2. reg
    - anything that stores a value
    - can appear in both combinational and sequential circuits
    - only regs can be used on the LHS of non-continuous assign statements (in always blocks, LHS of either = or <=)

Ex: `wire [3:0] a; //[MSB:LSB]

### Data Values

- Values: 1, 0, x or X (unknown), z or Z (high impedance)
- Format: (size in bits)'(radix/prefix)(value)
```
123 //default: decimal
'd123 //decimal
'h7B //hex
'o173 //octal
'b111_1011 //binary
```

### Operators

- Reduction: bitwise operation on a single operand and produces a one bit result.
    - Ex: &a, ~&a, |a, ~|a, ^a, ~^a. 
    - ^4'b1001 becomes 1'b0
- Shifting: Logical = <<, >>. Arithmetic = <<<, >>>.
- Concatenation: {a,b}
- Replication: {n{m}}
- Assignment: =(blocking), <= (non-blocking)
    - blocking assignment is immediate, happens first. For pure combinational logic in "always" block.
    - non-blocking assignment is deferred until all right hand sides habe been evaluted, closer to actual hardware register behavior. For sequential logic or sequential and combinational logic in the same "always" block.
    - Don't mix blocking and non-blocking in the same "always" block.
    - Note: in complex sequential circuit, use two always blocks, 1 for combinational circuit, 1 for state update.

### Modules

General Format Ex: 

```
module top(a, b, ci, si, co);
    
    // 1. Ports: input/output/inout
    input a, b, ci;
    output s, co;

    // 2. Signal declarations
    wire s;
    reg g, p, co;
    
    // 3. Concurrent logic blocks
    assign s = a^b^ci; // a. continuous assignment

    // b. always blocks (sequential or combinatory)
    always @* begin // @* is the sensitivity list
        g = a & b;
        p = a | b;
        co = g | (p & ci);
    end

    // c. initial blocks (used in behavioral modeling)
    // d. forever blocks (used in behavioral modeling)

    // 4. Instantiations of sub-modules

endmodule

```

#### Parameterized module:

Format: type #(params) name (ports);

Module Header to include Default Parameter: `module ALU #(parameter W=4) (a, b, f, z); //rest of module code here, which uses W like a constant`

Instantiate (use) the module: `ALU #(.W(16)) alu16 (.a(a), .b(b), .f(f), .z(z));


### Always Blocks

#### Sensitivity List

1. Level Sensitive: 
    - changes to any signals on the sensitivity list will invoke the always block
    - used in combinational circuirts
    - Ex: `always @(a or b) / always @\*`

2. Edge sensitive:
    - invoke always block on specified signal edges
    - used in sequential circuits
    - Ex: `always @(posedge clk or posedge reset)`

#### Case(switch), if/else, loops 

1. case is essentially switch. Ex: 

```
case (selected)
    val0: statements
    val1: statments
    default: statements
endcase
```

2. if/else is same as C syntactically. But, if you do not include else case, it is an **inferred latch**, meaning the circuit will just hold the most recent value.
3. Loops are same, except there is one called repeat, which is like: `repeat(n) {statements;}`

### Initial block

- this block starts execution at time 0. 
- "#n" - wait n time units
- "$finish" - stop simulation

Ex:
```
initial begin
    //initialize inputs
    clk = 0;
    rst = 0;
    // Wait 100 ns for global reset to finish
    #100;
    // Add stimulus here
    rst = 1;
    #20 rst = 0;
    // add verification routine here
    #1000 $finish;
end
```
