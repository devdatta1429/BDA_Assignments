// Write a program to print a pyramid with given height.

import java.util.Scanner;

public class Pyramid{
    public static void main(String[] args){
        Scanner scn = new Scanner(System.in);

        int count = scn.nextInt();

        for (int i = 1 ; i <= count; i++){
            for (int j = 1 ; j <= i; j++){
                System.out.print("*");
            }
        
        System.out.println();
          
        }
        scn.close();
    }
}
