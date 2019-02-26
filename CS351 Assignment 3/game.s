.data
rnum:
        .word 10                                        /* Creates variable rnum to 10 */
tries:
        .word 0                                         /* Creates variable tries to 0 */
game:
        .asciz "Guess the number:"                      /* Creates variable string game */
format:
        .asciz "%d"                                     /* Creates variable string format */
guess:
        .word 0                                         /* Creates variable guess to 0 */
high:
        .asciz "Too high Guess again. "                 /* Creates variable string high */
low:
        .asciz "Too low. Guess again. "                 /* Creates variable string low */
winner:
        .asciz "You guessed correctly in %d tries!\n"   /* Creates variable string winner */
return:
        .word 0                                         /* Creates variable return to 0 */
.text
.global main
main:
        ldr r4, address_of_return                       /* Loads address of return into register 4 */
        str lr, [r4]                                    /* Stores link register into memory cell of register 4 */

        ldr r5, address_of_rnum                         /* Loads the address of random number into register 5 */
        ldr r5, [r5]                                    /* Loads the memory cell of register 5 into register 5 */

        ldr r0, address_of_game                         /* Loads the address of game into register 0 */
        bl printf                                       /* Prints game */

increase_tries:
        ldr r7, address_of_tries                        /* Loads the address of tries into register 7 */
        ldr r8, [r7]                                    /* Loads the memory cell of register 7 into register 8 */
        add r8, r8, #1                                  /* Increases tries by 1 */
        str r8, [r7]                                    /* Stores register 8 into the memoery cell of register 7 */

guess_number:
        ldr r0, address_of_format                       /* Loads the address of format into register 0 */
        ldr r1, address_of_guess                        /* loads address of guess into register 1 */
        bl scanf                                        /* Scans for guess */
        ldr r1, address_of_guess                        /* Loads address of guess into register 1 */
        ldr r1, [r1]                                    /* Loads the memory cell of register 1 into register 1 */

compare_guess:
        cmp r1, #10                                     /* Compares guess to random number */
        blt guess_low                                   /* While guess is less than random number jump to guess low */
        bgt guess_high                                  /* While guess is greater than random number jump to guess low */
        beq guess_equals                                /* While guess is equal to random number jump to guess low */

guess_low:
        ldr r0, address_of_low                          /* Loads address of low into register 0 */
        bl printf                                       /* Prints low */
        b increase_tries                                /* Jump to increase tries */

guess_high:
        ldr r0, address_of_high                         /* Loads address of high into register 0 */
        bl printf                                       /* Prints high */
        b increase_tries                                /* Jump to increase tries */

guess_equals:
        ldr r0, address_of_winner                       /* Loads address of winner into register 0 */
        ldr r1, address_of_tries                        /* Loads address of tries into register 8 */
        ldr r1, [r1]                                    /* Loads memoery cell of register 8 into register 8 */
        bl printf                                       /* Prints winner */

end:         
        ldr r4, address_of_return                       /* Loads address of return into register 4 */
        ldr lr, [r4]                                    /* Loads memory cell of register 4 into link register */
        bx lr                                           /* Exits program */
    
address_of_rnum: .word rnum
address_of_tries: .word tries
address_of_game: .word game
address_of_format: .word format 
address_of_guess: .word guess
address_of_high: .word high
address_of_low: .word low
address_of_winner: .word winner 
address_of_return: .word return

.global printf
.global scanf