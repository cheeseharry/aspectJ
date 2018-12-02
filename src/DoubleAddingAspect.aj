public aspect DoubleAddingAspect {

    // 2 Double the amount of each deposit by adding the deposit amount to the balance in the account

    pointcut depositAfter(Account s, double value):
            withincode(public void moneyTransfer(Account, Account, double))
                    && call(public void deposit(double))
                    && target(s)
                    && args(value);

    after(Account s, double value):
            depositAfter(s,value) {
        try {
            s.withdraw(-value);
        }catch(Exception e){}
    }
}
