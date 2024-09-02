public class scenario3 {
    
    public static void createCon(List<Account> accList){
        List<contact> conList = new List<contact>();
        
        for(Account acc : accList){
            contact con = new contact();
            con.LastName = acc.Name;
            con.AccountId = acc.Id;
            conList.add(con);
        }
        if(!conList.isEmpty()){
            insert conList;  
        }
    }
}