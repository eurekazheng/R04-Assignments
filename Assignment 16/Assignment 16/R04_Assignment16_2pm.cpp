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

/*
basic layout for matrix operations

for (int i = 0; i < rows1; i++) { 
	printf("\n");
	for (int n = 0; n < cols1; n++) {
		printf("%f ", matrix1[i][n]);
	}
} printf("\n\n\n");

*/

//prototype functions
void matrixinput(int *rows, int *cols, float matrix[][20]);
char menu(void);
void addition(int *rows1, int*cols1, float matrix1[][20], int *rows2, int *cols2, float matrix2[][20], int *rowsout, int *colsout, float matrixout[][20]);
void subtraction(int *rows1, int*cols1, float matrix1[][20], int *rows2, int *cols2, float matrix2[][20], int *rowsout, int *colsout, float matrixout[][20]);
void multi(int *rows1, int*cols1, float matrix1[][20], int *rows2, int *cols2, float matrix2[][20], int *rowsout, int *colsout, float matrixout[][20]);
void emulti(int *rows1, int*cols1, float matrix1[][20], int *rows2, int *cols2, float matrix2[][20], int *rowsout, int *colsout, float matrixout[][20]);
void display(char optype, int *rows1, int*cols1, float matrix1[][20], int *rows2, int *cols2, float matrix2[][20], int *rowsout, int *colsout, float matrixout[][20]);

int main(void) {
	//initializing variables
	float matrix1[20][20], matrix2[20][20], matrixout[20][20];
	int rows1, cols1, rows2, cols2, rowsout, colsout;
	char opchoice;

	// FUNCTION 1
	//running function 1 twice to get both matrices for operations
	matrixinput(&rows1, &cols1, matrix1);
	matrixinput(&rows2, &cols2, matrix2);

	// FUNCTION 2
	printf("\n");
	opchoice = menu();
	printf("\n");
	//switch case based on output
	switch (opchoice) {
	case 'A': //adding matrices

		// FUNCTION 3
		addition(&rows1, &cols1, matrix1, &rows2, &cols2, matrix2, &rowsout, &colsout, matrixout);
		break;

	case 'S': //subtracting matrices

		// FUNCTION 4
		subtraction(&rows1, &cols1, matrix1, &rows2, &cols2, matrix2, &rowsout, &colsout, matrixout);
		break;

	case 'M': //multiplying matrices

		// FUNCTION 5
		multi(&rows1, &cols1, matrix1, &rows2, &cols2, matrix2, &rowsout, &colsout, matrixout);
		break;

	case 'E': //element by element multiplication

		// FUNCTION 6
		emulti(&rows1, &cols1, matrix1, &rows2, &cols2, matrix2, &rowsout, &colsout, matrixout);
		break;

	case 'Q': //quitting
		printf("cya");
		break;
	}
	display(opchoice, &rows1, &cols1, matrix1, &rows2, &cols2, matrix2, &rowsout, &colsout, matrixout);

	printf("\n\n");
	system("pause");
	return(0);
} 

/*
-----------------------------------END OF MAIN----------------------------------------
*/

/*
	Function 1: GET MATRICES FROM FILE
	 - Take input of filename where matrix and its dimensions are stored
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
	Function 2: MENU OF OPERATIONS
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
		printf("ERROR! Input invalid.\tTry Again: \n");
		scanf(" %c", &choice);
	}
	//returning to main
	return(choice);
}

/*
	Function 3: ADDITION
	 - Take input of 2 matrices and their dimensions, and the pointer to the results matrix
	 - Perform the addition of the 2 matrices
	 - Return the results of the addition to the specified variable
*/
void addition(int *rows1, int*cols1, float matrix1[][20], int *rows2, int *cols2, float matrix2[][20], int *rowsout, int *colsout, float matrixout[][20]) {

	*rowsout = *rows1; //setting size of output matrix
	*colsout = *cols1; 

	printf("Performing Addition\n");
	for (int i = 0; i < *rows1; i++) {
		if (*rows1 != *rows2 || *cols1 != *cols2) {
			printf("ERROR! Dimensions do not match! Returning to main function!\n");
			break; //if the dimensions of input matrices don't match, display error and break.
		}
		for (int n = 0; n < *cols1; n++) {
			matrixout[i][n] = matrix1[i][n] + matrix2[i][n];
		}
	}

}

/*
	Function 4: SUBTRACTION
	 - Take input of 2 matrices and their dimensions, and the pointer to the results matrix
	 - Perform the subtraction of the 2 matrices if dimensions are correct
*/

