public class dmldemo {
    public static void insertdemo(){
        
        List< Account > accList = New List < Account >();
            
            for(integer i=1;i<=200;i++){
              Account acc = new Account();
              acc.Name ='Test bulk'+i;
              acc.Active__c ='Yes';
                accList.Add(acc);
            }
        insert accList;
        
        /*   List<Account> accList = new List<Account>();
List<contact> conList = new List<contact>();

Account acc = new Account ();
acc.Name = 'Testdml2';
acc.Active__c = 'Yes';
accList.Add(acc);

Account acc1 = new Account ();
acc1.Name = 'Testdml3';
acc1.Active__c = 'Yes';
accList.Add(acc1);  

insert accList;

Contact con = new Contact ();
con.FirstName  = acc.Name;
con.LastName  = acc.Name ;
con.AccountId = accList[0].Id;
conList.Add(con);  

Contact con1 = new Contact ();
con1.FirstName  = acc1.Name;
con1.LastName  = acc1.Name ;
con1.AccountId = accList[1].Id;
conList.Add(con1);  
insert conList; */
        
    }
}