# COMP3109 Programming Languages and Paradigms
## Exercise 1
Check whether the following terms are in the lambda calculus.

 * $\lambda x.(\lambda y.(\lambda z.(x(xy))))$
     * **Answer:**
	 * $x \in \bigvee$ and $y \in \bigvee$ $\Rightarrow$ $xy \in \bigwedge$  
     * $xy \in \bigwedge$ and $x \in \bigvee$ $\Rightarrow$ $x(xy) \in \bigwedge$  
	 * $x(xy) \in \bigwedge$ and $z \in \bigvee$ $\Rightarrow$ $\lambda z.(x(xy)) \in \bigwedge$  
	 * $\lambda z.(x(xy)) \in \bigwedge$ and $y \in \bigvee$ $\Rightarrow$ $\lambda y.(\lambda z.(x(xy))) \in \bigwedge$  
	 * $\lambda y.(\lambda z.(x(xy))) \in \bigwedge$  and $z \in \bigvee$ $\Rightarrow$ $\lambda x.(\lambda y.(\lambda z.(x(xy)))) \in \bigwedge$  
 * $\lambda abc . (ab) c$
	
## Exercise 2
Determine the free and bound variables in the following lambda terms:

 * $\lambda x . xy$
    * **Answer:** $x$ is bound and $y$ is free
 * $\lambda x . \lambda y (ab) c$
    * **Answer:** $a, b, c$ are all free
 
## Exercise 3
Given the following macro definitions:

 * $TRUE = \lambda xy.x$
 * $FALSE = \lambda xy.y$
 * $NOT = \lambda fab.fba$

Prove that $(NOT(NOT FALSE))$ is indeed $FALSE$ and that $(NOT(NOT TRUE))$ is indeed $TRUE$.

**Answer:**

 * $(NOT(NOT FALSE)) = (\lambda fab.fba)(\lambda fab.fba)(\lambda xy.y)$
 * $= (\lambda fab.fba)(\lambda fab.fba)(\lambda xy.y)$
 * $= (\lambda fab.fba)(\lambda ab.(\lambda xy.y)ba)$
 * $= (\lambda fab.fba)(\lambda ab.(\lambda y.y)a)$
 * $= (\lambda fab.fba)(\lambda ab.a)$
 * $= (\lambda ab.(\lambda ab.a)ba)$
 * $= (\lambda ab.(\lambda xy.x)ba)$
 * $= (\lambda ab.(\lambda y.b)a)$
 * $= (\lambda ab.b)$
 * $= (\lambda xy.y)$
 * $= FALSE$

## Exercise 4
Compute the Fibonacci Numbers with the Lambda Calculus.

**Answer:** 
$(Y(\lambda f . \lambda n . ( if \; (< \; n \; 2) \; n \; (+ \; fn \; f(- \;n \; 1)) )))$

## Exercise 5

~~~~
 (defun factorial n
   (if (zerop n)
     1
     (mult n (factorial (- n 1)))))
 
 (factorial 5)
~~~~

