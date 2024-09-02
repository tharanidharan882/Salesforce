public class Apexscenario {
    
    public static void demo4(){
        List<Account>accList = new List<Account>();
        
        accList= [SELECT Id, (SELECT Id FROM contacts)
                  FROM Account WHERE CreatedDate = THIS_YEAR];
        
        if(!accList.isEmpty()){
            for(Account acc : accList){
                acc.Total_Contact_Count__C = acc.Contacts.size();
            }
            update accList;
        }
            
        
  
  /* public static void demo3(){
        List<opportunity> oppList = new List<opportunity>();
        
        oppList= [SELECT Id,StageName FROM Opportunity
                 where CreatedDate = THIS_YEAR];
       if(!oppList.isEmpty()){
           for(opportunity opp : oppList){
               if(opp.StageName == 'Closed won'){
                   opp.Description = 'opportunity is Closed Won';
               }else if(opp.StageName == 'Closed lost'){
                   opp.Description = 'opportunity is Closed lost';
           }else{
                   opp.Description = 'opportunity is open';
           }
           }
           update oppList;
       }
       
    public static void demo2(){
        List<Account>accList = new List<Account>();
        
        accList= [SELECT id,Name,(SELECT Id,amount FROM Opportunities)
                 FROM Account where phone!=null];
        
        If(!accList.isEmpty()){
            for(Account acc: accList){
              decimal total = 0;
                for(Opportunity opp : acc.Opportunities){
                    total = total+ opp.amount;
                }
                system.debug(acc.Name + 'has'+total+'worth Opportunity');
            }
        }
        
        
    public static void demo1(){
        
        List<Account> accList = new List<Account>();
        
         accList = [SELECT Id,Name, (SELECT id FROM Contacts) 
                   FROM Account WHERE phone != null];
        if(!accList.isEmpty()){
        for(Account acc: accList){
            system.debug(acc.Name + ' has ' +acc.contacts.size() + 'Contacts related');
            }
    }*/
        
}
}