# INFO3504 Databases II
## Secondary Storage

Three main types of storage

Heap Storage
  ~ Place things wherever there is space on disk.
  ~ Slow to read since the things must be scanned.
  ~ Quick to write since we just place things wherever.
 
Sorted Storage
  ~ Things are sorted and ordered.
  ~ Things can be found using a binary search.
  ~ Costs more time when writing to disk or deleting from disk.
 
Indexed Storage
  ~ We store things in an unordered manner and keep an extra structure with information about the things.
  ~ Trade off space to cost less time to store and access things.

## Indices
An index consists of 

 * a location mechanism for directing the search
 * index entries containing data records or pointers to them
    if the actual records it is called an integrated index.

### Types of Index
There are several different types of indices.
These types are not necessarily mutually exclusive.

Primary Index
  ~ Defines the sequential order of the items in the database

Secondary Index
  ~ Doesn't define the sequential order of the items
  ~ Inside a secondary structure

Unique Index
  ~ No duplicate values

Clustered Index
  ~ The data records and index entries are ordered in the same way

Sparse Index
  ~ Indices only map to a subset of the data records

## Tree-Based Indices
### Binary Tree
The height of a binary tree index for $n$ items is $\log (n+1) -1$.

A binary tree is a main memory structure.
To make it suitable for secondary storage structure we store the nodes of the tree in secondary storage.
Each of these pieces of data have indexes themselves to make accessing them faster.

### B$^+$ Tree
The tree is kept balanced; this means that all paths from the root to a leaf node have the same length.
There are sibling pointers between leaf nodes
