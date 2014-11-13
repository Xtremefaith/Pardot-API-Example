/**
 * @class Mock Callout TEST CLASS
 * @description Test methods for mock REST/SOAP callouts
 *
 * @author  Nick Worth
 * @created 10/28/2014
 * @version 1.0
 */

@isTest
public class MockCalloutTest implements HttpCalloutMock {

	private HttpResponse response;

	public MockCalloutTest(String body) {
		response = new HttpResponse();
		response.setBody(body);
		response.setStatusCode(200);
	}

	public HTTPResponse respond(HTTPRequest req) {
        return response;
    }

    public testmethod static void xmlTest() {
        String success = '<?xml version="1.0" encoding="UTF-8"?> <rsp stat="ok" version="1.0"> <api_key>6d800bfaab63274b1b908dacd8544936</api_key> </rsp>';

        HttpCalloutMock mock = new MockCalloutTest(success);
        Test.setMock(HttpCalloutMock.class, mock);
        
        HttpResponse response = Pardot.httpCallout('http://testurl.com', success);
        System.assertEquals(200, response.getStatusCode());        
        System.assertEquals(response.getBody(), success );

    }

}