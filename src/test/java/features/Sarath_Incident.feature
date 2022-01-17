Feature: IncidentManagement

Scenario: Get all Incident

Given url 'https://dev117006.service-now.com/api/now/table/incident'
And header Authorization = 'Basic YWRtaW46VHVuYUAxMjM='
And header accept = 'application/xml' 
And param sysparm_fields = 'sys_id,number,short_description'
When method get
Then status 200
And match responseStatus == 200
And match responseType == 'xml'
And print response

Scenario: Create a new Incident without body

Given url 'https://dev117006.service-now.com/api/now/table/incident'
And header Authorization = 'Basic YWRtaW46VHVuYUAxMjM='
And header accept = 'application/xml' 
#And param sysparm_fields = 'sys_id,number,short_description'
And request {} 
When method post
#Then status 200
And match responseStatus == 201
And match responseType == 'xml'
And print response


Scenario: Create a new Incident with body

Given url 'https://dev117006.service-now.com/api/now/table/incident'
And header Authorization = 'Basic YWRtaW46VHVuYUAxMjM='
And header accept = 'application/xml' 
#And param sysparm_fields = 'sys_id,number,short_description'
And header Content-Type = 'application/json'
And request karate.readAsString('data/CreateIncident.json') 
When method post
#Then status 200
And match responseStatus == 201
And match responseType == 'xml'
And print response
