public class AccountRecord {
       
    public static ID insertData(string name, string rating, string active){
        Account acc = new Account();
        acc.Name= name;
        acc.Rating =rating;
        acc.Active__c= active;
        insert acc;
        return acc.ID;
        
    }

    
}