#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "CacheSim.h"

int main(int argc, char* argv[]) {
    if (argc < 6) {
        fprintf(stderr, "Usage: %s <trace_file> <cache_kb> <block_size> <ways> <policy: LRU|RR>\n", argv[0]);
        return 1;
    }

    const char* trace_file = argv[1];
    int cache_kb = atoi(argv[2]);
    int block_size = atoi(argv[3]);
    int associativity = atoi(argv[4]);
    Replacement policy = (strcmp(argv[5], "LRU") == 0) ? LRU : RR;

    initCache(cache_kb, block_size, associativity, policy);

    FILE* input = fopen(trace_file, "r");
    if (!input) {
        perror("Error opening trace file");
        return 2;
    }

    char line[1024];
    unsigned long addr;
    while (fgets(line, sizeof(line), input)) {
        if (strncmp(line, "0x", 2) != 0) continue;  // Skip headers
        if (sscanf(line, "0x%lx", &addr) == 1) {
            accessCache(addr);
        }
    }
    fclose(input);

    printf("=== Simulation Results ===\n");
    printf("Cache Size  : %d KB\n", cache_kb);
    printf("Block Size  : %d Bytes\n", block_size);
    printf("Associativity: %d-way\n", associativity);
    printf("Policy      : %s\n", (policy == LRU ? "LRU" : "RR"));
    printf("HIT         : %ld\n", HIT);
    printf("MISS        : %ld\n", MISS);
    printf("Hit Rate    : %.2f%%\n", 100.0 * HIT / (HIT + MISS));

    return 0;
}
