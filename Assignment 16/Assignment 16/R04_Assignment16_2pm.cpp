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
int addition(int *rows1, int*cols1, float matrix1[][20], int *rows2, int *cols2, float matrix2[][20], int *rowsout, int *colsout, float matrixout[][20]);
int subtraction(int *rows1, int*cols1, float matrix1[][20], int *rows2, int *cols2, float matrix2[][20], int *rowsout, int *colsout, float matrixout[][20]);
int multi(int *rows1, int*cols1, float matrix1[][20], int *rows2, int *cols2, float matrix2[][20], int *rowsout, int *colsout, float matrixout[][20]);
int emulti(int *rows1, int*cols1, float matrix1[][20], int *rows2, int *cols2, float matrix2[][20], int *rowsout, int *colsout, float matrixout[][20]);
void display(char optype, int *rows1, int*cols1, float matrix1[][20], int *rows2, int *cols2, float matrix2[][20], int *rowsout, int *colsout, float matrixout[][20]);
void logfile(char optype, int *rows1, int*cols1, float matrix1[][20], int *rows2, int *cols2, float matrix2[][20], int *rowsout, int *colsout, float matrixout[][20]);

int main(void) {
	//initializing variables
	float matrix1[20][20], matrix2[20][20], matrixout[20][20];
	int rows1, cols1, rows2, cols2, rowsout, colsout, errorchk; //errorchk is for if dimensions aren't proper for the operation, is returned as 0 by functions, 1 if successful
	char opchoice,again,again2; //again for whole thing, again2 for same matrices

	// FUNCTION 1
	//running function 1 twice to get both matrices for operations
	//LOOP FOR DIFFERENT MATRICES STARTS HERE
	do {

		again2 = 'Y'; //setting back to Y if user wanted to use new matrices, it would be N here

		//running the matrix input function twice to get both matrices
		printf("First File:\n");
		matrixinput(&rows1, &cols1, matrix1);
		printf("Second File:\n");
		matrixinput(&rows2, &cols2, matrix2);

		// FUNCTION 2
		printf("\n");

		do {
			// LOOP FOR SAME MATRICES STARTS HERE
			opchoice = menu();
			printf("\n");
			//switch case based on output
			switch (opchoice) {
			case 'A': //adding matrices

				// FUNCTION 3
				errorchk = addition(&rows1, &cols1, matrix1, &rows2, &cols2, matrix2, &rowsout, &colsout, matrixout);
				break;
				
			case 'S': //subtracting matrices

				// FUNCTION 4
				errorchk = subtraction(&rows1, &cols1, matrix1, &rows2, &cols2, matrix2, &rowsout, &colsout, matrixout);
				break;

			case 'M': //multiplying matrices

				// FUNCTION 5
				errorchk = multi(&rows1, &cols1, matrix1, &rows2, &cols2, matrix2, &rowsout, &colsout, matrixout);
				break;

			case 'E': //element by element multiplication

				// FUNCTION 6
				errorchk = emulti(&rows1, &cols1, matrix1, &rows2, &cols2, matrix2, &rowsout, &colsout, matrixout);
				break;

			case 'Q': //quitting

				printf("\nQuitting...\n\n");
				system("pause");
				return(0); //returning from main ends program, so this makes quitting actually work
			}

			if (errorchk == 1) {
				// FUNCTION 7
				display(opchoice, &rows1, &cols1, matrix1, &rows2, &cols2, matrix2, &rowsout, &colsout, matrixout);
				// FUNCTION 8
				logfile(opchoice, &rows1, &cols1, matrix1, &rows2, &cols2, matrix2, &rowsout, &colsout, matrixout);
			}

			//asking if user wants to do more stuff with entered matrices
			do {
				printf("Do you want to perform another operation with the same matrices? (y/n):\n");
				scanf(" %c", &again2);
				again2 = toupper(again2);
			} while (again2 != 'Y'&&again2 != 'N');

		} while (again2 == 'Y');


		//asking if user wants to start completely over
		do {
			printf("Do you want to start over with different matrices? (y/n):\n");
			scanf(" %c", &again);
			again = toupper(again);
		} while (again != 'Y'&&again != 'N');
	} while (again == 'Y');

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
		printf("Enter the name of matrix file: ");
		scanf(" %s", &input);
	} while (fopen(input, "r") == 0); //if fopen can't open data file, it returns a 0
	data = fopen(input, "r");
	fscanf(data, " %d %d", rows, cols); //first 2 numbers in data file are the # of rows then # of cols
	for (int i = 0; i < *rows; i++) {
		for (int n = 0; n < *cols; n++) {
			fscanf(data, "%f", &matrix[i][n]); //this fscanf nearly singlehandedly killed me at the ripe old age of 19
		}
	}
	fclose(data);
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
int addition(int *rows1, int*cols1, float matrix1[][20], int *rows2, int *cols2, float matrix2[][20], int *rowsout, int *colsout, float matrixout[][20]) {

	if (*rows1 != *rows2 || *cols1 != *cols2) {
		printf("ERROR! Dimensions Incompatible! Returning to main function!\n");
		printf("Make sure matrices have same number of rows and columns\n");
		return(0); //if dimensions are incompatible, and error message is displayed and 0 is returned to main as an error
	}

	*rowsout = *rows1; //setting size of output matrix
	*colsout = *cols1; 

	//doing the operation, doing all numbers in a row, then moving to next row
	printf("Performing Addition\n");
	for (int i = 0; i < *rows1; i++) {
		for (int n = 0; n < *cols1; n++) {
			matrixout[i][n] = matrix1[i][n] + matrix2[i][n];
		}
	}

	//if successful, 1 is returned to main
	return(1);
}

