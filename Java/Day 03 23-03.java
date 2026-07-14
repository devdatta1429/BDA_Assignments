import java.util.Scanner;

public class Main{
    public static void main(String[] args){
        System.out.println("Hello World");
        Scanner scn = new Scanner (System.in);
        
        System.out.print("Enter Your name :");
        String name = scn.nextLine();
        
        System.out.print("Enter Your age :");
        int age = scn.nextInt();
        
        System.out.println("Hello "+ name +". Your age is "+ age);
    }
}
