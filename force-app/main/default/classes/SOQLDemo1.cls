public class SOQLDemo1 {
    
    public static void aggdemo(){
      AggregateRESult[]aggdemo=[SELECT Account.Name, Sum(Amount) amt
                 FROM opportunity
                GROUP BY Account.name];
        system.debug(aggdemo);
        
        for(AggregateResult AG : aggdemo){
            system.debug('Account ID='+AG.get(Account.Name));
           //system.debug('Amount='+AG.get(amt));
        }
       
    }

}