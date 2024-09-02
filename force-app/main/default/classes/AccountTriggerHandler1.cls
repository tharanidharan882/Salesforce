public class AccountTriggerHandler1 {
     public static void updateAccount(List<Account>accList, Map<Id,Account>accOldMap){
         
      List<Account> accToBeUpdated = new List <Account>();
         for(Account acc : accList)   {
             Account a = new Account();
                 a.Id = acc.Id ;
                 a.Description = 'Test recursion';
                 accToBeUpdated.add(a);
             }
             if(!accToBeUpdated.isEmpty()){
                 Update accToBeUpdated;
             }
         }      
     }     
     
     /*public static void updateRelatedContact(List<Account>accList, Map<Id,Account>accOldMap){
         List<Contact> conList = new List<Contact>();
         Map<Id,Account> accMap = new Map<Id,Account>();
         
         for(Account acc : accList){
             if(acc.Phone != accOldMap.get(acc.Id).Phone){
                 accMap.put(acc.Id,acc);
             }
         }
         for(contact con : [SELECT Id,Homephone,AccountId FROM contact
                            WHERE AccountId IN : accMap.keySet()]){
                                if(accMap.Containskey(con.AccountId)){
                                 con.HomePhone =accMap.get(con.AccountId).phone;
                                    conList.add(con);
                                }
                                
                            }
             if(!conList.isEmpty()){
                 update conList;
             }
    
    
    
      /* public static void updatePhone(List<Account>accList, Map<Id,Account>accOldMap){
        for(Account acc : accList){
            if(acc.phone != accoldMap.get(acc.Id).phone){
                acc.Description = 'phone updated | old value ='+accoldMap.get(acc.Id).phone + 'new value =' +acc.phone;
            }
        } */