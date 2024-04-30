.data
prompt: .asciiz "Enter number : "
newline: .asciiz "\n"
sum: .asciiz "Sum is "
average: .asciiz " and Average is "

.text

main:
    # Initialize variables
    li $t0, 10          # Number of values to read
    li $t1, 0           # Sum of values
    li $t2, 0           # Counter

input_loop:
    # Display prompt
    li $v0, 4
    la $a0, prompt
    syscall

    # Read an integer from input
    li $v0, 5
    syscall

    # Add the entered number to the sum
    add $t1, $t1, $v0

    # Increment the counter
    addi $t2, $t2, 1

    # Check if we've read 10 numbers
    beq $t2, $t0, calculate

    # Display newline
    li $v0, 4
    la $a0, newline
    syscall

    # Repeat the loop
    j input_loop

calculate:
    # Calculate and display sum
    li $v0, 4
    la $a0, sum
    syscall

    move $a0, $t1
    li $v0, 1
    syscall

    # Calculate and display average
    li $v0, 4
    la $a0, average
    syscall

    div $t1, $t0
    li $v0, 1
    syscall

    # Exit
    li $v0, 10
    syscall

