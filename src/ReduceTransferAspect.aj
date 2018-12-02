public aspect ReduceTransferAspect {
    static int count = 0;
    pointcut reduceTransfer(MoneyTransferService s, Account a1, Account a2, double amount):
            execution(public void moneyTransfer(Account, Account, double))
                    && target(s)
                    && args(a1,a2,amount);
    after(MoneyTransferService s, Account a1, Account a2, double amount):
            reduceTransfer(s,a1,a2,amount) {
        count++;
        try{
            if (count%3==0){
                a1.withdraw(0.5*amount);
            }

        }catch(Exception e){}
    }
}
