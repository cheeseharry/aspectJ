public aspect AccountValidationAspect {

    //Problem 10: Account Name

    pointcut manageTransaction(MoneyTransferService s, Account acc1,
                               Account acc2, double amount):
            execution(public void moneyTransfer(Account, Account, double))
                    && target(s)
                    && args(acc1,acc2,amount);

    before (MoneyTransferService s, Account acc1, Account acc2, double amount):
            manageTransaction(s,acc1,acc2,amount) {
        try{
            s.info("Is " + acc1.getAccNumber() + " your account?");
        }catch(Exception e){}
    }
}
