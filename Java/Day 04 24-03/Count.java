// You have to write a program to count the number of words in the input. 
// The program should read in the input text till end_of_file (EOF) and output the number of words found.
// A word can be taken to be a sequence of alphanumeric characters terminated by a space or by a newline.
// Assume that there will not be any characters other than alphanumeric (a-z, A-Z, 0-9) and white spaces (blank, tabs and newlines) in the  input.

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
