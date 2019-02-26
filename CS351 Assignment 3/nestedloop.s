.data
row:
        .word 6                                         /* Creates variable row to 6 */
top:
        .asciz "       *\n"                             /* Creates variable string top  */
space:
        .asciz " "                                      /* Creates variable string space */
star:
        .asciz "*"                                      /* Creates variable string star */
new_line:
        .asciz "\n"                                     /* Creates variable string new line */
bottom:
        .asciz "***************\n"                      /* Creates variable string bottom */
count:
        .word 6                                         /* Creates variable count to 6 */
spread:
        .word 22                                        /* Creates variable spread to 22 */
return:
        .word 0                                         /* Creates variable return to 0 */
.text
.global main
main:
        ldr r4, address_of_return                       /* Loads address of return into register 4 */
        str lr, [r4]                                    /* Stores link register into memory cell of register 4 */

        ldr r4, address_of_count                        /* Loads address of count into register 4 */
        ldr r4, [r4]                                    /* Loads memory cell of register 4 into register 4 */

        ldr r6, address_of_spread                       /* Loads address of spread into register 6 */
        ldr r6, [r6]                                    /* Loads memory cell of register 6 into register 6 */

        ldr r5, address_of_row                          /* Loads address of row into register 5 */
        ldr r5, [r5]                                    /* Loads memory cell of register 5 into register 5 */

tip:
        ldr r0, address_of_top                          /* Loads address of top into register 0 */
        bl printf                                       /* Prints top using printf */
        b loop_spaces                                   /* Jump to loop_spaces */

spaces_sub_spread_add:
        ldr r7, address_of_count                        /* Loads address of count into register 7 */
        ldr r4, [r7]                                    /* Loads memory cell of register 7 into register 4  */
        sub r4, r4, #1                                  /* Subtracts count by 1 */
        str r4, [r7]                                    /* Stores register 4 into the memory cell of register 7 */

        ldr r8, address_of_spread                       /* Loads address of spread into register 8 */
        ldr r6, [r8]                                    /* Loads memory cell of register 8 into register 6 */
        sub r6, r6, #4                                  /* Subtracts spread by 4 */
        str r6, [r8]                                    /* Stores register 6 into memory cell of register 8 */

loop_spaces:
        ldr r0, address_of_space                        /* Loads address of space into register 0 */
        bl printf                                       /* Prints space using printf */

        sub r4, r4, #1                                  /* Reduces count by 1 */

compare_count:
        cmp r4, #0                                      /* Compares count to 0 */
        bne loop_spaces                                 /* Branches to body if count doesn't equal 0 */

        ldr r0, address_of_star                         /* Loads address of star into register 0  */
        bl printf                                       /* Prints star */
          
loop_spread:
        ldr r0, address_of_space                        /* Loads address of space into register 0 */
        bl printf                                       /* Prints space */
        add r6, r6, #2                                  /* Adds spread by 2 */

compare_spread:
        cmp r6, #24                                     /* Compares spaces to 24 */
        bne loop_spread                                 /* While spread doesn't equal 24 jump to loop_spread */
    
        ldr r0, address_of_star                         /* Loads address of star into register 0 */
        bl printf                                       /* Prints star */
    
        ldr r0, address_of_new_line                     /* Loads address of end line into register 0 */
        bl printf                                       /* Prints \n to create new line */

loop_row: 
        sub r5, r5, #1                                  /* Subtracts rows by 1 */

compare_row:
        cmp r5, #0                                      /* Compares rows to 0 */
        bne spaces_sub_spread_add                       /* While rows doesn't equal 0 jump to spaces_sub  */

base:
        ldr r0, address_of_bottom                       /* Loads address of bottom into register 0 */
        bl printf                                       /* Prints bottom */

end:
        ldr r4, address_of_return                       /* Loads address of return into register 4 */
        ldr lr, [r4]                                    /* Loads memory cell of register 4 into link register */
        bx lr                                           /* Exits program */

address_of_row: .word row
address_of_top: .word top
address_of_space: .word space
address_of_star: .word star
address_of_new_line: .word new_line
address_of_count: .word count
address_of_spread: .word spread
address_of_bottom: .word bottom
address_of_return: .word return