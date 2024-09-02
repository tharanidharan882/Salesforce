public class SOQLDemo {
    
    public static void demosoql(){
        List<Account>accList = [SELECT Id,Name,Industry,Rating 
                                FROM Account 
                                WhERE Industry = 'Media' AND Rating ='Hot'
                               ORDER BY Name ASC];
        
        
        for(Account Acc : accList){
            system.debug(Acc);
            
            
        }
        
    }
}