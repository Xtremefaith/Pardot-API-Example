/**
 * @class PARDOT TEST CLASS
 * @description Test methods for the Pardot.cls
 *
 * @author  Nick Worth
 * @created 10/27/2014
 * @version 1.0
 */

@isTest
public class PardotTest {

  /**
   * PARDOT API MOCK CALLOUT TEST (SUCCESS)
   * Creates a mock callout for Pardot.httpCallout()
   * @see PardotHttpCalloutMock.cls
   */
  @isTest public static void testPardotAPICalloutSuccess() {
    PardotHttpCalloutMock fakeResponse = new PardotHttpCalloutMock(
      200,    //code
      'Complete', //status
      '<?xml version="1.0" encoding="UTF-8"?><rsp stat="ok" version="1.0"><api_key>6d800bfaab63274b1b908dacd8544936</api_key></rsp>'); //body
    Test.setMock(HttpCalloutMock.class, fakeResponse);
    HttpResponse response = Pardot.httpCallout('https://pi.pardot.com/api/prospect/version/3/', 'email=mockCallout@test.com');
    System.assertEquals('<?xml version="1.0" encoding="UTF-8"?><rsp stat="ok" version="1.0"><api_key>6d800bfaab63274b1b908dacd8544936</api_key></rsp>', response.getBody() );
  }

	/**
   * PARDOT API MOCK CALLOUT TEST (FAILED)
   * Creates a mock callout for Pardot.httpCallout()
   * @see PardotHttpCalloutMock.cls
   */
  @isTest public static void testPardotAPICalloutFail() {
    PardotHttpCalloutMock fakeResponse = new PardotHttpCalloutMock(
      200,    //code
      'Complete', //status
      '<?xml version="1.0" encoding="UTF-8"?><rsp stat="fail" version="1.0"><err code="15">Login failed</err></rsp>'); //body
    Test.setMock(HttpCalloutMock.class, fakeResponse);
    HttpResponse response = Pardot.httpCallout('https://pi.pardot.com/api/prospect/version/3/', 'email=mockCallout@test.com');
    System.assertEquals('<?xml version="1.0" encoding="UTF-8"?><rsp stat="fail" version="1.0"><err code="15">Login failed</err></rsp>', response.getBody() );
  }

}