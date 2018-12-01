public class Account{

private String clientName;
private int accountNumber;
private double balance;
private static int accNum = 123456;

 public Account() 
   { 
      clientName = "";
      accountNumber = accNum++;
      balance = 0;
   }
   
 public Account(String name, int acc, double bal) 
   { 
      clientName = name;
      accountNumber = acc;
      balance = bal;
   }

public void deposit(double value){
    if(value > 0) {
        balance = balance + value;
        System.out.println(value + " deposited into account:" + getAccNumber());        
	  }
} //end of method

public void withdraw(double value){
    if(balance > value){
        balance = balance - value;
        System.out.println(value + " withdrawn from account:" + getAccNumber());
	  }
}//end of method

public double getBalance(){
   return balance;
}//end of method

public int getAccNumber(){
   return accountNumber;
}//end of method
   
public void info (String s) 
   { 
      System.out.println( s );
   }    

}

