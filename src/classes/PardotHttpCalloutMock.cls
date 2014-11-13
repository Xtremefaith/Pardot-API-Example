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
public class PardotHttpCalloutMock implements HttpCalloutMock {
	protected Integer code;
	protected String status;
	protected String bodyAsString;

	public PardotHttpCalloutMock(Integer code, String status, String body){
		this.code = code;
		this.status = status;
		this.bodyAsString = body;
	}

	public HttpResponse respond ( HttpRequest request) {
		HttpResponse response = new HttpResponse();
		response.setStatusCode(code);
		response.setStatus(status);
		response.setBody(bodyAsString);
		
		return response;
	}
}