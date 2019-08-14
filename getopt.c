#include <stdio.h>
#include <unistd.h>

/* getopt関数の使用例 */
int main(int argc, char*argv[]) {
	int i;
	int aopt = 0;
	int bopt = 0;
	int copt = 0;
	int dopt = 0;
	char *cparam = NULL;
	char *dparam = NULL;
	int opt;
	while ((opt = getopt(argc, argv, "abc:d::")) != -1) {
		switch (opt) {
			case 'a':
				aopt = 1;
				break;
			case 'b':
				bopt = 1;
				break;
			case 'c':
				copt = 1;
				cparam = optarg;
				break;
			case 'd':
				dopt = 1;
				dparam = optarg;
				break;
			default:
				printf("Error! \'%c\' \'%c\'\n", opt, optopt);
				return 1;
		}
	}
	printf("a = %d\n", aopt);
	printf("b = %d\n", bopt);
	printf("c = %d, %s\n", copt, cparam);
	printf("d = %d, %s\n", dopt, dparam);
	for (i = optind; i < argc; i++) {
		printf("arg = %s\n", argv[i]);
	}
	return 0;
