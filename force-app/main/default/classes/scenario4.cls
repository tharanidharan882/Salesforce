public class scenario4 {
    public static void RestrictDuplicate(List<Account> accList , Map<Id,Account> oldaccList){
        List<Account> accId = new List<Account>();
        
        accId = [SELECT Id,name FROM Account];
        
        for(Account acc : accList){
            for(Account bcc :accId){
            if(acc.Name == bcc.name && acc.Id != bcc.id){
                acc.addError('Duplicate Account Number');
            }
        }
    }
    }        
    /*   public static void ratingUpdate(List<Account> accList){
          
      
           AggregateResult RatingCount = [SELECT count(rating)FROM account];
            
           for(Account acc : accList){
               acc.Number_of_Cold__c = 
               
         


    } */
   
    public static void createCon(List<Account> accList){
        List<contact> conList = new List<contact>();
        
        for(Account acc : accList){
            if(acc.Industry == 'Banking'){
            contact con = new contact();
            con.LastName = acc.Name;
            con.Phone = acc.Phone;
            conList.add(con);
        }
        }
        if(!conList.isEmpty()){
            insert conList;  
        }
    }
}