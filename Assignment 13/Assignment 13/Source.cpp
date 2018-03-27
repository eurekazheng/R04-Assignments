#define _CRT_SECURE_NO_WARNINGS
#include <stdlib.h>
#include <stdio.h>
#include <math.h>

int main(void) {
	printf("ENGR0012\nR04\nMandala 2 PM\nEvan White, Kevin Pietz, Eureka Zheng\n\n"); // header funciton

	FILE *fname;
	fname = fopen("1930_2001.csv","r");
	
	int n=0;
	int firsttemps[365];
	int secondtemps[365];
	
	do {
		fscanf(fname, "%d,%d", &firsttemps[n], &secondtemps[n]);
		n++;
	} while (n<364);
	fclose(fname);

	//finding the mean of each year
	float firstmean, secondmean,tempsum1=0,tempsum2=0;
	n = 0;
	while (n < 364) {
		tempsum1 += firsttemps[n];
		tempsum2 += secondtemps[n];
		n++;
	}
	firstmean = tempsum1 / n;
	secondmean = tempsum2 / n;
	printf("Mean in 1930: %.2f, Mean in 2001: %.2f\n\n", firstmean, secondmean);

	//finding the standard deviation of 1930
	float stdev1, stdev2,temp,stdsum;
	stdsum = 0;
	temp = 0;
	n = 0;
	while (n < 364) {
		temp = firsttemps[n] - firstmean;
		temp = pow(temp, 2);
		stdsum += temp;
		n++;
	}
	stdev1 = stdsum / 365;
	stdev1 = pow(stdev1, .5);
	
	//finding the standard deviation of 2001
	temp = 0;
	n = 0;
	stdsum = 0;
	while (n < 364) {
		temp = secondtemps[n] - secondmean;
		temp = pow(temp, 2);
		stdsum += temp;
		n++;
	}
	stdev2 = stdsum / 365;
	stdev2 = pow(stdev2, .5);
	
	//displaying results to screen
	printf("Standard Deviation in 1930: %.2f, Standard Deviation in 2001: %.2f\n\n", stdev1,stdev2);

	//min and max stuff
	//max

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



	//writing results to a dat file
	FILE *fname2;
	fname2 = fopen("results.dat", "w");
	fprintf(fname2,"Mean in 1930 = %.2f\nMean in 2001 = %.2f\nStandard Deviation in 1930: %.2f\nStandard Deviation in 2001: %.2f\n",firstmean,secondmean,stdev1,stdev2);
	fprintf(fname2, "Max in 1930 = %d\nMax in 2001 = %d\nMin in 1930 = %d\nMin in 2001 = %d", max1, max2, min1, min2);
	fclose(fname2);


	system("pause");
}