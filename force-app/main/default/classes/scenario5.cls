public class scenario5 {
    
    public static void updatecontactsize(List<contact> conList , Map<Id,Contact> oldconMap){
        set<id> accountDetails = new set<Id>();
        List<Account>accList = new List<Account>();
        
        for(Contact con : conList){
            if(con.AccountId != Null){
            accountDetails.add(con.AccountId);
        }
        }
        if(oldconMap != null){
        for(contact oldcon : oldconMap.values()){
            if(oldcon.AccountId !=Null){
            accountDetails.add(oldcon.AccountID);
        }
        }
        }
        for(Account acc : [SELECT Id,(select id,Name from contacts) FROM Account WHERE Id In : accountDetails]){
            acc.Number_of_Contacts__c = acc.contacts.size();
            accList.add(acc);
        }  
        if(!accList.isEmpty()){
            update accList ;
        }
    }
    
    
    public static void updateAccount(List<contact> conList){
        set<id> accountDetails = new set<Id>();
        List<Account>accList = new List<Account>();
        
        for(Contact con : conList){
            accountDetails.add(con.AccountId);
        }
        for(Account acc : [SELECT Id,(select id,Name from contacts) FROM Account WHERE Id In : accountDetails]){
            string contactnames='';
            for(Contact con : acc.contacts){
                contactnames = contactnames + con.Name;
            }
            acc.BillingCity = contactnames;
            accList.add(acc);
        }  
        if(!accList.isEmpty()){
            update accList ;
        }
    }
    
    public static void updateSales(List<Account>accList , map<Id,Account>oldaccList){
        for(Account acc : accList){
            if(oldaccList != Null){
                acc.Sales_Rep__c = oldaccList.get(acc.Id).Sales_Rep__c   +   acc.OwnerId; 
            }else
                acc.Sales_Rep__c = acc.OwnerId;
        } 
    }
    public static void createCon(List<Account> accList){
        List<contact> conList = new List<contact>();
        
        for(Account acc : accList){
            if(acc.NumberofLocations__c != Null){
                
                for(integer i=0;i<=acc.NumberofLocations__c;i++){
                    contact con = new contact();
                    con.AccountId = acc.Id ;
                    con.LastName = 'Test'+i;
                    conList.add(con);
                }
            }
            if(!conList.isEmpty()){
                insert conList;  
            }
        }
    }
}