public aspect MethodMessageAspect {

    // 6 Prints a message every time the account balance is set.

    pointcut messageToSet(MoneyTransferService s, Account acc1,
                          Account acc2, double amount):
            execution(public void moneyTransfer(Account, Account, double))
                    && target(s)
                    && args(acc1,acc2,amount);


    after(MoneyTransferService s, Account acc1, Account acc2, double amount):
            messageToSet(s,acc1,acc2,amount) {
        try{
            System.out.println("method executed");
        }catch(Exception e){}
    }
}
