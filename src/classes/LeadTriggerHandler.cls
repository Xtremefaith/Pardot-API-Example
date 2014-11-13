/**
 * @class LEAD TRIGGER HANDLER
 * @description Handle all trigger logic for Leads
 *
 * @author  Nick Worth
 * @created 10/1/2014
 * @version 1.0
 */
public class LeadTriggerHandler extends TriggerHandler {

    private Map<Id, Lead> newLeadMap;

    /**
     * CONSTRUCTOR
     */
    // public LeadTriggerHandler(){
        
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
        for(Lead l : (List<Lead>) Trigger.new){
            Lead old = (Lead) Trigger.oldMap.get(l.Id);
            /* If Email was empty */
            if ( old.Email == null && l.Email != null ){
                /* Add Lead Prospect */
                Pardot.createProspectsByLead(Trigger.new);
                System.debug('::LEAD SENT TO PARDOT::');
            }
        }
    }
    
}