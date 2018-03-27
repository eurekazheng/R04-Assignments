#define _CRT_SECURE_NO_WARNINGS
#include <stdlib.h>
#include <stdio.h>

int main(void) {
	FILE *fname;
	fname = fopen("1930_2001.csv","r");
	int n=0;
	int firsttemps[365];
	int secondtemps[365];
	int alltemps[365][2];
	do {
		fscanf(fname, "%d,%d", &alltemps[n][1], &alltemps[n][2]);
		fscanf(fname, "%d,%d", &firsttemps[n], &secondtemps[n]);
		printf("Scanned: 1930 = %d, 2001 = %d, n = %d \n", firsttemps[n], secondtemps[n],n);
		n++;
	} while (n<364);
	fclose(fname);
	system("pause");
}