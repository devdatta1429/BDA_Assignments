public class Main {
  public static void main(String[] args) {
  int ages[] = {20, 22, 18, 35, 48, 26, 87, 70};
  int array[][] = { {1, 2, 3}, {4, 5, 6,12,15}, { 7, 8, 9}};  
  
  
  int max=ages[0];
  int min=ages[0];
  
  int len=ages.length;
  
  for(int age : ages){
  if(max<age){
  max=age;}
  if(min>age){
  min=age;}}
  
  System.out.println("Min "+min);
  
  System.out.println("max "+max);
  
  for (int i=0; i<array.length; i++){
  	for(int j=0; j<array[i].length; j++){
    	System.out.print(array[i][j]+" ");}
     System.out.println();
     }
  
  }
}