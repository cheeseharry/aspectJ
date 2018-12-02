public aspect TransferBenefitAspect {

    // 3 Add a money transfer benefit for the customer by adding 10% to the deposit amount for each money transfer
    pointcut depositAfter(Account s, double value):
            withincode(public void moneyTransfer(Account, Account, double))
                    && call(public void deposit(double))
                    && target(s)
                    && args(value);

    after(Account s, double value):
            depositAfter(s,value) {
        try {
            s.deposit(1.1*value);
        }catch(Exception e){}
    }
}
