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
 - $N(u)$ = neighbourhood of $u$, that is, the vertices connected to $u$ by an edge
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
 - $N^{out}(u)$ = out neighbourhood of $u$, the vertices $v$ where there is an arc $(u, v)$
 - $N^{in}(u)$ = in neighbourhood of $u$, the vertices $v$ where there is an arc $(v, u)$

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
### Breadth First Search
Starting at a given node (usually the root for a tree), each child node is compared to the goal.
Then for each node compared each child node is expanded and thus its children are compared to the goal.
This is repeated until the goal is reached.

### Depth First Search
Again starting from a given node (usually the root for a tree) the first child node is compared to the goal.
The given node's child is then compared to the goal.
This is repeated recursively until a node without any children is reached.
Once this occurs the node's ancestors are recursively checked for more children and then they are recursively expanded.

A DFS of a graph will form a collection of trees known as a forest.
An undirected graph is connected if and only if we end up with a single tree in the forest.

## Graph Representations
### Adjacency Matrix
An adjacency matrix is a $|V|$ by $|V|$ matrix $M$ where $M[i][j]$ represents the edge $(u_i, u_j)$.
For an unweighted graph if the edge $(u_i, u_j)$ exists then $M[i][j]$ is 1, if it does not exists it is 0.

An undirected graph is symmetric about the diagonal of the matrix.
For weighted graphs we can give the weight of edge $(u_i, u_j)$ by giving $M[i][j]$ the value of the edge weight.

An adjacency matrix takes $\Theta(|V|^2)$ space and takes $O(1)$ time to check if an edge exists.

### Adjacency List
For each vertex $v$ we have a list of all the vertices that form an edge with the vertex $v$.

An adjacency list takes up $\Theta(|E| + |V|)$ space and $O(min(N(u),) n(v))$ time to check if an edge $(u, v)$ exists.

## Graph Algorithms
### Cut Edges
A cut edge is one such that when the edge is removed from a connected subgraph the subgraph becomes unconnected.

### Cut Vertices
A cut vertex is an edge such that when the vertex is removed from a connected graph the graph becomes unconnected.