/*
	Function 4: SUBTRACTION
	 - Take input of 2 matrices and their dimensions, and the pointer to the results matrix
	 - Perform the subtraction of the 2 matrices if dimensions are correct
*/

int subtraction(int *rows1, int*cols1, float matrix1[][20], int *rows2, int *cols2, float matrix2[][20], int *rowsout, int *colsout, float matrixout[][20]) {

	if (*rows1 != *rows2 || *cols1 != *cols2) {
		printf("ERROR! Dimensions Incompatible! Returning to main function!\n");
		printf("Make sure matrices have same number of rows and columns\n");
		return(0); //if the dimensions of input matrices don't match, return a 0, representing an error
	}

	*rowsout = *rows1; //setting size of output matrix
	*colsout = *cols1;

	//same method as addition
	printf("Performing Subtraction\n");
	for (int i = 0; i < *rows1; i++) {
		for (int n = 0; n < *cols1; n++) {
			matrixout[i][n] = matrix1[i][n] - matrix2[i][n];
		}
	}

	return(1); //return 1 if successful
}

/*
	Function 5: MULTIPLICATION
	 - Take input of 2 matrices, their dimensions, and pointers for output
	 - Perform the multiplication
*/

int multi(int *rows1, int*cols1, float matrix1[][20], int *rows2, int *cols2, float matrix2[][20], int *rowsout, int *colsout, float matrixout[][20]) {
	
	if (*rows2 != *cols1) {
		printf("ERROR! Dimensions do not match! Returning to main function!\n");
		printf("Make sure the # of columns in first matrix is equal to the # of rows in second matrix \n");
		return(0); //if dimensions aren't compatible, return a 0
	}

	*rowsout = *rows1; //setting size of output matrix
	*colsout = *cols2;

	//doing all of moving through rows of matrix one, columns of matrix 2, and summing results into matrix out
	printf("Performing Multiplication\n");
	for (int i = 0; i < *rows1; i++) {
		for (int j = 0; j < *cols2; j++) {
			matrixout[i][j] = 0;
			for (int k = 0; k < *cols1; k++) {
				matrixout[i][j] += matrix1[i][k] * matrix2[k][j];
			}
		}
	}

	return(1); //return a 1 if successful
}