void subtraction(int *rows1, int*cols1, float matrix1[][20], int *rows2, int *cols2, float matrix2[][20], int *rowsout, int *colsout, float matrixout[][20]) {


	*rowsout = *rows1; //setting size of output matrix
	*colsout = *cols1;

	printf("Performing Subtraction\n");
	for (int i = 0; i < *rows1; i++) {
		if (*rows1 != *rows2 || *cols1 != *cols2) {
			printf("ERROR! Dimensions do not match! Returning to main function!\n");
			break; //if the dimensions of input matrices don't match, display error and break.
		}
		for (int n = 0; n < *cols1; n++) {
			matrixout[i][n] = matrix1[i][n] - matrix2[i][n];
		}
	}

}

/*
	Function 5: MULTIPLICATION
	 - Take input of 2 matrices, their dimensions, and pointers for output
	 - Perform the multiplication
*/

void multi(int *rows1, int*cols1, float matrix1[][20], int *rows2, int *cols2, float matrix2[][20], int *rowsout, int *colsout, float matrixout[][20]) {
	printf("Performing Multiplication\n");

	*rowsout = *rows1; //setting size of output matrix
	*colsout = *cols2;

	for (int i = 0; i < *rows1; i++) {
		if (*rows2 != *cols1) {
			printf("ERROR! Dimensions do not match! Returning to main function!\n");
			break; //if the dimensions of input matrices don't match, display error and break.
		}
		for (int j = 0; j < *cols2; j++) {
			matrixout[i][j] = 0;
			for (int k = 0; k < *cols1; k++) {
				matrixout[i][j] += matrix1[i][k] * matrix2[k][j];
			}
		}
	}

}

/*
	Function 6: ELEMENT MULTIPLICATION
	 - Take input of 2 matrices, their dimensions, and pointers for output
	 - Perform the element-wise multiplication 
*/

void emulti(int *rows1, int*cols1, float matrix1[][20], int *rows2, int *cols2, float matrix2[][20], int *rowsout, int *colsout, float matrixout[][20]) {

	*rowsout = *rows1; //setting size of output matrix
	*colsout = *cols1;

	printf("Performing Element-wise Multiplication\n");
	for (int i = 0; i < *rows1; i++) {
		if (*rows1 != *rows2 || *cols1 != *cols2) {
			printf("ERROR! Dimensions do not match! Returning to main function!\n");
			break; //if the dimensions of input matrices don't match, display error and break.
		}
		for (int n = 0; n < *cols1; n++) {
			matrixout[i][n] = matrix1[i][n] * matrix2[i][n];
		}
	}

}

/*
	Function 7: DISPLAY RESULTS
	 - Display both original matrices
	 - Display output of original operation
	 - Return nothing
*/
void display(char optype, int *rows1, int*cols1, float matrix1[][20], int *rows2, int *cols2, float matrix2[][20], int *rowsout, int *colsout, float matrixout[][20]) {

	switch (optype) {
	case 'A':
	case 'S':
	case 'E': //displaying for addition, subtraction, and element-wise multiplication

		if (*rows1 != *rows2 || *cols1 != *cols2) {
			break; //if the dimensions of input matrices didn't match, break before displaying
		}

		printf("Matrix 1:"); //displaying first matrix
		for (int i = 0; i < *rows1; i++) {
			printf("\n");
			for (int n = 0; n < *cols1; n++) {
				printf("%f ", matrix1[i][n]);
			}
		} printf("\n\n");

		printf("Matrix 2:");
		for (int i = 0; i < *rows2; i++) {
			printf("\n");
			for (int n = 0; n < *cols2; n++) {
				printf("%f ", matrix2[i][n]);
			}
		} printf("\n\n");

		printf("Output Matrix:");
		for (int i = 0; i < *rowsout; i++) {
			printf("\n");
			for (int n = 0; n < *colsout; n++) {
				printf("%f ", matrixout[i][n]);
			}
		} printf("\n\n");

		break;
	
	case 'M': //displaying for multiplication

		if (*rows2 != *cols1) {
			break;
		}

		printf("Matrix 1:"); //displaying first matrix
		for (int i = 0; i < *rows1; i++) {
			printf("\n");
			for (int n = 0; n < *cols1; n++) {
				printf("%f ", matrix1[i][n]);
			}
		} printf("\n\n");

		printf("Matrix 2:");
		for (int i = 0; i < *rows2; i++) {
			printf("\n");
			for (int n = 0; n < *cols2; n++) {
				printf("%f ", matrix2[i][n]);
			}
		} printf("\n\n");

		printf("Output Matrix:");
		for (int i = 0; i < *rowsout; i++) {
			printf("\n");
			for (int n = 0; n < *colsout; n++) {
				printf("%f ", matrixout[i][n]);
			}
		} printf("\n\n");

		break;
	case 'Q': //quitting
		break;
	}
}