public class DMLDemo2 {
    public static void upsertdemo(){
        List<Account> accList = new List<Account>();
        accList = [SELECT Id,NAme,Industry FROM Account 
                   WHERE Rating =''];
        if(accList.size()>0){
            for(Account acc : accList){
                acc.Industry='media';
            }
        }
        for(integer i=1;i<=5;i++){
            Account acc=new Account();
            acc.Name ='upsert'+i;
            accList.Add(acc);
        }
        upsert accList;
    }

}