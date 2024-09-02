public class DMLdemo1 {
    public static void updatedemo(){
        
        List<Account> accList = new List<Account>();
        
        accList = [SELECT Id , Name , Industry FROM Account WHERE Rating='Hot'];
        if(accList.size()>=0){
            for(Account acc : accList ){
                acc.Industry = 'media';
            }
            update accList;
        }
    }

}