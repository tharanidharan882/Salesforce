trigger scenario4Trigger on Account (Before insert, After insert , Before Update) {
  if(Trigger.isInsert || Trigger.isUpdate){
       
         if (Trigger.isAfter)   {
                scenario4.createCon(Trigger.new);
               scenario4.RestrictDuplicate(Trigger.new , Trigger.oldMap);
              
            }   
}
}