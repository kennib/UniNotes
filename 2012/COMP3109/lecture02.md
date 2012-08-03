# COMP3109 Programming Languages and Paradigms

## The Turing Machine
There is a tape of infinite length which stores the "state" of the program arranged in cells.
The machine uses the state of the tape to perform certain functions.
The functions compute in an imperative manner, moving to other cells and changing the values on the tape.

Modern computers are built from this model.
An imperative computer program can be thought of as a state diagram representing the machine.
The memory is like a finite version of the Turing Machine's infinite tape.

## Lambda Calculus
Church's lambda calculus.

Expressions in Lambda Calculus have three building blocks

 - Anonymous functions (function abstraction)
	+ For example $f(x) = x$ is written $\lambda x . x.$
	+ $\lambda x . M[X]$ this represents $f : x \rightarrow X$
	+ The period separates the parameters from the function body

 - Function applications
	+ $F A$ denotes the application of the function $F$ to $A$
	+ $(\lambda x . M[x]) N$ is $M[x := N]$ where $[x := N]$ denotes a substitution of $x$ for $N$
	+ This is also known as $\Beta$-reduction

 - Variables
	+ Variables in lambda calculus can be bound or unbound/free
	+ Abstraction (function parameters) bind variables
	    - e.g. $(\lambda x . z)$ binds $x$ but not $z$

### Reduction
There are three types of reduction used in Lambda Calculus to evaluate an expression.

 - $\beta$-reduction is function application.
    - $(\lambda x . M[x])N$ is $M[x := N]$
 - $\alpha$-reduction is renaming. It is used to avoid variable conflict.
    - $(\lambda x . M[x])N$ is $(\lambda y . M[y])N$
 - $\eta$-reduction is simplification.
    - $(\lambda x . (fx) )$ is $f$

### Evaluation
A functional program is an expression $E$.  
$E$ represents the program's input and output.

Each step of evaluation is performed by rewriting $E$ through reductions.  
Reductions replace a subexpression $P$ of the expression $E$ with $P'$.  

