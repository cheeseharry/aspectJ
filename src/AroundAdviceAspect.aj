public aspect AroundAdviceAspect {

    //Problem 3: Add a method to MoneyTransferService class to log each transaction.

    public void MoneyTransferService.logTrans(int acNum1, int acNum2, double amount)
            {
                // write data to file, etc.
                System.out.println("transaction logged...");
            }

    pointcut logTransaction(MoneyTransferService s, Account a1, Account a2, double amount):
            execution(public void moneyTransfer(Account, Account, double))
                    && target(s)
                    && args(a1,a2,amount);
    void around(MoneyTransferService s, Account a1, Account a2, double amount):
            logTransaction(s,a1,a2,amount) {
        try{
            s.logTrans(a1.getAccNumber(), a2.getAccNumber(), amount);
            proceed(s,a1,a2,amount);
        }catch(Exception e){}
    }

}//end of aspect
