trigger scenario5Trigger on Account (Before insert,Before Update , After insert) {
    if(Trigger.isUpdate || Trigger.isInsert){
        if (Trigger.isBefore)   {
            scenario5.updateSales(Trigger.new, Trigger.oldMap);
        } 
    }
        if(Trigger.isInsert){   
            if (Trigger.isAfter)   {
                scenario5.createCon(Trigger.new);
            }   
        }
    }