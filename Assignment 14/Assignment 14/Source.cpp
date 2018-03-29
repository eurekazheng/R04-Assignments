#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

//still need:
//Display: ERROR! when errors happen
//make the printfs better and not shit looking

//prototype functions
void header(void);
float numberinput(int n);
int opchoice(void);
void mathops(int optype,float num1, float num2);
void txtops(int optype, float num1, float num2);


//main function
int main(void) {
	header();

	float num1,num2;
	int optype;
	char again='y',againnum;

	while (again=='y') {


		//getting the users numbers
		int n;
		for (n = 1; n <= 2; n++) {
			if (n == 1) {
				num1 = numberinput(n);
			}
			else if (n == 2) {
				num2 = numberinput(n);
			}
		}
		
		//againnum is set back to y here in case user previously said no to using same numbers, as againnum would still be 'n'
		againnum = 'y';

		//operations section
		while (againnum=='y') {
			//getting op type by running
			optype = opchoice();
			mathops(optype, num1, num2);

			//checking if user wants to run again with same numbers

			do {
				printf("Would you like to use these numbers again? (y/n):\n");
				scanf(" %c", &againnum);
			} while (againnum != 'y'&&againnum != 'n');

		}

		//checking if user wants to use different numbers
		do  {
			printf("Do you want to use different numbers? (y/n):\n");
			scanf(" %c", &again);
		} while (again != 'y'&&again != 'n');
	
	}
	

	system("pause");
	return(0);
}

//Function 1 -- displaying header
void header(void) {
	printf("Group R04\n");
	printf("Group Members: Kevin Pietz, Eureka Zheng, Evan White \n");
	printf("Assignment 14 \n");
	printf("5th April 2018\n");
	printf("Purpose: Take input of 2 numbers and perform math operations of user's choice on numbers\n\n");
}

//function 2 -- user input
float numberinput(int n) {
	float output;
	printf("Enter a value for number %d: ", n);
	scanf(" %f", &output);
	return(output);
}

//function 3 -- operation choice
int opchoice(void) {
	int choice=0;

	while (choice > 4 || choice < 1) {
		printf("Please enter the operation to perform on your numbers:\n   1) Addition\n   2) Subtraction\n   3) Multiplication\n   4) Division\n");
		scanf(" %d",&choice);
	}

	return(choice);
}

//function 4 -- math operations
void mathops(int optype, float num1, float num2) {
	float output;
	printf("Using numbers: num1 = %f and num2 = %f\n", num1, num2);
	switch (optype) {
	case 1:
		output = num1 + num2;
		printf("The Addition: %f + %f = %f\n\n", num1, num2, output);
		break;
	case 2:
		output = num1 - num2;
		printf("The Subtraction: %f - %f = %f\n\n", num1, num2, output);
		break;
	case 3:
		output = num1 * num2;
		printf("The Multipication: %f * %f = %f\n\n", num1, num2, output);
		break;
	case 4:
		output = num1 / num2;
		printf("The Subtraction: %f / %f = %f\n\n", num1, num2, output);
		break;
	}
	txtops(optype, num1, num2);
}

//function 5 -- putting results in a text file
void txtops(int optype, float num1, float num2) {
	FILE *fname;
	fname = fopen("results.txt", "a");
	float output;
	switch (optype) {
	case 1:
		output = num1 + num2;
		fprintf(fname,"The Addition: %f + %f = %f\n", num1, num2, output);
		break;
	case 2:
		output = num1 - num2;
		fprintf(fname,"The Subtraction: %f - %f = %f\n", num1, num2, output);
		break;
	case 3:
		output = num1 * num2;
		fprintf(fname,"The Multipication: %f * %f = %f\n", num1, num2, output);
		break;
	case 4:
		output = num1 / num2;
		fprintf(fname,"The Subtraction: %f / %f = %f\n", num1, num2, output);
		break;
	}
	fclose(fname);
}