trigger TopXUpdate on Top_X_Designation__c (After insert, After Update) {
    if(Trigger.isInsert  || Trigger.isUpdate ){
        if (Trigger.isAfter){
            TopXTriggerHandler.opportunityUpdate(Trigger.new);
        }
    }
}