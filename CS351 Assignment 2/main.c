// Matthew Clark
// CS351 - Computer Architecture
// Assignment 2 - Records

#include <stdio.h>
#include <string.h>
#include <stdlib.h>

// Ceates dates structure.
typedef struct
{
    int day;
    int month;
    int year;
}
date;
date dates[100];

// Creates contact structure.
typedef struct
{
    char firstName[16];
    char lastName[16];
}
contact;
contact contacts[100];

// Asks user to input contacts.txt file and parses contacts.
void loadContact()
{
    char filename[15];
    char c;
    // Requests user to input contact.txt file name.
    printf("Please enter filename.\n");
    scanf("%s", filename);
    printf("\n");
    // Opens file.
    FILE *file;
    file = fopen(filename, "r");
    // Creates line and character array.
    char fullFile [100][43];
    int i = 0;
    int total = 0;
    // Retrievs contacts in contacts.txt file.
    while(fgets(fullFile[i], sizeof(file[i]), file))
    {
        i++;
    }
    // Initializes variable total and creates string array with a maximum of 16 characters.
    total = i;
    char *breaker;
    char *strArray[16];
    // Loops through entire contact list.
    for(i = 0; i < total; i++)
    {
        // Initializes j variable and breaker variable.
        int j = 0;
        breaker = strtok(fullFile[i]," ,.-");
        // Parses every line in contacts.txt file.
        while(breaker != NULL)
        {   
            if(j == 0)
            {
                strcpy(contacts[i].firstName, breaker);
            }
            j++;
            strArray[i] = strdup(breaker);
            breaker = strtok(NULL, " ,.-");
            if(j == 1)
            {
                strcpy(contacts[i].lastName, breaker);
            }
            else if(j == 2)
            {
                int temp = atoi(breaker);
                dates[i].day = temp;
            }
            else if(j == 3)
            {
                int temp = atoi(breaker);
                dates[i].month = temp;
            }
            else if(j == 4)
            {
                int temp = atoi(breaker);
                dates[i].year = temp;
            }
        }
    }
    // Closes file.
    fclose(file);
}

// Main method.
int main()
{
    // Calls loadContact method.
    loadContact();
    // Sets todays date.
    int i = 0;
    int currentYear = 2018;
    int currentMonth = 02;
    int currentDay = 18;
    // Loops through each contacts birth date.
    for(i = 0; i < 101; i++)
    {
        // Years 1994-1999
        if((1993 < dates[i].year) && (dates[i].year < 2000))
        { 
            // Handles current month being less than birth month.
            if(currentMonth < dates[i].month)
            {
                int age = currentYear - dates[i].year - 1;
                printf("%c. %s, %d\n", contacts[i].firstName[0], contacts[i].lastName, age);
            }
            // Handles current month being greater than birth month.
            if(currentMonth > dates[i].month)
            {
                int age = currentYear - dates[i].year;
                printf("%c. %s, %d\n", contacts[i].firstName[0], contacts[i].lastName, age);
            }
            // Handles current month matching birth month.
            if(currentMonth == dates[i].month)
            {
                if(currentDay < dates[i].day)
                {
                    int age = currentYear - dates[i].year - 1;
                    printf("%c. %s, %d\n", contacts[i].firstName[0], contacts[i].lastName, age);
                }
                else
                {
                    int age = currentYear - dates[i].year;
                    printf("%c. %s, %d\n", contacts[i].firstName[0], contacts[i].lastName, age);
                }
            }
        }
        // Handles edge case for 2000.
        else if(dates[i].year == 2000)
        {
            if(dates[i].month <= currentMonth)
            {
                if(dates[i].day < currentDay)
                {
                    printf("%c. %s, 18\n", contacts[i].firstName[0], contacts[i].lastName);
                }
            }
        }
        // Handles edge case for 1993.
        else if(dates[i].year == 1993)
        {
            if(dates[i].month >= currentMonth)
            {
                if(dates[i].day > currentDay)
                {
                    printf("%c. %s, 24\n", contacts[i].firstName[0], contacts[i].lastName);
                }
            }
        }
        // Says happy birthday if current year, month and day match birthday.
        if(dates[i].month == currentMonth && dates[i].day == currentDay)
        {
            printf("\n");
            printf("Happy birthday, %s!!\n", contacts[i].firstName);
            printf("\n");
        }
    }
    return 0;
}