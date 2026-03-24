// Write a program for print the number of days in a month, given the month (1-12) and Year (YYYY).
// Where 1 for January and 12 for December. If the month value not valid print '-1';

import java.util.Scanner;

public class NoDaysMonth {
    
    public static void year1(int year) {
        if (year > 1754) {
            if ((year % 4 == 0 && year % 100 != 0) || year % 400 == 0) {
                System.out.print("29");
            } else {
                System.out.print("28");
            }
        } else {
            if (year % 4 == 0) {
                System.out.print("29");
            } else {
                System.out.print("28");
            }
        }
    }

    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);

        int year = input.nextInt();
        int month = input.nextInt();

        switch (month) {
            case 1:
            case 3:
            case 5:
            case 7:
            case 8:
            case 10:
            case 12:
                System.out.println("31");
                break;
            case 4:
            case 6:
            case 9:
            case 11:
                System.out.println("30");
                break;
            case 2:
                year1(year);
                break;
        }
        
        input.close();
    }
}
