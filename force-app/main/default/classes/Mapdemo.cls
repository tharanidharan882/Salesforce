public class Mapdemo {
    
    public static void sobjectdemo(){
        
        List<Account> accList = new List<Account>();
        Map<Id, Account> accMap = new map<Id, account>();
        
        accList =[SELECT Id, NAME FROM Account LIMIT 5];
        accMap.putAll(accList);
        system.debug('Map contains'+accList);
    }
    public static void demo(){
        Map<integer,string> colors = new Map<integer,string>();
        colors.put(1,'green');
        colors.put(2,'red');
        system.debug('Map contains...'+ colors);
        colors.put(2,'yellow');
        system.debug('Map contains...'+ colors);
        system.debug('Map contains...'+ colors.size());
        system.debug('Map contains...'+ colors.values());
        system.debug('Map contains...'+ colors.containskey(1));
    }
}