public class LightningApexSectionController {
    @AuraEnabled(cacheable=true)
    public static List<ContactWrapper> getContact(String nameValue) {
        List<ContactWrapper> contactList = new List<ContactWrapper>();
        List<Contact> contacts;

        String searchText = '%' + nameValue + '%';
        // Query Contacts and their related Account Names based on the provided nameValue
        if (nameValue != null) {
            contacts = [SELECT Id, Name, FirstName, LastName, Email, Account.Name 
                        FROM Contact 
                        WHERE Name LIKE :searchText];
            system.debug(contacts);
        } else {
            contacts = [SELECT Id, Name, FirstName, LastName, Email, Account.Name 
                        FROM Contact];
            system.debug(contacts);
        }
        // Populate the wrapper list
        for (Contact contact : contacts) {
            contactList.add(new ContactWrapper(
                contact.Id, 
                contact.FirstName, 
                contact.LastName, 
				contact.Email,
                contact.Account.Name
            ));
        }
        return contactList;
    }
    // Wrapper class
    public class ContactWrapper {
        @AuraEnabled public Id contactId ;
        @AuraEnabled public String firstName ;
        @AuraEnabled public String lastName ;
		@AuraEnabled public String email;
        @AuraEnabled public String accountName;
        
        public ContactWrapper(Id contactId, String firstName, String lastName,String email, String accountName) {
            this.contactId = contactId;
            this.firstName = firstName;
            this.lastName = lastName;
            this.accountName = accountName;
			this.email = email;
        }
    }
    @AuraEnabled
    public static Contact insertContact(Contact contact) {
        insert contact;
        return contact;
    }
}
