trigger Accounttrigger on Account (before insert , after insert) {
    if(Trigger.isInsert){
        if (Trigger.isBefore){
            AccountTriggerHandler.UpdateDes(Trigger.new);
            AccountTriggerHandler.populateRating(Trigger.new);
        }
        else if (Trigger.isAfter)   {
                AccountTriggerHandler.createOpp(Trigger.new);
            }         
            
        /*    for(Account acc : Trigger.new){
                acc.Description='Account is created';
            }*/
        }
    }