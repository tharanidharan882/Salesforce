public class SOQLWithLOOP {
    Public static void demo(){
         
        List<Account> accList = new List<Account>();
            accList = [SELECT Id , name ,(SELECT Id, Firstname, Lastname from contacts)from Account];
                
                for( Account acc : accList){
                    system.debug('Account Name :'+ acc.Name);
                        for(Contact con : acc.contacts){
                            system.debug(con.Firstname+''+con.Lastname);
                        }
                    }
                }
            }