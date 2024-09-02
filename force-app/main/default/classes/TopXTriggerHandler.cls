public class TopXTriggerHandler {
    public static void opportunityUpdate(List<Top_X_Designation__c> topList){
        /*List<Opportunity>OpportunityList =[SELECT Id,Name,(select id,name from Top_X_Designations__r )from Opportunity];*/
        
        Map<id, List<Top_X_Designation__c>> oppDesMap = new Map<id, List<Top_X_Designation__c>>();
         for(Top_X_Designation__c tg : topList){
            
            if(oppDesMap.containsKey(tg.Opportunity__c)){
                List<Top_X_Designation__c> desList = oppDesMap.get(tg.Opportunity__c);
                desList.add(tg);
                oppDesMap.put(tg.Opportunity__c, desList);
                
            }
            else{
                List<Top_X_Designation__c> desList = new List<Top_X_Designation__c>();
                desList.add(tg);
                oppDesMap.put(tg.Opportunity__c, desList);
            }
           
        }
        for(Top_X_Designation__c tg : topList){
          List<Top_X_Designation__c> FinalTgList = oppDesMap.get(tg.Opportunity__c);
            Opportunity opp = new Opportunity();
            for(Top_X_Designation__c finalTg : FinalTgList){
                if(tg.Opportunity__c != null){
                    if((finalTg.Type__c == 'Contract Flow'||finalTg.Type__c == 'Handoff') && finalTg.Document_Attached__c == True){
                        opp.Handoff_Attached__c = True;
                    }else{
                        opp.Handoff_Attached__c = False;
                        Break ;
                    }
                    
                }          
            }
        }
    }
}

/* List<Opportunity> oppList = new List<Opportunity>();
List<Top_X_Designation__c> topDesignationList = [SELECT Id,Name,Type__c,Document_Attached__c,Opportunity__r.Id,Opportunity__r.Handoff_Attached__c from Top_X_Designation__c];
for(Top_X_Designation__c tg : topDesignationList){
Opportunity opp = new Opportunity();
if(opp.id != null ){
if((tg.Type__c == 'Contract Flow'||tg.Type__c == 'Handoff') && tg.Document_Attached__c == True){
opp.Handoff_Attached__c = True;
}else{
opp.Handoff_Attached__c = False;
}
oppList.add(opp);
}
if(!topList.isEmpty){
update oppList;
}

AggregateRESult[]aggdemo = [select id,name,Handoff_Attached__c from Top_X_Designation__c group by Opportunity__c ];
AggregateRESult[] agg = aggdemo();
if(affdemo.Handoff_Attached__c == True){}



----- for(Top_X_Designation__c tg : topList){
Opportunity opp = new Opportunity();
if((tg.Type__c == 'Contract Flow'||tg.Type__c == 'Handoff') && tg.Document_Attached__c == True){
opp.Handoff_Attached__c = True;
}else{
opp.Handoff_Attached__c = False;
}
oppList.add(opp);
}

if(!topList.isEmpty()){
update oppList;
}
} */