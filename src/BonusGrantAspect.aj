public aspect BonusGrantAspect {

    // 7 Grant a 10% bonus for each money transfer greater than $5,000 and 5% for amounts between $1,000 and $5,000

    pointcut bonusTransfer(MoneyTransferService s, Account acc1,
                          Account acc2, double amount):
            execution(public void moneyTransfer(Account, Account, double))
                    && target(s)
                    && args(acc1,acc2,amount);


    after(MoneyTransferService s, Account acc1, Account acc2, double amount):
            bonusTransfer(s,acc1,acc2,amount) {
        try{
            if (amount > 5000) {
                acc1.deposit(0.1*amount);
                System.out.println("balance is set");
            }
            else if (amount>=1000 && amount<=5000){
                acc1.deposit(0.05*amount);
            }
        }catch(Exception e){}
    }
}
