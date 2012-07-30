# COMP2907 Algorithms and Complexity
## The Stable Matching Problem
### The Problem
Consider a set of $n$ men $m={m_1, m_2, m_3}$
and a set of $n$ women $w={w_1, w_2, w_3}$

Each man and woman has a ranking of each member of the opposite set.

A matching $M$ is defined as a one-to-one correspondence between a subset of men and women.

The aim is to produce a set of stable matchings.
A matching $M$ is stable if it has the following properties:

 * All men are matched
 * All women are matched
 * There is no case where $w' = M(m)$ and $w >_m w'$ and $m' = M(w)$ and $m >_w m'$.

That is, there is no case where a matching pair would both swap partners and there are no men or women without partners.

If such a matching exists where $m$ and $w$ prefer each other to their current partners we say that $(m, w)$ blocks $M$.

### The Algorithm
The algorithm is known as the Gale-Shapley algorithm.  

~~~~~
 Gale-Shapley(P)
 M <- empty matching
 while there is a free man in M
  m <- some free man
  w <- most desired woman that m has not proposed yet
  if w is free
   add (m,w) to M
  if w is not free, but prefers m to m'=M(w)
    remove (m', w) from M
    add (m,w) to M
return M
~~~~~

### The Proof
**Proposition:** Once a woman becomes engaged she is never free again.

Once a woman is proposed to she may only accept or reject men who propose to her.
Thus a woman can only **change** partners as the algorithm progresses.
A woman will only change partners if a more suitable man proposes, thus her partner increase as the algorithm progresses.

**Proposition:** Gale-Shapley always returns a stable matching.

Suppose GS returns a perfect matching $M$ and that $(m, w)$ blocks $M$ such that:

 * $m$ prefers $w$ to $w' = M(m)$
 * $w$ prefers $m$ to $m' = M(w)$

At some point before $m$ proposes to $w'$, $m$ must propose to $w$ since he prefers her.
If $w$ has no partner or has partner $m'$, she swaps partners to $m$ since she prefers $m$ to $m'$.
Now, since $w$ has $m$ as a partner, by the proposition above,
a man $m'$ that proposes must be more preferred than $m$ in order for $w$ to accept him.

This contradicts the definition $(m, w)$ as a blocking match.
Thus by contradiction we show that GS cannot have a match that blocks $M$.
Consequently GS always produces a stable matching.

### Running Time
Selecting a free man can be consider $O(n)$ if we iterate over a list to find the man.
In the worst case each of the $n$ free men will have to propose to all $n$ women on his preference list.
This means there are at most n^2 operations resulting in $O(n^2)$.

Thus the overall complexity is $O(n^3)$, but can be reduced to $O(n^2)$ by selecting more appropriate data structures.

### Additional Properties
 * Each man gets his best "stable partner" and each woman gets her worst "stable partner"
 
