#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "CacheSim.h"

int CACHE_SIZE;
int BLOCK_SIZE;
int ASSOCIATIVITY;
int NUM_SETS;
int OFFSETLEN;
int SETLEN;
Replacement REPLACEMENT_POLICY;

CacheSet* cache;
long HIT = 0;
long MISS = 0;

int log2int(int x) {
    int r = 0;
    while (x >>= 1) r++;
    return r;
}

void initCache(int cacheKB, int blockSize, int associativity, Replacement policy) {
    CACHE_SIZE = cacheKB * 1024;
    BLOCK_SIZE = blockSize;
    ASSOCIATIVITY = associativity;
    REPLACEMENT_POLICY = policy;

    NUM_SETS = CACHE_SIZE / (BLOCK_SIZE * ASSOCIATIVITY);
    OFFSETLEN = log2int(BLOCK_SIZE);
    SETLEN = log2int(NUM_SETS);

    HIT = MISS = 0;

    cache = (CacheSet*)malloc(sizeof(CacheSet) * NUM_SETS);
    for (int i = 0; i < NUM_SETS; i++) {
        cache[i].lines = (CacheLine*)malloc(sizeof(CacheLine) * ASSOCIATIVITY);
        for (int j = 0; j < ASSOCIATIVITY; j++) {
            cache[i].lines[j].valid = 0;
            cache[i].lines[j].tag = 0;
            cache[i].lines[j].age = 0;
        }
        cache[i].lines[0].rr_ptr = 0;
    }
}

void calAddr(unsigned long addr, unsigned long* tag, unsigned long* setIdx) {
    *tag = addr >> (OFFSETLEN + SETLEN);
    *setIdx = (addr >> OFFSETLEN) & ((1 << SETLEN) - 1);
}

void accessCache(unsigned long addr) {
    unsigned long tag, setIdx;
    calAddr(addr, &tag, &setIdx);

    CacheSet* set = &cache[setIdx];
    int hit = 0;

    for (int i = 0; i < ASSOCIATIVITY; i++) {
        if (set->lines[i].valid && set->lines[i].tag == tag) {
            HIT++;
            hit = 1;
            if (REPLACEMENT_POLICY == LRU)
                set->lines[i].age = 0;
        } else if (REPLACEMENT_POLICY == LRU) {
            set->lines[i].age++;
        }
    }

    if (hit) return;

    MISS++;
    int repl_index = 0;

    if (REPLACEMENT_POLICY == RR) {
        repl_index = set->lines[0].rr_ptr;
        set->lines[0].rr_ptr = (set->lines[0].rr_ptr + 1) % ASSOCIATIVITY;
    } else if (REPLACEMENT_POLICY == LRU) {
        int max_age = -1;
        for (int i = 0; i < ASSOCIATIVITY; i++) {
            if (!set->lines[i].valid) {
                repl_index = i;
                break;
            }
            if (set->lines[i].age > max_age) {
                max_age = set->lines[i].age;
                repl_index = i;
            }
        }
    }

    set->lines[repl_index].valid = 1;
    set->lines[repl_index].tag = tag;
    set->lines[repl_index].age = 0;
}
