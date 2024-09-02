public class LightningApexSectionController {

	@AuraEnabled(cacheable=true)
	public static List<WrapperClass> getContact(string nameValue){
			String searchText = '%' + nameValue + '%';
			if(nameValue != null )
				return [Select Id, FirstName, LastName, email, Account.Name FROM Contact WHERE Name like : searchText ];
			else
				return [Select Id, FirstName, LastName, email, Account.Name FROM Contact ];
	}

	@AuraEnabled
	public static Contact insertContact(Contact contact) {
		insert contact;
		return contact;
	}

	public class WrapperClass {
		@AuraEnabled
		public Contact contact { get; set; }
		this.contact = contact;

		@AuraEnabled
		public Account account { get; set; }
	    this.account = account;

	
		}
	}
	