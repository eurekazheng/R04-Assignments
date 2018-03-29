#define _CRT_SECURE_NO_WARNINGS
#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#include <string.h>

/*
Kevin Pietz, Eureka Zheng, Evan White
Engineering 0012 T/Th 2:00-4:00
Instructor: Mandala
Date: 3/29/2018

Homework 13
Analysis of Temperature Data Stored in a 2 Column .csv file
*/



//function for finding month of an inputted day (input #/365, output #/12)
int datemonth(int n) {
	int month;
	if (n <= 31) {
		month = 1;
	}
	else if (n > 31 && n <= 59) {
		month = 2;
	}
	else if (n > 59 && n <= 90) {
		month = 3;
	}
	else if (n > 90 && n <= 120) {
		month = 4;
	}
	else if (n > 120 && n <= 151) {
		month = 5;
	}
	else if (n > 151 && n <= 181) {
		month = 6;
	}
	else if (n > 181 && n <= 212) {
		month = 7;
	}
	else if (n > 212 && n <= 243) {
		month = 8;
	}
	else if (n > 243 && n <= 273) {
		month = 9;
	}
	else if (n > 273 && n <= 304) {
		month = 10;
	}
	else if (n > 304 && n <= 334) {
		month = 11;
	}
	else if (n > 334 && n <= 365) {
		month = 12;
	}
	return(month);
}

//function for finding day of an inputted day (from #/365 to # within a month)
int dateday(int n) {
	int day;
	if (n <= 31) {
		day = n;
	}
	else if (n > 31 && n <= 59) {
		day = n - 31;
	}
	else if (n > 59 && n <= 90) {
		day = n - 59;
	}
	else if (n > 90 && n <= 120) {
		day = n - 90;
	}
	else if (n > 120 && n <= 151) {
		day = n - 120;
	}
	else if (n > 151 && n <= 181) {
		day = n - 151;
	}
	else if (n > 181 && n <= 212) {
		day = n - 181;
	}
	else if (n > 212 && n <= 243) {
		day = n - 212;
	}
	else if (n > 243 && n <= 273) {
		day = n - 243;
	}
	else if (n > 273 && n <= 304) {
		day = n - 273;
	}
	else if (n > 304 && n <= 334) {
		day = n - 304;
	}
	else if (n > 334 && n <= 365) {
		day = n - 334;
	}
	return(day);
}


int main(void) {
	printf("ENGR0012\nR04\nMandala 2 PM\nEvan White, Kevin Pietz, Eureka Zheng\n\n"); // displaying header
	
	FILE *fname;
	fname = fopen("1930_2001.csv","r");
	
	int n=0;
	int firsttemps[365];
	int secondtemps[365];
	
	do {
		fscanf(fname, "%d,%d", &firsttemps[n], &secondtemps[n]);
		n++;
	} while (n<=364);
	fclose(fname);
	
	//finding the mean of each year
	float firstmean, secondmean,tempsum1=0,tempsum2=0;
	n = 0;
	while (n <= 364) {
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
	while (n <= 364) {
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
	while (n <= 364) {
		temp = secondtemps[n] - secondmean;
		temp = pow(temp, 2);
		stdsum += temp;
		n++;
	}
	stdev2 = stdsum / 365;
	stdev2 = pow(stdev2, .5);
	
	//displaying results to screen
	printf("Standard Deviation in 1930: %.2f, Standard Deviation in 2001: %.2f\n\n\n", stdev1,stdev2);

	//min and max stuff
	//max
	int max1day, max2day, min1day, min2day;

	int max1 = firsttemps[0];
	int i1;
	for (i1 = 1; i1 <= 364; i1++) {
		if (max1 < firsttemps[i1]) {
			max1 = firsttemps[i1];
			max1day = i1+1;
		}
	}
	printf("The maximum temperature in 1930 was %d on %d/%d\n", max1, datemonth(max1day),dateday(max1day));

	int max2 = secondtemps[0];
	int i2;
	for (i2 = 1; i2 <= 364; i2++) {
		if (max2 < secondtemps[i2]) {
			max2 = secondtemps[i2];
			max2day = i2+1;
		}

	}
	printf("The maximum temperature in 2001 was %d on %d/%d\n\n", max2, datemonth(max2day), dateday(max2day));

	// min

	int min1 = firsttemps[0];
	int n1;
	for (n1 = 1; n1 <= 364; n1++) {
		if (min1 > firsttemps[n1]) {
			min1 = firsttemps[n1];
			min1day = n1+1;
		}
	}
	printf("The minimum temperature in 1930 was %d on %d/%d\n", min1, datemonth(min1day), dateday(min1day));

	int min2 = secondtemps[0];
	int n2;
	for (n2 = 1; n2 <= 364; n2++) {
		if (min2 > secondtemps[n2]) {
			min2 = secondtemps[n2];
			min2day = n2+1;
		}
	}
	printf("The minimum temperature in 2001 was %d on %d/%d\n\n\n", min2, datemonth(min2day), dateday(min2day));
	

	//calculating differences
	int diff[365];
	int maxDiff = 0xf0000000;
	int minDiff = 0x7fffffff;
	int maxi, mini;
	printf("Calculating Difference with 1930 Temps Subtracted from 2001 Temps:\n");
	for (int i = 0; i < 365; i++) {
		diff[i] = secondtemps[i] - firsttemps[i];
		maxi = diff[i] > maxDiff ? i : maxi;
		maxDiff = diff[i] > maxDiff ? diff[i] : maxDiff;
		mini = diff[i] < minDiff ? i : mini;
		minDiff = diff[i] < minDiff ? diff[i] : minDiff;
	}
	//raise maxi and mini by 1 each because C arrays start at 0, not 1
	maxi++;
	mini++;

	//printing date of maximum difference
	printf("Max Difference: %d on %d/%d\n", maxDiff,datemonth(maxi),dateday(maxi));
	printf("Min Difference: %d on %d/%d\n\n", minDiff, datemonth(mini),dateday(mini));

	//writing results to a .dat file
	FILE *fname2;
	fname2 = fopen("results.dat", "w");
	fprintf(fname2,"Mean in 1930 = %.2f\nMean in 2001 = %.2f\nStandard Deviation in 1930: %.2f\nStandard Deviation in 2001: %.2f\n\n\n", firstmean, secondmean, stdev1, stdev2);
	fprintf(fname2, "Max in 1930 = %d on %d/%d\nMax in 2001 = %d on %d/%d\nMin in 1930 = %d on %d/%d\nMin in 2001 = %d on %d/%d\n\n", max1,datemonth(max1day),dateday(max1day), max2,datemonth(max2day),dateday(max2day), min1,datemonth(min1day),dateday(min1day), min2,datemonth(min2day),dateday(min2day));
	fprintf(fname2, "\nCalculating Difference with 1930 Temps Subtracted from 2001 Temps:\n");
	fprintf(fname2, "Max difference = %d on %d/%d\nMin difference = %d on %d/%d\n", maxDiff,datemonth(maxi),dateday(maxi), minDiff,datemonth(mini),dateday(mini));
	fclose(fname2);


	system("pause");
}