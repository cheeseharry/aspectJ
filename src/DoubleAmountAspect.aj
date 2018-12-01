public aspect DoubleAmountAspect {
    // 1 Double the amount of each deposit by doubling the values of the parameter supplied to the deposit method.

    pointcut depositAfter(Account s, double value):
            withincode(public void moneyTransfer(Account, Account, double))
                    && call(public void deposit(double))
                    && target(s)
                    && args(value);

    after(Account s, double value):
            depositAfter(s,value) {
        try {
            s.deposit(value);
        }catch(Exception e){}
    }
}
