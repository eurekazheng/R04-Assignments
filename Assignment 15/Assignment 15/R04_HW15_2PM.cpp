#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#include <stdlib.h>

//Evan White, Kevin Pietz, Eureka Zheng
//Instructor: Mandala
//ENGR0012 t,th 2-4 PM
//

//using structure for balances
struct userbalance {
	double checkingb;
	double savingsb;
};

//prototype functions
void header(void);
int menu(void);

int main(void) {
	struct userbalance user1;
	header();

	//variables for checking password
	int usern = 1234, pass = 5678,nentry,pentry,attempts=4;

	//getting username input and verifying
	printf("Please Enter your user ID: ");
	scanf(" %d", &nentry);
	while (nentry != usern) {
		printf("ID Not Recognized! Please Renter your user ID: ");
		scanf(" %d", &nentry);
	}

	//getting password input and verifying
	printf("Please Enter your Password: ");
	scanf(" %d", &pentry);
	while (pentry != pass&&attempts!=1) {
		attempts--;
		//if user gets wrong, their number of attempts left for password is displayed
		printf("Incorrect Password! You have %d attempts remaining. Please Renter your Password: ",attempts);
		scanf(" %d", &pentry);	
	}
	if (pentry == pass && attempts == 1)
		attempts = 2;

	//data stored in balance file as checking,savings
	FILE *data;
	data = fopen("balances.dat", "r");
	fscanf(data, "%lf,%lf", &user1.checkingb, &user1.savingsb);
	fclose(data);

	char again = 'y';
	//script with functions in it if user successfully logs in
	while (again == 'y'&&attempts > 1) {

		//menu function
		//switch case
		//display balances
		//deposit function
		//withdraw function
		//exit

		//displaying balance
		printf("\n\nChecking balance = $%.2lf\nSavings balance = $%.2lf", user1.checkingb, user1.savingsb);

		//checking if user wants to run again
		printf("\nDo you want to complete another transaction? (y/n): ");
		scanf(" %c", &again);

		//error checking for doing another transaction
		while (again != 'y'&&again != 'n') {
			printf("\nERROR! Do you want to complete another transaction? (y/n): ");
			scanf(" %c", &again);
		} 

	}
	
	//after user ends script
	printf("\n\n\n");
	system("pause");
}

//function 1 -- header
void header(void) {
	printf("---------Welcome to ENGR0012 Bank----------\n");
	printf("-------------------------------------------\n");
	printf("----------------Created by:----------------\n");
	printf("---Evan White, Eureka Zheng, Kevin Pietz---\n");
	printf("-------------------------------------------\n\n\n");
}

//function 2 -- menu
int menu(void) {
	return(0);
}