// Matthew Clark
// CS351 - Computer Architecture
// Assignment 3 - Nested Loop

#include <stdio.h>

void tip()
{
    printf("       *\n");
}

void body()
{
    int rows;
    for(rows = 1; rows <= 6; rows++)
    {
        int spaces;
        for(spaces = 6; spaces >= rows; spaces--)
        {
            printf(" ");
        }
        printf("*");
        
        int spread;
        for(spread = 0; spread - rows + 2 <= rows; spread++)
        {
            printf(" ");
        }
        printf("*\n");
    }
}

void base()
{
    printf("***************\n");
}

int main()
{
    tip();
    body();
    base();
};