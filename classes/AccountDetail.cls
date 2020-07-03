public class AccountDetail {

    @AuraEnabled(cacheable=true)
    public static list<Account> getAccountlist(string findaccount, integer accountlimit){
        List<Account> accountlist = new list<Account>();
          String key = '%' + findaccount + '%';
        if(accountlimit == 0 || accountlimit== null){
            accountlimit=10;
        }
        accountlist = [SELECT Id, Name, AccountNumber,NumberOfEmployees,Phone,Rating FROM Account WHERE Name LIKE :key  LIMIT : accountlimit ];
        return accountlist;  
    }//method
    
    @AuraEnabled(cacheable =true)
    public static list<account> getaccounts(){
        return [select Id,Name from account limit 10];
    }//method
}