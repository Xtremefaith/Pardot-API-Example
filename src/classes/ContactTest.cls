/**
 * @class CONTACTS TEST CLASS
 * @description Unit test for Contacts object
 *
 * @author  Nick Worth
 * @created 10/23/2014
 * @version 1.0
 * @dependency SmartFactory Class (https://github.com/mbotos/SmartFactory-for-Force.com)
 */

@isTest
private class ContactTest {

	/**
	 * CREATE A BASIC CONTACT
	 * Create a contact with minimum requirements
	 */
	@isTest static Account createAccount() {
		/* Create an Account for the Contact */
    	Map <String, String> accountRecordTypes = ApexToolbox.getRecordTypes('Account');
        Account account = new Account(
        	Name='Sample Account', 
        	GPI__c = 1
        );
		INSERT account;
		return account;
	}

	/**
	 * CREATE A BASIC CONTACT
	 * Create a contact with minimum requirements
	 */
	@isTest static Contact createContact_basic() {
		Account account = createAccount();
		Contact contact = new Contact(
			FirstName='John',
			LastName='Smith',
			AccountId=account.Id,
			Phone='123.456.789',
			Mapping_Address__c = 'Shipping',
			OtherStreet = '300 W Washington St',
			OtherCity = 'Phoenix',
			OtherState = 'AZ',
			OtherPostalCode = '85003',
			OtherCountry = 'USA'
		);

		INSERT contact;
        return contact;
	}

	/**
	 * CREATE A COMPLETE CONTACT
	 * Contact includes all required details
	 */
	@isTest static Contact createContact_complete(){
		Account account = createAccount();
		Contact contact = new Contact(
			FirstName='John',
			LastName='Smith',
			AccountId=account.Id,
			Email='jsmith@jscompany.com',
			Phone='123.456.789',
			Mapping_Address__c='Shipping',
			MailingCity='Glendale',
			MailingCountry='USA',
			MailingPostalCode='85382',
			MailingState='AZ',
			MailingStreet='123 N. Test St',
			OtherCity='Glenale',
			OtherPostalCode='85382',
			OtherState='AZ',
			OtherCountry='USA',
			OtherStreet='123 N. Test St'			
		);
		INSERT contact;
        return contact;
	}

	/**
	 * DELETE A CONTACT
	 * Delete a Contact
	 * @uses createContact_complete()
	 * TODO: Fix the GeoLocationUtlity causing this to fail
	 */
	// @isTest static Contact deleteContact(){
	// 	Contact contact = createContact_complete();
	// 	Test.startTest();
	// 		DELETE contact;
	// 	Test.stopTest();
 //        return contact;
	// }

	/**
	 * UNDELETE A CONTACT
	 * Delete a Contact
	 * @uses createContact_basic()
	 * TODO: Fix the GeoLocationUtlity causing this to fail
	 */
	// @isTest static Contact undeleteContact(){
	// 	Contact contact = deleteContact();
	// 	UNDELETE contact;
 //        return contact;
	// }

	/**
	 * ADD EMAIL
	 * Update email on a basic contact
	 */
	@isTest static void addEmail(){
		Contact contact = createContact_basic();
		Contact.Email = 'jsmith@smithandco.com';
		
		Test.startTest();
        	update contact;
        Test.stopTest();
	}

	/**
	 * ADD PHONE
	 * Update email on a basic contact
	 */
	@isTest static void addPhone(){
		Contact contact = createContact_basic();
		contact.Phone = '123456789';
		
		Test.startTest();
        	update contact;
        Test.stopTest();
	}
		
}