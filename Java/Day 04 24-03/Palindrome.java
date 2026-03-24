// Accept a number and print whether it is palindrome or not. 
// A number is said to be palindrome if it remains same even after reversing it.
// Some of the palindrome examples are:

// 12321
// 121
// 2567652


// Input : 12321
// Output : palindrome

// Input : 24532
// Output : not a palindrome

// Input : 2
// Output : palindrome

import java.util.Scanner;

public class Pallindrome {
    public static void main(String[] args) {
        Scanner scn = new Scanner(System.in);
        
        int n = scn.nextInt();
        int og = n;
        int rev1 = 0;

        while (n > 0) {
            int rem = n % 10;
            rev1 = rev1 * 10 + rem;
            n = n / 10;
        }

        if (og == rev1) {
            System.out.println("palindrome");
        } else {
            System.out.println("not a palindrome");
        }
        
        scn.close();
    }
}
