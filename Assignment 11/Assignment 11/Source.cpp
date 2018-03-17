#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>

int main(void)
{
	printf("ENGR0012\nR04\nMandala 2 PM\nEvan White, Kevin Pietz, Eureka Zheng\n\n");
	// displaying header

	printf("The first \\n puts the text on a new line, the double slash by the n is\nneeded to allow the printing of the \\n in this printout. If you want to add\na tab in the print out you insert \\t\t it will tab the text as shown here.\n\n");
	//displaying first paragraph

	printf("Sometimes it is nice to print out text in \"double quotes\", this requires the\ndouble quote escape sequence \\\". Sometimes it is nice to print out text in\n\'single quotes\', this requires the single quote escape sequence \\\'. \n\n");
	//displaying second paragraph

	printf("Want to printout a %% sign you need to use the escape sequence \"%%%%\", do you\nunderstand\nthe code required to print this sentence out\\?\n\n");
	//displaying third paragraph

	printf("Finally, notice all the single slashes \'\\\' at the end of each line. These\nallow you to wrap the printf string to the next line for easy or reading.\nMake a bell ring at this point.\a Did you hear the bell ring\n\n");
	//displaying fourth paragraph

	int A = 1;
	double B = 2.34;
	char C = 'f';
	printf("User Friendly: A = %d, B = %.2f, C = %c\n\n", A, B, C);
	//user friendly display
	printf("As an Int: A = %d, B = %d, C = %d\n\n", A, B, C);
	printf("As a Double: A = %f, B = %f, C = %f\n\n", A, B, C);
	printf("As a Character: A = %c, B = %c, C = %c\n\n", A, B, C);
	//other 3 methods

	int G[4] = { 3,5,8,9 };
	float H[2][2] = { {4.4,5.5},{6.6,7.7} };

	printf("G = %d %d %d %d\n\n", G[0], G[1], G[2], G[3]);
	//displaying G
	printf("H = %.1f %.1f\n    %.1f %.1f\n\n", H[0][0], H[0][1], H[1][0], H[1][1]);
	//displaying H
	system("pause");
	return 0;
}