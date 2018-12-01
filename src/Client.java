public class Client
{

 public static void main(String[] args) {
 
      Account acc1, acc2;
      
      try { 
            MoneyTransferService service = new MoneyTransferService();     
            acc1=new Account("Gulustan", 12345, 400);
            acc2=new Account("Brian", 12346, 375);
            service.moneyTransfer(acc1, acc2, 200);
      } 
      catch(Exception e) 
      {
        e.printStackTrace();
      }
   }

   
}

