# Pardot API for SalesForce
This plugin is an example of connecting to [Pardot's API](http://www.pardot.com/api/) in Salesforce. At the moment this plugin only handles **creating prospects in Pardot for leads and contacts**. Feel free to clone and extend as needed and even submit pull request for future devs. Since Pardot does not create prospects for leads or contacts that do not have an email this is a very common use case for orgs using Pardot.

This is my first task in apex so greatful for any feedback. The methods I used are pretty well researched so this should be a well documented example for anyone getting started with Pardot integration.

# Notes

+ In order to store the Pardot credentials I created a `Global__c` custom object with encrypted text fields for any global settings such as 3rd party credentials. Since attending DreamForce 14' I realize that although this is a much better options then some lazier methods, the absolute best solution would be to store them in a managed packaged. Unfortunately I learned this after the fact, and honestly I don't know how to do that just yet, but any volunteers who want to feel in the blanks please feel free.

+ Make sure to include Pardot as a valid remote site in your SF environment, otherwise your @future webservice call will fail

+ I decided to use the [TriggerHandler framework](https://github.com/kevinohara80/sfdc-trigger-framework) from [Kevin O'Hara](https://twitter.com/kevohara) for setting up my triggers, this is not necessary for Pardot integrations, but I've include in full disclosure

+ Also for the unit testing I've included [Smart Factory](https://github.com/mbotos/SmartFactory-for-Force.com), again optional

# Includes

+ **Triggers**

    There is a trigger for both Leads and Contacts, both of which are very small because they use the [TriggerHandler framework](https://github.com/kevinohara80/sfdc-trigger-framework) from [Kevin O'Hara](https://twitter.com/kevohara) (you can structure your code however you'd like but this is a solid approach I think and makes trigger creation a much simplier process).

+ **Classes**

    There are many included in order to provide everything used, but only the Pardot classes are necessary for API calls
    + `Pardot.cls` - Includes HttpCallout() to handle API request. Also, as mentioned it only has 2 API functions right now: createProspectsByLead() & createProspectsByContact(). Feel free to add more.
    + `PardotHttpCalloutMock.cls` - Used for unit testing to create a mock HttpResponse. It also uses `MockCalloutTest.cls`

+ **Test Classes**

    This should help get code coverage taken care of as well.


# References 

These are forum topics that were involved during the process of writing this integration

+ [HttpResponse StatusCode=200, but 3rd party request (Pardot) not made](http://salesforce.stackexchange.com/questions/51368/httpresponse-statuscode-200-but-3rd-party-request-pardot-not-made) 
+ [REST API calls to 3rd Party (Pardot), multiple @future callouts](http://salesforce.stackexchange.com/questions/53766/rest-api-calls-to-3rd-party-pardot-multiple-future-callouts)
+ [Creating a Custom Object Handler Class](http://salesforce.stackexchange.com/questions/52023/creating-a-custom-object-handler-class)
+ [Mock Unit Test for a REST API callout](http://salesforce.stackexchange.com/questions/54194/mock-unit-test-for-a-rest-api-callout)

# Contributors

+ Nick Worth | [@Xtremefaith](http://twitter.com/Xtremefaith)