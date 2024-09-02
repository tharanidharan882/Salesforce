public class AccountDemo {
    @AuraEnabled
    public static Account AccountInsert(Account Account) {
       insert Account;
       return Account;
    }

    @AuraEnabled (cacheable=true)
	public static List<Account> getAccount(){
		List<Account> accList = [Select Id, Name, Rating FROM Account];
				return accList;
		
	}
    @AuraEnabled
	public static string deleteAllAccount(List<Account> idList){
		List<Account> accList = [Select Id, Name, Rating FROM Account where Id in :idList];
		if (accList.size() > 0) {
			delete accList;
           return 'Success';
		}	
        return 'failed';
	}
    @AuraEnabled
	public static void deleteAccount(string accountId){
		List<Account> acc = [Select Id, Name, Rating FROM Account where Id = :accountId];
		if (acc.size() > 0) {
			delete acc;
		}			
	}
    
    @AuraEnabled
    public static void updateAccount(Account account) {
        try {
            Account existingAccount = [SELECT Id, Name, Rating, Active__c FROM Account WHERE Id = :account.Id LIMIT 5];
            existingAccount.Name = account.Name;
            existingAccount.Rating = account.Rating;
            existingAccount.Active__c = account.Active__c;
            update existingAccount;
        } catch (Exception e) {
            throw new AuraHandledException('Error updating record: ' + e.getMessage());
        }
    }
}
