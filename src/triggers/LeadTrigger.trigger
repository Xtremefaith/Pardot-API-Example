/**
 * @trigger LEAD TRIGGER
 * @description Handles all trigger context for leads
 *
 * @author 	Nick Worth
 * @created 10/1/2014
 * @version 1.0
 */
trigger LeadTrigger on Lead( before insert, before update, before delete, after insert, after update, after delete, after undelete ) {
	new LeadTriggerHandler().run();
}