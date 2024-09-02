public class AccountTriggerHandler {
    
    public static void createOpp(List<Account> accList){
        List<opportunity> oppList = new List<opportunity>();
        
        for(Account acc : accList){
            opportunity opp = new opportunity();
            opp.Name = acc.Name;
            opp.stageName = 'Prospecting';
            opp.Closedate = system.today();
            opp.AccountId = acc.Id;
            oppList.add(opp);
        }
        if(!oppList.isEmpty()){
            insert oppList;  
        }
    }
    
    public static void UpdateDes(List<Account> accList){
        for (Account acc : accList){  
        acc.Description = 'Account is Craeted';
    }
}
    public static void populateRating(List<Account> accList){
        for (Account acc : accList){  
            if(acc.Industry != Null && acc.Industry == 'Media'){
               acc.Rating = 'Hot';
            }
    }
}
}