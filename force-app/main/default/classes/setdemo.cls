public class setdemo {
    
    public static void demoSObjectWithSet(){
        
       set<Id> accIds =new set<Id>();
       List<Account> accList = new List<Account>();
        
        accList = [SELECT Id FROM Account LIMIT 5 ];
        
        for (Account acc : accList){
            accIds.add(acc.Id);
        }
        
    }
    
    public static void demo(){
        set<integer> cat= new set<integer>();
        list<integer> dog= new list<integer>();
        cat.add(10);
        cat.add(20);
        dog.add(50);
        dog.add(90);
        cat.addAll(dog);
        system.debug('catcount'+ cat);
    }
    
}