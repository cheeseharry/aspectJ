public aspect TransferFeePercentAspect {

    // 9 1% transfer fees
    pointcut depositAfter(Account s, double value):
            withincode(public void moneyTransfer(Account, Account, double))
                    && call(public void deposit(double))
                    && target(s)
                    && args(value);

    after(Account s, double value):
            depositAfter(s,value) {
        try {
            s.withdraw(0.01*value);
        }catch(Exception e){}
    }

}
