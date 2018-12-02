public aspect DoubleDepositAspect {
    // 1 Double the amount of each deposit by doubling the values of the parameter supplied to the deposit method.

    pointcut depositBefore(Account s, double value):
            withincode(public void moneyTransfer(Account, Account, double))
                    && call(public void deposit(double))
                    && target(s)
                    && args(value);

    before(Account s, double value):
            depositBefore(s,value) {
        try {
            s.deposit(value*2);
        }catch(Exception e){}
    }
}
