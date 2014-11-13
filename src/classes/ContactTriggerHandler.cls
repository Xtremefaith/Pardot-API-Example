/**
 * @class CONTACT TRIGGER HANDLER
 * @description Handle all trigger logic for Contacts
 *
 * @author  Nick Worth
 * @created 10/22/2014
 * @version 1.0
 */
public class ContactTriggerHandler extends TriggerHandler {

    private Map<Id, Contact> newContactMap;

    /**
     * CONSTRUCTOR
     */
    // public ContactTriggerHandler(){
        
    // }

     /**
     * BEFORE INSERT
     */
    // protected override void beforeInsert (){
        
    // }

    /**
     * AFTER INSERT
     */
    // protected override void afterInsert (){
        
    // }
    
    /**
     * BEFORE UPDATE
     */
    // protected override void beforeUpdate (){
        
    // }

    /**
     * AFTER UPDATE
     */
    protected override void afterUpdate (){
        isEmailAdded();
    }

    /**
     * BEFORE DELETE
     */
    // protected override void beforeDelete (){
        
    // }

    /**
     * AFTER DELETE
     */
    // protected override void afterDelete (){
        
    // }

    /**
     * AFTER UNDELETE
     */
    // protected override void afterUndelete (){
        
    // }

    /**
     * CHECK IF EMAIL WAS ADDED
     * When a lead is updated if it was previously empty then add email to the Pardot
     * @context afterUpdate
     * @author  Nick Worth
     */
    private void isEmailAdded (){
        for(Contact l : (List<Contact>) Trigger.new){
            Contact old = (Contact) Trigger.oldMap.get(l.Id);
            /* If Email was empty */
            if ( old.Email == null && l.Email != null ){
                /* Add Contact Prospect */
                Pardot.createProspectsByContact(Trigger.new);
                System.debug('::CONTACT SENT TO PARDOT::');
            }
        }
    }
    
}