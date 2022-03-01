@IsTest
public with sharing class TestFactory {
    public static Account getAccount(String name, Boolean doInsert){
        Account a = new Account(name = name);
        if(doInsert){
            insert a;
        }
        return a;
    }

    public static Opportunity getOpportunity(Account a, Integer Amount,String StageName,Boolean doInsert){
        Opportunity o = new Opportunity();
        o.AccountId = a.Id;
        o.Amount = Amount;
        o.StageName = StageName;
        o.CloseDate = Date.today();
        o.Name = a.Name + ' Opportunity';
        if(doInsert){
            insert o;
        }
        return o;
    }
}