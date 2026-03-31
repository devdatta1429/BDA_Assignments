class Uncle{
	void method(){
    System.out.println("here method is called");
    // this called by method.
    // method name can be diff. but u have call.
    // when we create a object we have have to call the method
    }
}

class Child{
	// this is called by constructors
    // in this main class and constrctor name should be same for run
	Child(){
    	System.out.println("child Constructor is called");}
        }

class Main {
  public static void main(String[] args) {
  // 1. Creating the object triggers the constructor automatically
  Child c = new Child();

  // 2. Creating the object, then calling the method manually
  Uncle u = new Uncle();
  u.method();
    }
}

i sthat correct