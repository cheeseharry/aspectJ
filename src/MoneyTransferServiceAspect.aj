public aspect MoneyTransferServiceAspect {

    //Problem 1: Initiate a transaction each time a money transfer begins.
//           Close the transaction when the money transfer ends.

    pointcut manageTransaction(MoneyTransferService s, Account acc1,
                               Account acc2, double amount):
            execution(public void moneyTransfer(Account, Account, double))
                    && target(s)
                    && args(acc1,acc2,amount);

    before (MoneyTransferService s, Account acc1, Account acc2, double amount):
            manageTransaction(s,acc1,acc2,amount) {
        try{
            s.info("Transaction initiated...");
        }catch(Exception e){}
    }

    after(MoneyTransferService s, Account acc1, Account acc2, double amount):
            manageTransaction(s,acc1,acc2,amount) {
        try{
            s.info("Transaction committed...");
        }catch(Exception e){}
    }

    // Problem 2: DOUBLE the deposit amount for each transaction.

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
