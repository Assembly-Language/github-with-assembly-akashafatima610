; Name: Akasha Fatima
; Reg. No.: 23-NTU-CS-1132
; Topic: Program to find sum of all positive values in the array
; ------ Program to count total positive values and displaying results
INCLUDE c:\Users\abc\.vscode\extensions\istareatscreens.masm-runner-0.4.5\native\irvine\Irvine32.inc 
.data 
array SWORD -3, 6, 1, -10, -4
msg1 byte "Sum of all positive values in array is: ", 0
msg2 byte "Total positive values in array is: ", 0
msg3 byte "Array doesn't have any positive value! ", 0
.code 
main proc 
call clrscr
    mov esi, OFFSET array        ; moving array to source index
    mov ecx, LengthOf array      ; ECX = length of the "array"
    mov eax, 0                 	         ; Initializing "EAX" to 0 for storing sum 
    mov ebx, 0                	         ; Initializing "EBX" to 0 for storing the count 
; --------------- Calculating Sum of positive values ----------------------
next_value:
    cmp WORD PTR [esi], 0      ; Check if the current value is positive
    jle skip_value             	         ; Skip if less than or equal to 0
    add ax, WORD PTR [esi]     ; Add the positive value to the sum
    inc ebx                                   ; increment by 1 to count positive values
skip_value:
    add esi, TYPE array              ; Move to next index of array
    loop next_value 
    cmp ebx, 0
    je no_Positive_Value        
; ------------------------ Display Results -------------------------
    mov edx, offset msg1
    call writestring
    movsx eax, ax
    call WriteInt 
    call crlf 
; ---------------- Display total positive number's count -------------------
    mov edx, offset msg2
    call writestring
    mov eax, ebx
    call writedec
    call crlf
    call crlf
    exit
; ----------------- Case: all negative elements in arary ------------
no_Positive_Value:
    mov edx, offset msg3
    call writestring
    call crlf
exit 
main endp 
end main
