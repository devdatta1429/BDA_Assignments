package demo;
import java.util.Scanner;

public class Count{
	public static void main(String[] args){
		Scanner scn = new Scanner(System.in);
		int count = 0;

		while(scn.hasNext()){
			scn.next();
			count++;
		}
		System.out.println(count);
		scn.close();
	}
}