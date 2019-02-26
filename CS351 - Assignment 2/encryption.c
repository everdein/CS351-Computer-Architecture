// Matthew Clark
// CS351 - Computer Architecture
// Assignment 2 - Encryption

#include <stdio.h>
#include <stdlib.h>
#include <memory.h>

// Word encryption.
int main()
{
    // Creates array for word, encrypt and encryptee.
    char word[127];
    char encrypt[127];
    char encrypted[127];
    // Asks user to enter a word.
    printf("Input a word for encryption: ");
    scanf("%s", word);
    // Asks user to enter a number.
    printf("Please enter a number: ");
    scanf("%s", encrypt);
    // Converts string to integer.
    int convert = atoi(encrypt);
    // Encrypts word.
    for(int i = 0; i < strlen(word); i++)
    {
        int tempChar = word[i];
        tempChar += convert;
        if(tempChar > 122)
        {
            tempChar -= 26;
        }
        encrypted[i] = tempChar;
    }
    // Prints encrypted word.
    printf("Abracadabra '%s' has been encrypted to '%s'!\n", word, encrypted);
    return 0;
}