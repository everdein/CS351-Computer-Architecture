// Matthew Clark
// CS351 - Computer Architecture
// Assignment 3 - Guessing Game

#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main()
{
    srand(time(NULL));
    int randomNumber = rand() % 10;
    printf("Guess the number: ");
    int guess[10];
    int tries = 0;
    while(*guess != randomNumber)
    {
        scanf("%d", guess);
        if(*guess > randomNumber)
        {
            printf("Too high. Guess again. ");
        }
        if(*guess < randomNumber)
        {
            printf("Too low. Guess again. ");
        }
        tries++;
    }
    if(*guess == randomNumber && tries == 1)
    {
        printf("You guessed correctly in 1 try!\n");
    }
    else if(*guess == randomNumber)
    {
        printf("You guessed correctly in %d tries!\n", tries);
    }
}