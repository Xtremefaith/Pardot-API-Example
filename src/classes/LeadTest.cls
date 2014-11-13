/**
 * @class LEADS TEST CLASS
 * @description Unit test for Leads object
 *
 * @author  Nick Worth
 * @created 10/23/2014
 * @version 1.0
 * @dependency SmartFactory Class (https://github.com/mbotos/SmartFactory-for-Force.com)
 */

@isTest
private class LeadTest {

	/**
	 * CREATE A BASIC LEAD
	 * Create a lead with minimum requirements
	 */
	@isTest static Lead createLead_basic() {
		Lead lead = (Lead)SmartFactory.createSObject('Lead');
		INSERT lead;
        return lead;
	}

	/**
	 * CREATE A NORMAL LEAD
	 * Lead only includes typical minor details
	 * @uses createLead_basic()
	 */
	@isTest static Lead createLead_normal(){
		Lead lead = new Lead(
			FirstName='John',
			LastName='Smith',
			Company='The JS Company',
			Email='john@thejscompany.com',
			Status='New'
		);
		INSERT lead;
        return lead;
	}

	/**
	 * CREATE A COMPLETE LEAD
	 * Lead includes all required details
	 */
	@isTest static Lead createLead_complete(){
		Lead lead = new Lead(
			FirstName='John',
			LastName='Smith',
			Company='The JS Company',
			Email='john@thejscompany.com',
			City='Glendale',
			Country='USA',
			PostalCode='85382',
			State='AZ',
			Mailing_Address__c='123 N. Test St',
			Mailing_City__c='Glenale',
			Mailing_Zipcode__c='85382',
			Mailing_State__c='AZ',
			Status='New'
		);
		INSERT lead;
        return lead;
	}

	/**
	 * DELETE A LEAD
	 * Delete a Lead
	 * @uses createLead_complete()
	 * TODO: Fix the GeoLocationUtlity causing this to fail
	 */
	// @isTest static Lead deleteLead(){
	// 	Lead lead = createLead_complete();
	// 	Test.startTest();
	// 		DELETE lead;
	// 	Test.stopTest();
 //        return lead;
	// }

	/**
	 * UNDELETE A LEAD
	 * Delete a Lead
	 * @uses createLead_basic()
	 * TODO: Fix the GeoLocationUtlity causing this to fail
	 */
	// @isTest static Lead undeleteLead(){
	// 	Lead lead = deleteLead();
	// 	UNDELETE lead;
 //        return lead;
	// }

	/**
	 * ADD EMAIL
	 * Update email on a basic lead
	 */
	@isTest static void addEmail(){
		Lead lead = createLead_basic();
		lead.Email = 'jsmith@smithandco.com';
		
		Test.startTest();
        	update lead;
        Test.stopTest();
	}

}