/**
 * @class PARDOT
 * @description Create and manage Pardot prospects and opportunities with the Pardot API
 *
 * @author 	Nick Worth
 * @created 10/1/2014
 * @version 3.0 #API
 *
 * @Link    http://www.pardot.com/api/
 * @Link    http://developer.pardot.com/kb/api-version-3/using-prospects
 */
public class Pardot {
    
    /**
     * CREATE PARDOT PROSPECT USING LEAD LIST
     * Creates a new prospect using the specified data. <email> must be a unique email address
     */
    public static void createProspectsByLead (Lead[] leads){
        for (Lead l :leads) {
            APIRequest(
                'https://pi.pardot.com/api/prospect/version/3/do/create', // API Request
                'email='+l.Email // Required parameter
            );
            System.debug('::PARDOT EMAIL::'+l.Email);
        }
    }    

    /**
     * CREATE PARDOT PROSPECT USING LEAD LIST
     * Creates a new prospect using the specified data. <email> must be a unique email address
     */
    public static void createProspectsByContact (Contact[] contacts){
        for (Contact c :contacts) {
            APIRequest(
                'https://pi.pardot.com/api/prospect/version/3/do/create', // API Request
                'email='+c.Email // Required parameter
            );
            System.debug('::PARDOT EMAIL::'+c.Email);
    	}
    }

    /**
     * PARDOT API CALLOUT
     * Callouts to Pardot API webservices while getting the API Key
     * @link http://developer.pardot.com/kb/api-version-3/using-the-pardot-api
     */
    @future (callout=true)
    private static void APIRequest(String url, String body){
        HttpResponse response = httpCallout( url, 'user_key='+getConnectorUserKey()+'&api_key='+getAPIKey()+'&'+ body );
    }

    /**
     * HTTP CALLOUTS
     * HttpRequest handler method
     */
    public static HttpResponse httpCallout(String url, String body){
        HttpRequest     request     = new HttpRequest();
        HttpResponse    response    = new HttpResponse();
        Http            http        = new Http();

        request.setEndPoint(url);
        request.setBody(body);
        request.setMethod('POST');

        /* Try to send the request */
        try {
            response = http.send(request);
            System.debug('::RESPONSE::'+response.getBody());
            return response;
        } catch(System.CalloutException e) {
            System.debug('ERROR: '+ e);
            return null;
        }
    }

    /**
     * GET PARDOT API
     * Callouts to Pardot API webservices
     */
    public static String getAPIKey(){
        HttpResponse response = httpCallout(
            'https://pi.pardot.com/api/login/version/3?', //URL
            'email='+getConnectorEmail()+'&password='+getConnectorPassword()+'&user_key='+ getConnectorUserKey() //Body
        );
        
        /* Parse API Response */
        Dom.Document doc = new Dom.Document();
        doc.load(response.getBody());
        Dom.XMLNode root = doc.getRootElement();
        if(root.getName()=='rsp') {
            for(Dom.XMLNode node1: root.getChildElements()) {
                if(node1.getName()=='err') {
                    String err = root.getChildElement('err', null).getText();
                    String code = root.getChildElement('err', null).getAttribute('code', null);
                    System.debug('::API REQUEST ERROR:: '+code+' - '+err);
                    return err;
                }
                if(node1.getName()=='api_key') {
                    /* Store API in variable */
                    // TODO: Store API for 1 hour in Global__c
                    String api_key = root.getChildElement('api_key', null).getText();
                    return api_key;
                }
            }
        }

        /* This should never happen */
        return '';
    }

    /**
     * RETRIEVE PARDOT CREDENTIALS 
     * Using Global__c with custom encrypted fields
     * TODO: Convert to a private managed package solution
     */
    private static String getConnectorEmail(){
        if (Test.isRunningTest()) {  
            return 'pardot+admin@domain.com';
        }
        else {  
            return EncodingUtil.urlEncode(Globals.get('Pardot Connector Email', 'Value__c'), 'UTF-8');
        }
    }

    private static String getConnectorPassword(){
        if (Test.isRunningTest()) {  
            return 'e2AU4eHt$MdY';
        }
        else {  
            return EncodingUtil.urlEncode(Globals.get('Pardot Connector Password', 'Value__c'), 'UTF-8');
        }
    }

    private static String getConnectorUserKey(){
        if (Test.isRunningTest()) {  
            return 'f7bafb85674dc71b64eca28z5f3dd520';
        }
        else {  
            return EncodingUtil.urlEncode(Globals.get('Pardot User Key', 'Value__c'), 'UTF-8');
        }
    }

}