Schematic representation:

 - $E[P] \Rightarrow E[P']$
     - where $P \Rightarrow P'$ hold according to rewrite rules.

Reductions are repeated until no further reductions are applicable. The resultant form $E*$ is called Normal Form.

For example, take the algebraic expression $(1+2) \times (3+2)$.  
We have the following rewrite rules:

 - $a + b \Rightarrow c$ where $c$ is the result of addition of $a+b$ 
 - $a \times b \Rightarrow c$ where $c$ is the result of multiplication of $a+b$

Reductions into Normal Form:

 Step            E               P       P'
------ ---------------------- -------  ------
  1     $(1+2) \times (3+2)$   $1+2$      3
  2         $3 \times (3+2)$   $3+2$      5
  3         $3 \times 5$       $3*5$     15

Notice that in this case steps 1 and 2 can be rearranged without modifying the result of the evaluation.

### Currying
To expression functions with more than one parameter in lambda calculus we use *currying*.
Essentially we use multiple nested function abstractions to bound the variables.
For example, using Lambda Calculus plus arithmetic:

 - Average two numbers: $f(x,y) = (x+y)/2$
 - Lambda Calculus: $(\lambda x . (\lambda y . x + y) / 2)$ 
    - $((\lambda x . (\lambda y . x + y) / 2) 5 \;\; 7)$
        - Using the numbers 5 and 7
    - $(\lambda x . (5 + y)/2)$
         - The function is *partially evaluated*
    - $((5 + 7)/2)$
         - The next function is evaluated
    - $6$
         - The math is evaluated

Notice there are many parenthesis in evaluation of lambda calculus.
We can drop these parentheses.
We can also omit $\lambda$s when we have a series of function abstractions.

### Untyped Lambda Calculus
Lambda Calculus does not have primitives.

- No numbers
 - No arithmetic operators
 - No aggregated data structures (structs, classes, etc)
 - No control flow structures (only recursion!)

However, Lambda Calculus is computationally equivalent to a Turing Machine!

How can we present data types? Data types can only be express via functions.

### Defining Constants and Logic
Constants and logic are created by manipulating functions rather than by manipulating data

 - Boolean constants
     - TRUE: $(\lambda x . (\lambda y . x))$
     - FALSE: $(\lambda x . (\lambda y . y))$
 
 - Conditional function
     - IF: $(\lambda f)$

 - Boolean logic
     - NOT: $(\lambda f.(\lambda x.(\lambda y.(f yx))))$
     - OR:  $(\lambda f gxy.(f x(gxy)))$
     - AND: $(\lambda f gxy.(f (gxy)y))$

We can prove that these functions represent these concepts by evaluating them.

### Defining the Natural Numbers
Natural numbers can be defined inductively:

 - Basic Clause: 0 is a number and is in the set
 - Inductive Clause: For any element $x$ in the natural numbers, $x + 1$ is an element of the natural numbers
 - Extremal Clause: Nothing is in the set of natural numbers unless it is obtained by the inductive clause and basis clause

Thus the natural numbers are defined in the following way:

 - ZERO: $(\lambda xy.(y))$
 - SUCC: $(\lambda xyz.y(xyz))$

All of the natural numbers can be represented from these two definitions.

 - ONE

    > = (SUCC ZERO)  
    > = $((\lambda xyz.y(xyz))(\lambda ab.(b)))$  
    > = $((\lambda yz.y((\lambda ab.b)yz)))$  
    > = $((\lambda yz.yz))$  

 - TWO

    > = (SUCC SUCC ZERO)  
    > = $\ldots$  



### Inductive Definition
Lambda expressions are elements of the set $\bigwedge$.  
Set $\bigvee = \{v_1, v_2, \cdots\}$ is the set of all variables.

The set $\bigwedge$ is defined recursively by the following rules.

 - if $x \in \bigvee$ the $x \in \bigwedge$
 - if $M \in \bigwedge$ and $N \in \bigwedge$ then $MN \in \bigwedge$
 - if $x \in \bigvee$ and $M \in \bigwedge$ then $(\lambda x . N) \in \bigwedge$


## Functional Programming
Functional programming reflects the elegance of mathematics.
This correspondence to mathematics helps to give it higher reliability.

The downside to functional languages is that they are slower than imperative languages.
This is due to functional languages being difficult to represent on a Turing machine.

Lambda calculus is used as the basis for functional languages such as Lisp, Scheme, FP, ML, Haskell and Miranda.

The key idea in functional programming is that functional language is that functions have no side effects.
Inputs map to output regardless of state.

The necessary features which are missing in some imperative languages:

 - 1st class and higher order functions
 - Serious polymorphism
 - Powerful list facilities
 - Recursion
 - Structured function returns
 - Fully generalised aggregates
 - Garbage collection


### Functional Programming Math
There is a function $f$.  
This function has a domain $X$ and a co-domain $Y$.  
$f : X \rightarrow Y$

This means that unlike in imperative programming a function will map an output to only one output, regardless of state.

### Functional Programming Logic
We have a set of rules that are evaluated in a recursive manner until no more evaluation can be done.
This is called Normal Form.

Normal Form is independent of the order of the evaluation of the subexpressions.
This is the advantage of FP over imperative languages.
It makes FP easy to evaluate expressions in parallel and easier to prove correct function output.

### Functional Programming in Practice
Expressions are compositions of functions.
Some languages use infix, others prefix or postfix notation.

Constants are consider functions that without a domain.

A simple functional program.

~~~
 append(append("a", "b"), "c")
 (if x (if y 1 2) 3)
~~~

An imperative equivalent of the above.

~~~
 "a".append("b").append("c")
 
 if x:
  if y:
    1
  else:
    2
 else:
  3
~~~

## LISP
LISP is used in COMP3109 due to the fact it is closest to Lambda Calculus because it is untyped unlike many modern FP languages.
