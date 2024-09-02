public class Mapwithsetandlistdemo {
    
    public static void Sobjectdemo(){
        
    List<Account> intset = new List<Account>();
    intset =[SELECT NAME FROM Account LIMIT 5];
        
    Map<Id , Account> accMap = new Map<Id, Account>();
        
        For(Account acc : intset){
            accMap.put(acc.Id , acc);
        }
        
    system.debug('key contains..'+accMap.keyset());
    system.debug('key contains..'+accMap.values());
}
}