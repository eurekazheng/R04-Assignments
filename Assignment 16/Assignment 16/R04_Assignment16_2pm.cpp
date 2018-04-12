#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>

void matrixinput(int *rows, int *cols, float [][20]);

int main(void) {
	float matrix1[20][20], matrix2[20][20];
	int rows1, cols1, rows2, cols2;

	matrixinput(&rows1,&cols1,matrix1);

	system("pause");
	return(0);
}

void matrixinput(int *rows, int *cols, float matrix[][20]) {
	char input[20];
	FILE *filename;
	do {
		printf("Enter the name of your file: ");
		scanf(" %s", &input);
	} while (fopen(input, "r") == 0);
	filename = fopen(input, "r");
	
	float temp;
	fscanf(filename, " %d %d", &rows, &cols);
	printf("rows = %d cols = %d", rows, cols);
	scanf("%f", &temp);

	for (int n = 0; n < *rows; n++) {
		for (int i = 0; i < *cols; i++) {
			fscanf(filename, " %f", &matrix[n][i]);
		}
	}
}