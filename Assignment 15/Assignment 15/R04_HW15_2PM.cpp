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
void dispbalance(double checkingb, double savingsb);
double deposit(double currentbal);
double withdraw(double currentbal);

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
	//If user gets password right on last attempt, attempts would equal 1 so the while loop wouldnt run again, so it is raised by one so the main loop will run
	if (pentry == pass && attempts == 1)
		attempts++;

	//data stored in balance file as checking,savings
	FILE *data;
	data = fopen("balances.dat", "r");
	fscanf(data, "%lf,%lf", &user1.checkingb, &user1.savingsb);
	fclose(data);

	char again = 'y';
	int uchoice,accountc;
	//script with functions in it if user successfully logs in
	while (again == 'y'&&attempts > 1) {

		uchoice = menu();
		switch (uchoice) {
		case 1: //displaying balance
			dispbalance(user1.checkingb,user1.savingsb);
			break;
		case 2: //deposit
			//checking which account user will deposit to
			printf("Which account will you deposit to?\n1) Checking\n2) Savings\n");
			scanf(" %d", &accountc);
			//error checking their account input
			while (accountc != 1 && accountc != 2) {
				printf("Error! Please enter a 1 or 2!\nWhich account will you deposit to?\n1) Checking\n2) Savings\n");
				scanf(" %d", &accountc);
			}
			//based on their account, the inputs to the deposit function are switched
			switch (accountc) {
			case 1:
				user1.checkingb=deposit(user1.checkingb);
				break;
			case 2:
				user1.savingsb = deposit(user1.savingsb);
				break;
			}
			//printing out the new values
			printf("Your new balances are:\n");
			dispbalance(user1.checkingb,user1.savingsb);
			break;
		case 3: //withdraw
				//checking which account user will deposit to
			printf("Which account will you withdraw from?\n1) Checking\n2) Savings\n");
			scanf(" %d", &accountc);
			//error checking their account input
			while (accountc != 1 && accountc != 2) {
				printf("Error! Please enter a 1 or 2!\nWhich account will you withdraw from?\n1) Checking\n2) Savings\n");
				scanf(" %d", &accountc);
			}
			//based on their account, the inputs to the deposit function are switched
			switch (accountc) {
			case 1:
				user1.checkingb = withdraw(user1.checkingb);
				break;
			case 2:
				user1.savingsb = withdraw(user1.savingsb);
				break;
			}
			//printing out the new values
			printf("Your new balances are:\n");
			dispbalance(user1.checkingb, user1.savingsb);
			break;
		case 4: //exit
			break;
		};

		if (uchoice == 4) //if they choose to exit, break the while loop here before it asks if they want to run again
			break;

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

	//printing outputs into the data file again
	FILE *wdata;
	wdata = fopen("balances.dat", "w");
	fprintf(wdata, "%lf,%lf\nchecking,savings", user1.checkingb, user1.savingsb);
	fclose(data);

	printf("\nThanks for using ENGR0012 Bank\n\n\n");
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
	int uchoice;
	printf("\nWhat would you like to do?\n1) Display Balance\n2) Deposit\n3) Withdraw\n4) Exit\n");
	scanf(" %d", &uchoice);
	while (uchoice > 4 || uchoice < 1) {
		printf("\nError! Please enter 1, 2, 3, or 4!\nWhat would you like to do?\n1) Display Balance\n2) Deposit\n3) Withdraw\n4) Exit\n");
		scanf(" %d", &uchoice);
	}
	return(uchoice);
}

//function 3 -- displaying balance
void dispbalance(double checkingb, double savingsb) {
	printf("Checking balance = $%.2lf\nSavings balance = $%.2lf", checkingb, savingsb);
}

//function 4 -- depositing money
double deposit(double currentbal) {
	double depamount,outbal;
	printf("\nPlease enter the amount you want to deposit: \n");
	scanf(" %lf", &depamount);
	while (depamount <= 0) {
		printf("\nError! Please enter a nonnegative amount you want to deposit: \n");
		scanf(" %lf", &depamount);
	}
	outbal = currentbal + depamount;
	return(outbal);
}


//function 5 -- withdrawing money
double withdraw(double currentbal) {
	double wdamount, outbal;
	printf("\nPlease enter the amount you want to withdraw: \n");
	scanf(" %lf", &wdamount);
	while (wdamount <= 0) {
		printf("\nError! Please enter a nonnegative amount you want to withdraw: \n");
		scanf(" %lf", &wdamount);
	}
	outbal = currentbal - wdamount;
	return(outbal);
}