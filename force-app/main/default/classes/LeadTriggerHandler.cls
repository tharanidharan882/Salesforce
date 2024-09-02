public class LeadTriggerHandler {
      public static void updateLead(List<Lead>LeadList){
        for(Lead Lea : LeadList){
            if(Lea.LeadSource == 'Web'){
                Lea.Rating = 'Cold';
            }else
                Lea.Rating = 'Hot';
        }
    }
}