public class CaseTriggerHandler {
    public static void updateInCase(List<case> caseList){
       
        for(Case cas : caseList){
            if(cas.Origin=='Email'){
                cas.Status='new';
                cas.Priority='Medium';
            }
        } 
    } 
}