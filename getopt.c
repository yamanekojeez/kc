#include <stdio.h>
#include <unistd.h>

static void print_arg(int argc, char* argv[]) {
#if 0
    int i;
    for (i=0; i<argc; i++) {
        printf("argv[%d]=%s ", i, argv[i]);
    }
#endif
}

int main(int argc, char* argv[]) {
    int c;
    const char* optstring = "ab:" ; // optstringを定義します
    opterr = 0;                     // disable error log

    /* non-option or end of argument list or error('?')までloop */
    while((c=getopt(argc, argv, optstring)) != -1) {
        print_arg(argc, argv);
        printf("opt=%c ", c);
        if(c == 'a') {
            /* without option argument */
        } else if(c == 'b') {
            /* with option argument */
            printf("optarg=%s ", optarg);
        } else {
            printf("optopt=%c ", optopt);
            if(optopt == 'b') {
                /* no option argument */
            } else {
                /* unknown option character */
            }
            printf("\n");
            return -1; // error
        }
        printf("\n");
    }

    /* non-option or end of argument list */
    while(optind < argc) {
        print_arg(argc, argv);
        printf("non-opt=%s \n", argv[optind]);
        optind++;
    }
    return 0;
}
