#include<stdio.h>
int max1(int a, int b) {
    return (a > b) ? a : b;
}

int main() {
    int a = 1, b = 2;
    int result;
    for(int i = 0; i < 100000000; i++) {
        result = max(a,b);
    }
    printf("Result: %d\n", result);
    return 0;
}