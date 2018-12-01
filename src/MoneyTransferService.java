public class MoneyTransferService
{

   Account acc1, acc2;

   public MoneyTransferService () 
   { 
      System.out.println("\nMoneyTransferService object created");

   }

   
 public void moneyTransfer (Account a1, Account a2, double amount) 
   { 
      info("BEFORE TRANSACTION: Balance of Account: " + a1.getAccNumber() + " is " + a1.getBalance());
      info("BEFORE TRANSACTION: Balance of Account: " + a2.getAccNumber() + " is " + a2.getBalance());
      a1.withdraw(amount);
      a2.deposit(amount);
      info("AFTER TRANSACTION: Balance of Account: " + a1.getAccNumber() + " is " + a1.getBalance());
      info("AFTER TRANSACTION: Balance of Account: " + a2.getAccNumber() + " is " + a2.getBalance());
   }

 public void info (String str) 
   { 
      System.out.println( "MoneyTransferService: " + str );
   }
   
}

