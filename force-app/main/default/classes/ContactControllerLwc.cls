public  class ContactControllerLwc {
    public ContactControllerLwc() {

    }
    @AuraEnabled(cacheable = true)
    public static List<Contact> getContactList() {
        return [select Name, Type__c, Email, Phone,AccountId , Account.Name From Contact ORDER BY Name];
    }

    @AuraEnabled
    public static List<Contact> getSearchContactList(String search) {
        return [select Name, Type__c, Email, Phone, Account.Name, AccountId 
                           From Contact
                           WHERE Name Like :  '%' + search + '%' 
                           OR  Email Like :  '%' + search + '%'
                           ORDER BY Name];
    }
}