/*
	Function 6: ELEMENT MULTIPLICATION
	 - Take input of 2 matrices, their dimensions, and pointers for output
	 - Perform the element-wise multiplication 
*/

int emulti(int *rows1, int*cols1, float matrix1[][20], int *rows2, int *cols2, float matrix2[][20], int *rowsout, int *colsout, float matrixout[][20]) {

	if (*rows1 != *rows2 || *cols1 != *cols2) {
		printf("ERROR! Dimensions do not match! Returning to main function!\n");
		printf("Make sure matrices have same number of rows and columns\n");
		return(0); //if dimensions incompatible, 0 returned as an error
	}

	*rowsout = *rows1; //setting size of output matrix
	*colsout = *cols1;

	//same methodology as addition and subtraction
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
	return(1); //return 1 if successful
}

/*
	Function 7: DISPLAY RESULTS
	 - Display both original matrices
	 - Display output of original operation
	 - Return nothing
*/

void display(char optype, int *rows1, int*cols1, float matrix1[][20], int *rows2, int *cols2, float matrix2[][20], int *rowsout, int *colsout, float matrixout[][20]) {

	//method of displaying goes through all cols in a row, then moves to next row like addition, subtraction, and element-wise mult

	printf("Matrix 1:"); //displaying first matrix
	for (int i = 0; i < *rows1; i++) {
		printf("\n");
		for (int n = 0; n < *cols1; n++) {
			printf("%f ", matrix1[i][n]);
		}
	} printf("\n\n");

	//displaying second matrix
	printf("Matrix 2:");
	for (int i = 0; i < *rows2; i++) {
		printf("\n");
		for (int n = 0; n < *cols2; n++) {
			printf("%f ", matrix2[i][n]);
		}
	} printf("\n\n");

	//displaying third matrix
	printf("Output Matrix:");
	for (int i = 0; i < *rowsout; i++) {
		printf("\n");
		for (int n = 0; n < *colsout; n++) {
			printf("%f ", matrixout[i][n]);
		}
	} printf("\n\n");

}

/*
	Function 8 - LOGGING TO FILE
	 - Take input of all results and the operation type
	 - Write results to file designated by user
*/

void logfile(char optype, int *rows1, int*cols1, float matrix1[][20], int *rows2, int *cols2, float matrix2[][20], int *rowsout, int *colsout, float matrixout[][20]) {

	char input[20];
	FILE *results;

	printf("Enter the name of the desired log file: ");
	scanf(" %s", &input);
	results = fopen(input, "a");

	//this is just so user knows what operation was when viewing the log file
	switch (optype) {
	case 'A':
		fprintf(results, "Addition:\n");
		break;
	case 'S':
		fprintf(results, "Subtraction:\n");
		break;
	case 'E':
		fprintf(results, "Element-wise Multiplication:\n");
		break;
	case 'M':
		fprintf(results, "Multiplication:\n");
		break;
	default:
		break;
	}

	//literally just copied from the display function and switched to fprintf go look at the other function instead
	fprintf(results, "Matrix 1:"); 
	for (int i = 0; i < *rows1; i++) {
		fprintf(results, "\n");
		for (int n = 0; n < *cols1; n++) {
			fprintf(results, "%f ", matrix1[i][n]);
		}
	} fprintf(results, "\n");

	fprintf(results, "Matrix 2:");
	for (int i = 0; i < *rows2; i++) {
		fprintf(results, "\n");
		for (int n = 0; n < *cols2; n++) {
			fprintf(results, "%f ", matrix2[i][n]);
		}
	} fprintf(results, "\n\n");

	fprintf(results, "Output Matrix:");
	for (int i = 0; i < *rowsout; i++) {
		fprintf(results, "\n");
		for (int n = 0; n < *colsout; n++) {
			fprintf(results, "%f ", matrixout[i][n]);
		}
	} fprintf(results, "\n\n\n\n\n");
	
	fclose(results);

}