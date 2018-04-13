#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>

void matrixinput(int *rows, int *cols, float matrix[][20]);

int main(void) {
	float matrix1[20][20], matrix2[20][20];
	int rows1, cols1, rows2, cols2;

	matrixinput(&rows1, &cols1, matrix1);
	matrixinput(&rows2, &cols2, matrix2);
	
	system("pause");
	return(0);
}

void matrixinput(int *rows, int *cols, float matrix[][20]) {
	char input[20];
	FILE *data;
	do {
		printf("Enter the name of your file: ");
		scanf(" %s", &input);
	} while (fopen(input, "r") == 0);

	data = fopen(input, "r");
	fscanf(data, " %d %d", rows, cols);
	int check;
	for (int i = 0; i < *rows; i++) {
		for (int n = 0; n < *cols; n++) {
			check = fscanf(data, "%f", &matrix[i][n]);
		}
	}
	for (int i = 0; i < *rows; i++) {
		printf("\n");
		for (int n = 0; n < *cols; n++) {
			printf("%f ", matrix[i][n]);
		}
	}


}