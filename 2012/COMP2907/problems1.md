# COMP2907 Algorithms and Complexity
## Problem 1
Sort the following functions in increasing order of asymptotic growth:

> $n^2, \log n, n^{(1/log n)}, 2^n, n^3, n log n, \sqrt{n}$

**Answer:** $2^n \succ n^3 \succ n^2 \succ n log n \succ \sqrt{n} \succ log n \succ n^{(1/log n)}$

## Problem 2
Given an array $A$ consisting of $n$ integers $A[0], A[1], A[2], \ldots, A[n-1]$, we want to compute the upper triangle matrix

> $C[i][j] = \frac{ A[i] + A[i+1] + \cdots + A[j]}{ j - i + 1 }$

for $0 \leq i \leq j < n$. Consider the following algorithm, `SUMMING-UP(A)`, for computing $C$:

~~~~ {#summingup .python .numberLines}
 for i=0,...,n-1
  for j=i,...,n-1
    add up entries A[i] through A[j] and divide by j-i+1
    store results in C[i][j]
 return C
~~~~

Prove the upper bound on the running of `SUMMING-UP`.

**Answer**: In `SUMMING-UP` there are two for loops which iterate over a triangle portion of an $n \times n$ matrix,
i.e., $\frac{n(n+1)}{2}$ iterations.
Thus we can state that there are at most $n^2$ iterations.

Each iteration loops through a varying sized section of the array which is of length $n$.
Thus each iteration is at most $O(n)$.

Therefore the running time is the product of the cost of each iteration and the number of iterations.
That is, the running time is $O(n \times n^2) = O(n^3)$

## Problem 3
Your task is to prove a lower bound on the running time of `SUMMING-UP`.

**Answer:** If $i<\frac{1}{4}n$ and $j>\frac{3}{4}n$ then during the iteration $j-i+1$ elements of the array are added.
This is at least $\frac{3}{4}n -\frac{1}{4}n + 1 = \frac{1}{2}n + 1$ elements.
Thus the operation is $\Omega(n)$.

There are $\frac{1}{4}n$ cases where $i<\frac{1}{4}n$ and $\frac{1}{4}n$ cases where $j>\frac{3}{4}n$.
This results in $\frac{1}{16}n^2$ $(i, j)$ pairs where $i<\frac{1}{4}n$ and $j>\frac{3}{4}n$.
Thus the number $(i, j)$ pairs is $\Omega(n^2)$.

Since there are $\Omega(n^2)$ $(i, j)$ pairs where $i<\frac{1}{4}n$ and $j>\frac{3}{4}n$
and each iteration of such a pair is $\Omega(n)$ then the algorithm as a whole is $\Omega(n^3)$.

## Problem 4
Come up with a more efficient algorithm for computing the above matrix
$C[i][j] = \frac{ A[i] + A[i+1] + \cdots + A[j]}{ j - i + 1 }$ for $0 \leq i \leq j < n$.
Your algorithm should run in $O(n^2)$ time.
Prove that this is optimal in the sense that any algorithm that performs the task must
take $\Omega(n^2)$ time.

**Answer:** Through each iteration the previous algorithm is summing ranges of the array that overlap.
This inefficiency can be fixed by using the previous summations to populate each entry.

~~~~ {.python .numberLines}
 for i=0,...,n-1
  store A[i] divided in C[i][i]
  for j=i+1,...,n-1
    multiply C[i][j-1] by (j-i) add A[j] and divide by (j-i+1)
    store results in C[i][j]
 return C
~~~~

Each iteration is $O(1)$ since we are only ever accessing a constant number of elements per iteration.
Since there are a maximum of $n^2$ iterations the entire algorithm is $O(n^2)$.
Since the matrix has $n^2$ elements and at least half must be filled to create the triangle matrix the task must take at least $\Omega(n^2)$.
This means that the algorithm above at $O(n^2)$ is optimal.

## Problem 5
Give a formal proof of the transitivity of the O-notation. That is, for
function $f$ , $g$, and $h$ show that if $f (n) = O(g(n))$ and $g(n) = O(h(n))$ then $f (n) =
O(h(n))$.


**Answer:** $g(n) = O(h(n))$ thus the order of both $g(n)$ and $h(n)$ are the same, i.e., $O(g(n)) = O(h(n)$.
Therefore $f(n) = O(g(n)) = O(h(n))$.

## Problem 6
There is a naive implementation of priority queue based on arrays where `insert(x)` takes $O(1)$ time, and `get_min()` takes $O(n$) time.
There is also another implementation based on heaps where both operations run in $O(\log n)$ time.
In each case $n$ the size of the queue at the time the operation is performed.

Suppose we have an algorithm that performs $X$ number of `insert()` operations and a $Y$ number of `get_min()` operations.
Suppose we only care about the time spent on priority queue operations.
When does it make sense to switch from a heap-based implementation to an array-based implementation?
Assume that all inserts are preformed before the get minimum operations.

**Answer:** Let $A(X,Y)$ and $H(X,Y)$ be the time complexity for running $X$ `insert()` operations and $Y$ `get_min()` operations
using an array based and a heap based implementation respectively.

Therefore $A(X,Y) = X + Yn$ and $H(X,Y) = (X+Y)(\log n)$ for $n > 0$

The point where one algorithm becomes starts to become more efficient than the other is when $A(X,Y) = H(X,Y)$.

That is, when $X+Yn = (X+Y)(\log n)$  
$\Rightarrow (1 + \log n)X = (n + \log n)Y$  
Thus when $X = \frac{n + \log n}{1 + \log n}Y$ or $Y = \frac{1 + \log n}{n + \log n}X$

Now, $A(X,Y)$ is more efficient in X than $H(X,Y)$ and $H(X,Y)$ is more efficient in Y than $A(X,Y)$.

Thus, 
$A(X,Y) < H(X,Y)$ when $X > \frac{n + \log n}{1 + \log n}Y$ or $Y < \frac{1 + \log n}{n + \log n}X$  
and conversely,  
$H(X,Y) < A(X,Y)$ when $X < \frac{n + \log n}{1 + \log n}Y$ or $Y > \frac{1 + \log n}{n + \log n}X$

## Problem 7
Your task is to implement two versions of the priority queue data structure.

1. Implement a priority queue data structure using arrays

    ~~~~ {.python .numberLines}
     # Priority Queue - Array Based
     array = []
    ~~~~

2. Implement a priority queue data structure using heaps

    ~~~~ {.python .numberLines}
     # Priority Queue - Heap Based
    ~~~~

## Problem 8 (Advanced)
Design an experiment to verify that the running time of heap sort is $\Omega (n \log n)$.

**Answer:** We can verify the minimum running time of a sorting algorithm by finding the case in with the least number of operations.
With a heap sort this occurs when the items to be sorted are already sorted.
This is the minimum case since no items need to be moved.

## Problem 9 (Advanced)
Come up with an implementation of the Gale-Shapley algorithm that runs in $O(n^2)$ time.

As shown in lectures the GS algorithm has $O(n^2)$ proposals by free men to women on their preference list.
If we use appropriate data structures that provide $O(1)$ access to free men we can have a GS algorithm that runs in $O(1)$ time.

The simplest way to be able to select free men in $O(1)$ time is to create a queue for them.
Every time a man successfully proposes to a woman he is dequeued.
Every time a woman rejects a man she was engaged to the man is placed at the back of the queue.
Since only free men exist in the queue we can simply get the man who is at the front of the queue.
The above operations are all $O(1)$, thus the process of a proposal can too be considered $O(1)$.

Since each proposal is $O(1)$ and there are at most $O(n^2)$ proposals this implementation of the  GS algorithm runs in $O(n^2)$


