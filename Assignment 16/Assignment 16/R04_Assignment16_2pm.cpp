#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>
#include <ctype.h>
/*
Created by: Evan White, Kevin Pietz, Eureka Zheng
ENGR0012 Section: Mandala 2 PM T/Th
Purpose: Matrix operations based on user inputted data sets
*/

//prototype functions
void matrixinput(int *rows, int *cols, float matrix[][20]);
char menu(void);

int main(void) {
	//initializing variables
	float matrix1[20][20], matrix2[20][20];
	int rows1, cols1, rows2, cols2;
	char opchoice;

	// FUNCTION 1
	//running function 1 twice to get both matrices for operations
	matrixinput(&rows1, &cols1, matrix1);
	matrixinput(&rows2, &cols2, matrix2);

	//printing first matrix to verify successful scanning
	for (int i = 0; i < rows1; i++) { //delete later
		printf("\n");
		for (int n = 0; n < cols1; n++) {
			printf("%f ", matrix1[i][n]);
		}
	} printf("\n\n\n"); // delete later

	// FUNCTION 2
	opchoice = menu();
	//switch case based on output
	switch (opchoice) {
	case 'A': //adding matrices
		printf("adding");
		break;
	case 'S': //subtracting matrices
		printf("subtracting");
		break;
	case 'M': //multiplying matrices
		printf("multiplying");
		break;
	case 'E': //element by element multiplication
		printf("element mult");
		break;
	case 'Q': //quitting
		printf("cya");
		break;
	}

	printf("\n\n");
	system("pause");
	return(0);
}

/*
	Function 1:
	 - Take input of filenames of where matrices are stored
	 - error check filename input
	 - open file when name is correct, get # of rows and cols, then build array
*/
void matrixinput(int *rows, int *cols, float matrix[][20]) {
	char input[20];
	FILE *data;
	do {
		printf("Enter the name of your file: ");
		scanf(" %s", &input);
	} while (fopen(input, "r") == 0); //if fopen can't open data file, it returns a 0
	data = fopen(input, "r");
	fscanf(data, " %d %d", rows, cols); //first 2 numbers in data file are the # of rows then # of cols
	for (int i = 0; i < *rows; i++) {
		for (int n = 0; n < *cols; n++) {
			fscanf(data, "%f", &matrix[i][n]); //this fscanf nearly singlehandedly killed me at the ripe old age of 19
		}
	}
}

/*
	Function 2:
	 - Take input of what type of matrix operation the user wants to do
	 - Error check the users choice
	 - Return a correct input of operation choice to main
*/
char menu(void) {
	//variable for use in menu function
	char choice;
	printf("Enter A to add two matrices \nEnter S to substract to matrices \nEnter M to multiply two matrices \nEnter E to multiply two matrices element by element \nEnter Q to quit \nPlease enter your choice: ");
	scanf(" %c", &choice);
	//putting choice in upper case
	choice=toupper(choice);
	//error checking
	while (choice != 'A' && choice != 'S' && choice != 'M' && choice != 'E' && choice != 'Q') {
		printf("Error! Input invalid.\tTry Again: \n");
		scanf(" %c", &choice);
	}
	//returning to main
	return(choice);
}