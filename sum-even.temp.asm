; Name: Akasha Fatima
; Reg. No.: 23-NTU-CS-1132
; Topic: Program to find sum of all even values in the array
; ------ Program to count total even values and displaying results
INCLUDE c:\Users\abc\.vscode\extensions\istareatscreens.masm-runner-0.4.5\native\irvine\Irvine32.inc 
.data 
array SWORD 17, 6, 5, 10, 20
msg1 byte "Sum of all even values in array is: ", 0
msg2 byte "Total even values in array is: ", 0
msg3 byte "Array doesn't have any even value! ", 0
.code 
main proc 
call clrscr
    mov esi,OFFSET array    	    ; moving array to source index
    mov ecx,lengthof array     	    ; ECX = length of the "array"
    mov eax, 0                 		    ; Initializing "EAX" to 0 for storing sum 
    mov ebx, 0                	      ; Initializing "EBX" to 0 for storing the count 
; --------------- Calculating Sum of even values ----------------------
next_value:
    test WORD PTR [esi], 1     	    ; Test the least significant bit (odd/even)
    jnz skip_value            		    ; Skip if odd (LSB = 1)
    add ax, WORD PTR [esi]
    inc ebx                    		    ; Increment EBX to count even values
skip_value:
    add esi, TYPE array        ; Move to next index of array
    loop next_value 
    cmp ebx, 0
    je no_even_values        
; ------------------------ Display Results -------------------------
    mov edx, offset msg1
    call writestring
    mov eax, eax
    call WriteInt 
    call crlf 
; ---------------- Display total even number's count -------------------
    mov edx, offset msg2
    call writestring
    mov eax, ebx
    call writedec
    call crlf
    call crlf
    exit
; ----------------- Case: all non-even elements in arary ------------
no_even_values:
    mov edx, offset msg3
    call writestring
    call crlf 
 exit 
main endp 
end main
