trigger scenario5contactTrigger on Contact (After insert,After delete,After Update) {
 if(Trigger.isInsert || Trigger.isDelete || Trigger.isUpdate ){
        if (Trigger.isAfter)   {
            scenario5.updateAccount(Trigger.new);
            scenario5.updatecontactsize(Trigger.new, Trigger.oldMap);
        } 
    }
}