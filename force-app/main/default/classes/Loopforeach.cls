public class Loopforeach {
    public static void showlist(){
        List<Account> accList = new List<Account>();
        Set<Id> accIds =new set<Id>();
        Map<Id,Account> accMap = new Map<Id,Account>();
        accList =[SELECT Id, NAME FROM Account LIMIT 5];
        
        if(accList.size()>0){
            for (Account acc : accList){
            system.debug(acc.Id +  '-'  +acc.NAME);
                accIds.add(acc.Id);
                accMap.put(acc.Id,acc);
                
        }
            
        }   
        if(accIds.size()>0){
            for(Id accId : accIds){
                system.debug(accId);
            }
        }
        if (accMap.size()>0){
            for(Id accId : accMap.keyset()){
                system.debug(accId);
            }
               
        }
        if (accMap.size()>0){
            for(Account acc : accMap.values()){
                system.debug(acc);
            }
        }
    }
}