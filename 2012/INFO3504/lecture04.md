# INFO3504 Databases II
## Hash Indexes
Hash based indices are not good for ranged values since each value is randomised by any ideal hash function.
Hash indexing is also not useful for pattern matching searches.
Hash indexing only works efficiently for an exact key.

### Static Hashing
The hash function maps the items to hashes and then divides the items into buckets based on these hashes.

If the bucket is filled then the buckets are 'chained'.
This means that we must traverse a linked list after finding the hash value and checking the bucket.
This is expensive in terms of time complexity but there are solutions.

### Extendible Hashing
Extending the hash map when overflows occur by doubling is inefficient because read/write operations are expensive.
The trick is to just split the bucket that overflowed and only doubling the size of the directory to the buckets and not the buckets themselves.

Extendible hashing uses the least significant bits of the hash value to map items to buckets.
This means when the directory size is doubled the old items stay in the same space.

The directory can double when any given bucket overflows.
Thus when a directory is doubled the pointers it has are duplicated.

The overflowing bucket is split by pointing the new directory to a new bucket.
Each item in the overflowing bucket is re-hashed and placed in the new bucket if its hash leads to the new bucket.

### Linear Hashing
Linear Hashing is another dynamic hashing alternative.
It splits each bucket by a round robin on each insert.

A split bucket is rearranged to place values in the proper new bucket in memory.
To insert into the bucket another larger hash is computed to decided which split to place it into.

Linear hashing is essential the same idea as extendible hashing without a directory being used.

## Bitmap Indexes
Bitmap indexes are useful for when we have a column which has a limited range of values.
Use a set of bits each mapping to whether or not the record has a value this is called a bitmap vector.
This bitmap vector provides a list which maps directly to which rows have a certain attribute.

This type of index does not work very well when data is changed, reordered or deleted.

The bitmap vector is very compressible and its often stored on disk compressed and used uncompressed in memory.

The bitmap index is useful for join SQL queries.

