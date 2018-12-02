public aspect ServiceFeeAspect {

    // 4 Implement a service fee by charging a fixed fee, (e.g. $1) to each account involved in a money transfer.

    pointcut serviceFee(MoneyTransferService s, Account acc1,
                               Account acc2, double amount):
            execution(public void moneyTransfer(Account, Account, double))
                    && target(s)
                    && args(acc1,acc2,amount);


    after(MoneyTransferService s, Account acc1, Account acc2, double amount):
            serviceFee(s,acc1,acc2,amount) {
        try{
            acc1.withdraw(1);
            acc2.withdraw(1);
        }catch(Exception e){}
    }
}
