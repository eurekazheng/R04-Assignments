#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>

//Evan White, Kevin Pietz, Eureka Zheng
//R04
//Assignment 14
//ENGR0012 T/Th 2-4PM
//Instructor: Mandala

//prototype functions
void header(void);
float numberinput(int n);
int opchoice(void);
float mathops(int optype,float num1, float num2);
void txtops(float output,int optype, float num1, float num2);


//main function
int main(void) {
	header();

	//initializing variables
	float num1,num2;
	int optype;
	char again='Y',againnum,temp;

	//outer while loop is for user wants to continue but with different numbers
	while (again=='Y') {


		//getting the users numbers using func 1
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
		againnum = 'Y';

		//operations section
		//inner while loop is if user wants to continue with same numbers
		while (againnum=='Y') {
			float output;
			//getting optype from func 3
			optype = opchoice();
			//getting output from func 4
			output=mathops(optype, num1, num2);
			//displaying results and logging to .txt file with func 5
			txtops(output,optype,num1,num2);



			//checking if user wants to run again with same numbers

			do {
				printf("Would you like to use these numbers again? (y/n):\n");
				scanf(" %c", &temp);
				againnum=toupper(temp);
			} while (againnum != 'Y'&&againnum != 'N');

		}

		//checking if user wants to use different numbers
		do  {
			printf("Do you want to use different numbers? (y/n):\n");
			scanf(" %c", &temp);
			again=toupper(temp);
		} while (again != 'Y'&&again != 'N');
	
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


	printf("Please enter the operation to perform on your numbers:\n   1) Addition\n   2) Subtraction\n   3) Multiplication\n   4) Division\n");
	scanf(" %d", &choice);
	while (choice > 4 || choice < 1) {
		printf("ERROR! ENTER ONE OF THE OPTIONS!\n Please enter the operation you wish to perform on your numbers:\n   1) Addition\n   2) Subtraction\n   3) Multiplication\n   4) Division\n");
		scanf(" %d", &choice);
	}

	return(choice);
}

//function 4 -- math operations
float mathops(int optype, float num1, float num2) {
	float output;
	switch (optype) {
	case 1:
		output = num1 + num2;
		break;
	case 2:
		output = num1 - num2;
		break;
	case 3:
		output = num1 * num2;
		break;
	case 4:
		output = num1 / num2;
		break;
	}
	return(output);
}

//function 5 -- putting results in a text file
//numbers displaying as %.2f to look like sample output
void txtops(float output,int optype, float num1, float num2) {
	FILE *fname;
	fname = fopen("results.txt", "a");
	switch (optype) {
	case 1:
		printf("The Addition: %.2f + %.2f = %.2f\n", num1, num2, output);
		fprintf(fname,"The Addition: %.2f + %.2f = %.2f\n", num1, num2, output);
		break;
	case 2:
		printf("The Subtraction: %.2f - %.2f = %.2f\n", num1, num2, output);
		fprintf(fname,"The Subtraction: %.2f - %.2f = %.2f\n", num1, num2, output);
		break;
	case 3:
		printf("The Multipication: %.2f * %.2f = %.2f\n", num1, num2, output);
		fprintf(fname,"The Multipication: %.2f * %.2f = %.2f\n", num1, num2, output);
		break;
	case 4:
		printf("The Division: %.2f / %.2f = %.2f\n", num1, num2, output);
		fprintf(fname,"The Division: %.2f / %.2f = %.2f\n", num1, num2, output);
		break;
	}
	fclose(fname);
}