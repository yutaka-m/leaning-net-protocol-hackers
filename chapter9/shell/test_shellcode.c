#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/mman.h>
#include <sys/stat.h>
#include <unistd.h>

typedef int (*exec_code_t)(void);

int main(int argc, char** argv) {
    if (argc < 2) {
        printf("Usage: test?shellcode shellcode.bin\n");
        exit(1);
    }

    int fd = open(argv[1], O_RDONLY);
    if (fd <= 0) {
        perror("open");
        exit(1);
    }

    struct stat st;
    if (fstat(fd, &st) == -1) {
        perror("stat");
        exit(1);
    }

    exec_code_t shell = mmap(NULL, st.st_size,
                            PROT_EXEC | PROT_READ, MAP_PRIVATE, fd, 0);

    if (shell == MAP_FAILED) {
        perror("mmap");
        exit(1);
    }

    printf("Mapped Address: %p\n", shell);
    printf("Shell Result: %d\n", shell());
    return 0;
}