trigger scenario3Trigger on Account (After insert) {
  if(Trigger.isInsert){
         if (Trigger.isAfter)   {
                scenario3.createCon(Trigger.new);
            }   
}
}