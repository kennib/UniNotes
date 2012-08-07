# INFO3504 Databases II
## Disk Storage
Main Memory

 * Easy and quick access
 * Expensive
 * Volatile

Hard Drives

 * Magnetic read/write
 * Persistent storage
 * Slow compared to main memory

Tapes

 * Very permanent storage
 * Only sequential access

Solid State Drives

 * $\mu$s write time
 * 1ms erase time
 * Expensive

The implications for DBMS design is that we typically transfer data to and from main memory to disk.
These operations are expensive which affects where how and when data is stored.

The lowest layer of DBMS software manages space on disk.
Database is partitioned into fixed length storage units known as pages.
Pages are used both as storage and access units.

Higher levels of the DBMS do not need to know how pages are allocated or managed.

## Disk Storage Management
### Case Study: Oracle

Tablespaces
  ~ The logical DBMS 'file'
  ~ Consists of several physical files and may span several disks

Data Segments
  ~ Tablespaces consist of several data segments
  ~ Tables, indexes, ...

Extents
  ~ Extents are units of disk space allocation

## Buffer Management
### The Buffer Manager
Hard drive read/write operations are slow.
Thus the results of certain operations are stored in a buffer.

The DBMS calls the buffer manager when it needs a page from disk

If the requested page is not in the buffer

 1. The buffer manager chooses an empty frame if possible
 2. If all frames are used it chooses a frame for replacement
     - frame must not be pinned
     - if the thrown out page was modified then it is written back to disk
 3. Once a frame is allocated the buffer manager reads the page from disk

If the page is in the buffer then the buffer manager will

 1. Pin the page in the frame
 2. Return the address of the page in memory

### Prefetching
If a request can be predicted (e.g. sequential scans) pages can be pre-fetched several pages ata a time.
This means operations are done in large blocks of pages rather than a page at a time.


