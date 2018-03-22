#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>


//function for part A

float calc(float t, int n) {
	float  i, output=0;

	//summing up V given inputs
	for (i = 1; i <= n; i = i + 1) {
		output = (1 / ((2 * i - 1)*(2 * i - 1)))*cos(((2 * i - 1)*(3.14159265*t)) / 3) + output;
	}

	//part of V outside of sum
	output = (12 / (3.14159265*3.14159265))*output;
	output = 1.5 - output;

	return (output);
};

int partA(void) {
	char again;
	float n,i,t,output;
	do {
		//setting value for summation
		n = 0;
		t = 0;
		output = 0;

		//getting value for t
		printf("Input a value for t:\n");
		scanf(" %f", &t);
		
		//getting value for n
		//this doesnt seem to be working right now
		printf("Input a value for n:\n");
<<<<<<< HEAD
		scanf(" %f", &n);

		output = calc(t, n);
=======
		scanf(" %d", &n);

        output = calc(t, n);
>>>>>>> 026352868c4e1724231707c904a1a2dd173ae782
		
		//displaying results
		printf("t = %.2f\n", t);
		printf("n = %.1f\n", n);
		printf("Voltage = %f\n", output);

		//checking if user wants to run again
		printf("Do you want to run again? (y/n)\n");
		scanf(" %c", &again);
	} while (again == 'y');
	return(0);
};

int calc(float t, int n) {
    float output;
    
    //summing up V given inputs
    for (int i = 1; i <= n; i = i + 1) {
        output = (1/((2*i-1)*(2*i-1)))*cos(((2*i-1)*(3.14159265*t))/3)+output;
    }
    
    //part of V outside of sum
    return ((3 / 2) - (12 / (3.14159265*3.14159265)))*output;
};

//function for part B
int partB(void) {
	printf("b\n");
	return(0);
};

//function for part C
int partC(void) {
    
    //getting value for t1
    printf("Input a value for t1:\n");
    scanf("%f", &t1);
    
    //getting value for t2
    printf("Input a value for t2:\n");
    scanf("%f", &t2);
    
    //getting value for n
    printf("Input a value for n:\n");
    scanf(" %d", &n);
    
    v1 = calc(t1, n);
    v2 = calc(t2, n);
    
    //displaying results
    printf("v1 = %.2f\n", v1);
    printf("v2 = %.2f\n", v2);
    printf("Voltage = %f\n", v2 - v1);
	return(0);
};


//main function
int main(void) {
	int choice = 10;
	char againm;
	do {
		printf("Do you want to try part 1, 2, or 3?: \n");
		scanf(" %d", &choice);
		switch (choice) {
		case 1:
			partA();
			break;
		case 2:
			partB();
			break;
		case 3:
			partC();
			break;
		}
		printf("Do you want to do the whole program again? (y/n):\n");
		scanf(" %c", &againm);
	} while (againm == 'y');
	
	printf("\nGoodbye!\n\n");
	system("pause");
}

