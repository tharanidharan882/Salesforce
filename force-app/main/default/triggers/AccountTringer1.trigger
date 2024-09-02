trigger AccountTringer1 on Account (before update,After update) {
 /*   if(Trigger.isUpdate){
        if(Trigger.isBefore){
        AccountTriggerHandler1.updatePhone(Trigger.New,Trigger.OldMap);
    }*/
    if(Trigger.isUpdate){
       if(Trigger.isafter){
       /* AccountTriggerHandler1.updateRelatedContact(Trigger.New,Trigger.OldMap);*/
        if(!PreventTrigger.fristcall){
            PreventTrigger.fristcall = True;
            AccountTriggerHandler1.updateAccount(Trigger.New,Trigger.OldMap);
        }
   
       }
    }
}