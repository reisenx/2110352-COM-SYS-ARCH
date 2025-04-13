#ifndef CACHESIM_H_INCLUDED
#define CACHESIM_H_INCLUDED

#define MAX_BLOCK_SIZE 128

typedef unsigned char Byte;
typedef enum { LRU, RR } Replacement;

typedef struct {
    int valid;
    unsigned long tag;
    int age;       // For LRU
    int rr_ptr;    // For RR (used at set level)
    Byte data[MAX_BLOCK_SIZE];
} CacheLine;

typedef struct {
    CacheLine* lines;
} CacheSet;

extern int CACHE_SIZE;
extern int BLOCK_SIZE;
extern int ASSOCIATIVITY;
extern int NUM_SETS;
extern int OFFSETLEN;
extern int SETLEN;
extern Replacement REPLACEMENT_POLICY;

extern CacheSet* cache;
extern long HIT;
extern long MISS;

void initCache(int cacheKB, int blockSize, int associativity, Replacement policy);
void accessCache(unsigned long addr);
int log2int(int x);

#endif
