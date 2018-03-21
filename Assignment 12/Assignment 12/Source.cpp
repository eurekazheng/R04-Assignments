#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>


//function for part A
int partA(void) {
	char again;
	int n, i;
	float t,output=0;
	do {
		//setting value for summation
		i = 0;

		//getting value for t
		printf("Input a value for t:\n");
		scanf("%f", &t);
		
		
		//getting value for n
		//this doesnt seem to be working right now
		printf("Input a value for n:\n");
		scanf(" %d", &n);

		//summing up V given inputs
		while (i <= n) {
			output = (1 / (pow(2*i-1,2)))*cos(((2 * i - 1)*3.14159265*t) / 3)+output;
			i++;
		}
		//part of V outside of sum
		output = output * ((3 / 2) - (12 / (3.14159265*3.14159265)));
		
		//displaying results
		printf("n = %d\n", n);
		printf("t = %.2f\n", t);
		printf("Voltage = %f\n", output);

		//checking if user wants to run again
		printf("Do you want to run again? (y/n)\n");
		scanf(" %c", &again);
	} while (again == 'y');
	return(0);
};

//function for part B
int partB(void) {
	printf("b\n");
	return(0);
};

//function for part C
int partC(void) {
	printf("c\n");
	return(0);
};


//main function
int main(void) {
	partA();
	partB();
	partC();
	system("pause");
}

