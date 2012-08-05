# COMP2907 Algorithms and Complexity
## Graphs
Graphs are used to model sets of relations amongst element in a set.
This is useful for representing:

 - Social Networks
 - Internet Topologies
 - Protein-Protein interaction
 - Dependencies

By representing problems in a graphical manner the solutions to certain problems become easier to formulate.
For example:

 - What's the distance between two nodes?
 - What's a central node?
 - How well connected is the network?
 - What's a critical node?

### Undirected Graphs
Undirected graphs are graphs in which edges between vertices have no direction.
Thus for two vertices $u,v$ the edge between them is the same edge going either way, i.e., $(u, v) = (v, u)$.

Let $G=(V,E) be an undirected graph:

 - $V$ = set of vertices (a.k.a. nodes)
 - $E$ = set of edges

Notations:

 - $deg(u)$ = number of edges connected to the vertex $u$
 - $deg(G)$ = the maximum degree of $deg(v)$ for all $v$ in $V$
 - $N(u)$ = neighbourhood of $u$
 - $n$ = $|V|$, i.e., the number of vertices
 - $m$ = $|E|$, i.e., the number of edges

### Directed Graphs
Directed graphs are graphs in which edges between vertices do have a direction.
Thus for two vertices $u,v$ the edge between them is not the same edge going either way, i.e., $(u, v) \neq (v, u)$.

Let $G=(V,E) be an undirected graph:

 - $V$ = set of vertices (a.k.a. nodes)
 - $E$ = set of edges (a.k.a. arcs)

Notations:

 - $out-deg(u)$ = number of arcs out from a vertex $u$ i.e., number of arcs $(u, *)$ where $*$ is any adjoining vertex
 - $in-deg(u)$ = number of arcs into a vertex $u$ i.e., number of arcs $(*, u)$ where $*$ is any adjoining vertex
 - $N^{out}(u)$ = out neighbourhood of $u$
 - $N^{in}(u)$ = in neighbourhood of $u$

## Graph Connectivity
### Graph Paths
A path is a series of edges with each adjacent edge in the series sharing a common vertex.

That is, if we let $G=(V,E)$ be an undirected graph:

 - A sequence $v_1, v_2, \ldots, v_k$ is a path if $(v_i, v_{i+1})$ is an edge in $E$ for all $i=1,\ldots,k$
 - The *length* of this path is the number of edges it has (edges are counted again if repeated)
 - A path is referred to as *simple* if no vertices are repeated
 - A *cycle* is a path $v_1, v_2, \ldots, v_k$ where $v_1 = v_k$
     - That is, a cycle is a path that loops back to its beginning
 - A cycle is simple if the path it consists of is a simple path
 - The graph $G$ is *connected* if every vertex has a path to every other vertex.

### Trees
A tree is a graph that contains no cycles.
This can be considered equivalent to the graph being connected and having one less edge than vertices.

That is, if we let $G=(V,E)$ then $G$ is a tree if $G$ is connected and $|E|=|V|-1$.

## Exploring Graphs
