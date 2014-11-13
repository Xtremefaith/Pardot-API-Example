/**
 * @trigger CONTACT TRIGGER
 * @description Handles all trigger context for contacts
 *
 * @author 	Nick Worth
 * @created 10/22/2014
 * @version 1.0
 */
trigger ContactTrigger on Contact( before insert, before update, before delete, after insert, after update, after delete, after undelete ) {
	new ContactTriggerHandler().run();
}