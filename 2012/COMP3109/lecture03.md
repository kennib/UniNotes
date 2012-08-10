# COMP3109 Programming Languages and Paradigms
## LISP Lists
LISP is based on lists.
The lists are binary tree like structures.
Each cell has a left reference (known as car) for the content which is another list or an atom
and a right reference (known as car) pointing to the next item.
Both references can point to `nil`.

In LISP functions are represented as lists as well.
This is known as being homo-iconographic.

### Recursive Definition
 1. `nil` is a list
 2. if `x` is and atom and `l` is a list then `cons(x, l)` is a list
 3. if `l1` and `l2` are lists then `cons(l1, l2)` is a list
 4. nothing else is a list

### List Construction
In LISP `(cons <car> <cdr>)` creates a cell as well as the short form `'(<car> . <cdr>)`.
If cdr points to another cell then we have a list.
Lists can be created by the `list` function. e.g. `(list 'a 'b 'c 'd)`.

### List Access
To access the first element use the `first` function or the `car` function.
Similarly we can access the rest of the list using `cdr` and `rest`.

We can also access the nth item in a list using the function `nth`.
e.g. `(nth <n> <list>)` will access the nth item of a list.

## Associative lists
Associative lists are represented in LISP by having a list of key/value pairs.

`((<k1> . <v1>) (<k2 . <v2>) ... (<kn> . <vn>))`

We can retrieve the key/value pair using `(assoc <key> <alist>)`.

## LISP Equality
 * `(eq 'x 'x)` is to check for two items having the same reference
 * `(eql x x)` is to check if two strings or numbers are equivalent
 * `(= x x)` is to check for numerical equality
 * `(equal x x)` is to check for structural equality, the lists have the same structure at the atoms are equal

~~~~
 (defun myequal (list1 list2)
   (if (and (listp list1) (listp list2))
     (if (and (atomp (car list1)) (atomp (car list2)) )
       (eql (car list1) (car list2))
       (if (and (myeql (first list1)) (myeql (first list2)))
         (myeql (rest list1) (rest list2))
         nil
       )
       nil
     )
     nil
   )
 )
~~~~

## LISP Function Application
Using the function `apply` we can perform a $\beta$-reduction on a list with symbolised arguments.

### Evaluation Order
Applicative Order
  ~ Evaluate arguments first then apply function to evaluated arguments

Normal Order (Lazy Evaluation)
  ~ Expand out function definition first
  ~ Will terminate without evaluating all arguments if the arguments are not used


