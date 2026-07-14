// ## Problem Statement 
// Given a range of alphabets, find the missing alphabet.
// E.g. A B C D F G – Missing alphabet is 'E'
// Assume that the given range of alphabets will be in capital case only. Also the alphabets may not be proper sequence

// ## Input Specification 
// 1.	First line contains starting alphabet in the range and ending alphabet in the range, separated by space. 0 > number of alphabet in the given range (N)
// 2.	N-1 alphabets in the given range
 
// ## Output Specification 
// 1.	Print the missing alphabet in the given range of alphabet	
// 2.	The output should be terminated by a newline character

// Sample I/O
// Sample 1 
// ## Input-1
// A G
// A B C D F G	
// ## Output-1
// E
  
// Sample 2 
// ## Input-2
// A Z
// A B D C E G F H I J K L N O P Q R T S U V W X Z Y
// ## Output-2
// M



import java.util.Scanner;

public class alpha {
    public static void main(String[] args) {
        Scanner scn = new Scanner(System.in);

        char start = scn.next().charAt(0);
        char end = scn.next().charAt(0);
        // String str = 
        int actual_sum = 0;
        for (char i = start; i <= end; i++) {
            actual_sum += (int) i;
        }

        int sum = 0;
        int inputs = (end - start);
        for (int i = 0; i < inputs; i++) {
            if (scn.hasNext()) {
                sum += (int) scn.next().charAt(0);
            }
        }

        int remain = actual_sum - sum;
        System.out.println((char) remain);
        scn.close();
    }
}
