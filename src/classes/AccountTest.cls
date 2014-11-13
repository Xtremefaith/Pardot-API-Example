/**
 * @class ACCOUNTS TEST CLASS
 * @description Unit test for Accounts object
 *
 * @author  Nick Worth
 * @created 10/23/2014
 * @version 1.0
 * @dependency SmartFactory Class (https://github.com/mbotos/SmartFactory-for-Force.com)
 */

@isTest
private class AccountTest {

	/**
	 * CREATE A BASIC ACCOUNT
	 * Create a account with minimum requirements
	 */
	@isTest static Account createAccount_basic() {
		Map <String, String> accountRecordTypes = ApexToolbox.getRecordTypes('Account');
        Account account = new Account(
        	Name='Sample Account', 
        	GPI__c = 1
        );
		INSERT account;
        return account;
	}

	/**
	 * CREATE A NORMAL ACCOUNT
	 * Account only includes typical minor details
	 */
	@isTest static Account createAccount_normal(){
		Account account = new Account(
			Name='John',
			Industry='Refrigeration',
			Phone='123.456.789',
			Website='http://thejscompany.com'
		);
		INSERT account;
        return account;
	}

	/**
	 * CREATE A COMPLETE ACCOUNT
	 * Account includes all required details
	 */
	@isTest static Account createAccount_complete(){
		Account account = new Account(
			Name='John',
			Industry='Refrigeration',
			Mapping_Address__c='Shipping',
			BillingCity='Glendale',
			BillingCountry='USA',
			BillingPostalCode='85382',
			BillingState='AZ',
			BillingStreet='123 N. Test St',
			ShippingCity='Glenale',
			ShippingPostalCode='85382',
			ShippingState='AZ',
			ShippingCountry='USA',
			ShippingStreet='123 N. Test St'
		);
		INSERT account;
        return account;
	}

	/**
	 * DELETE A ACCOUNT
	 * Delete a Account
	 * @uses createAccount_complete()
	 */
	@isTest static Account deleteAccount(){
		Account account = createAccount_complete();
		Test.startTest();
			DELETE account;
		Test.stopTest();
        return account;
	}

	/**
	 * UNDELETE A ACCOUNT
	 * Delete a Account
	 * @uses createAccount_basic()
	 */
	@isTest static Account undeleteAccount(){
		Account account = deleteAccount();
		UNDELETE account;
        return account;
	}

	/**
	 * ADD PHONE
	 * Update email on a basic account
	 */
	@isTest static void addPhone(){
		Account account = createAccount_basic();
		account.Phone = '123456789';
		
		Test.startTest();
        	update account;
        Test.stopTest();
	}
		
}