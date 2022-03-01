@IsTest
public with sharing class TestClass {
    @IsTest
    static void TestDeleteAccountWithOneOpportunity(){
        Account acc = TestFactory.getAccount('Test Account', true);
        Opportunity opp = TestFactory.getOpportunity(acc, 200, 'Prospecting', false);
        Test.startTest();
        Database.DeleteResult result = Database.delete(acc, false);
        Test.stopTest();
        System.assert(!result.isSuccess());
        System.assert(result.getErrors().size() > 0);
        System.assertEquals('Cannot delete account with related opportunities.', result.getErrors()[0].getMessage());
    }
}