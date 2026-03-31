import java.util.Scanner;
public class DiceRotation {
	int T;int M;int F;int B;int L;int R;

	DiceRotation(int T,int M,int F,int B,int L,int R){
		this.T=T;
		this.M=M;
		this.F=F;
		this.B=B;
		this.L=L;
		this.R=R;
	}

	 int[] operations(String o) {
		int temp1;
		int temp2;
		int[] output = new int[6];
		switch(o) {
			case "MU":
				temp1=T;
				temp2=M;
				T=F;
				M=B;
				F=temp2;
				B=temp1;
				L=L;
				R=R;
				System.out.println(T);
				output[0]=T;output[1]=M;output[2]=F;output[3]=B;output[4]=L;output[5]=R;
				break;
				
			case "MR":
				temp1=F;
				temp2=B;
				T=T;
				M=M;
				F=L;
				B=R;
				L=temp2;
				R=temp1;
				System.out.println(T);
				output[0]=T;output[1]=M;output[2]=F;output[3]=B;output[4]=L;output[5]=R;
				break;
			case "MD":
				temp1=T;
				temp2=M;
				T=B;
				M=F;
				F=temp1;
				B=temp2;
				L=L;
				R=R;
				System.out.println(T);
				output[0]=T;output[1]=M;output[2]=F;output[3]=B;output[4]=L;output[5]=R;
				break;
			case "ML":
				temp1=F;
				temp2=B;
				T=T;
				M=M;
				F=R;
				B=L;
				L=temp1;
				R=temp2;
				System.out.println(T);
				output[0]=T;output[1]=M;output[2]=F;output[3]=B;output[4]=L;output[5]=R;
				break;
		}
		return output;
	}

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		int T = sc.nextInt();
		int M = sc.nextInt();
		int F = sc.nextInt();
		int B = sc.nextInt();
		int L = sc.nextInt();
		int R = sc.nextInt();
		
		int n = sc.nextInt();
		
		String[] arr = new String[n];
		for (int i=0;i<n;i++) {
			arr[i]=sc.next();
		}
		
		DiceRotation d = new DiceRotation(T,M,F,B,L,R);
		
		int[] result = new int[6];
		for (int j=0;j<n;j++) {
			result=d.operations(arr[j]);
		}
		
		for (int i=0;i<6;i++) {
			System.out.print(result[i]+" ");
		}
		System.out.println();
	}
}
