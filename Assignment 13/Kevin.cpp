#define _CRT_SECURE_NO_WARNINGS
#include <stdlib.h>
#include <stdio.h>

int main(void) {
	printf("ENGR0012\nR04\nMandala 2 PM\nEvan White, Kevin Pietz, Eureka Zheng\n\n"); // header funciton


	FILE *fname;
	fname = fopen("1930_2001.csv","r"); // open file in read mode
	
	// Initialize variables and arrays
	int n=0;
	int firsttemps[365];
	int secondtemps[365];

	// loop to scan data set
	do {
		fscanf(fname, "%d,%d", &firsttemps[n], &secondtemps[n]);
		//printf("Scanned: 1930 = %d, 2001 = %d, n = %d \n", firsttemps[n], secondtemps[n],n);
		n++;
	} while (n<364);
	fclose(fname);

	// max 
	
	int max1 = firsttemps[1];
	int i1;
	for (i1 = 2; i1 <= 365; i1++) {
		if (max1 < firsttemps[i1])
			max1 = firsttemps[i1];
	}
	printf("The maximum temperature in 1930 was %d\n", max1);

	int max2 = secondtemps[1];
	int i2;
	for (i2 = 2; i2 <= 365; i2++) {
		if (max2 < secondtemps[i2])
			max2 = secondtemps[i2];
	}
	printf("The maximum temperature in 2001 was %d\n", max2);

	// min

	int min1 = firsttemps[0];
	int n1;
	for (n1 = 1; n1 < 364; n1++) {
		if (min1 > firsttemps[n1]) 
			min1 = firsttemps[n1];
	}
	printf("The minimum temperature in 1930 was %d\n", min1);
	
	int min2 = secondtemps[1];
	int n2;
	for (n2 = 1; n2 < 364; n2++) {
		if (min2 > secondtemps[n2])
			min2 = secondtemps[n2];
	}
	printf("The minimum temperature in 2001 was %d\n", min2);

	system("pause");
}