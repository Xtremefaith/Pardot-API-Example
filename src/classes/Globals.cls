/**
 * @class GLOBALS
 * @description Handle Global__c object
 *
 * @author  Nick Worth
 * @created 10/10/2014
 * @version 1.0
 */
public virtual class Globals {

	public static Global__C g;

	/**
     * CONSTRUCTOR
     */
	// public Globals(){

	// }

	/**
     * GET A GLOBAL BY NAME
     * Fetch Global__c by Name field
     * @example Globals.get(<Name>)
     * @author  Nick Worth
     */
	public static String get( String name, String field ){
		Globals.g = [SELECT Id, Name, Value__c FROM Global__c WHERE Name = :name];
		return (String)g.get(field);
	}
}