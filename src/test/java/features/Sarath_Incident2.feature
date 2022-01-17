Feature: IncidentManagement


Scenario: Create & Update a Incident

Given url 'https://dev117006.service-now.com/api/now/table/incident'
And header Authorization = 'Basic YWRtaW46VHVuYUAxMjM='
And header accept = 'application/xml' 
#And param sysparm_fields = 'sys_id,number,short_description'
And request {} 
When method post
#Then status 200
And match responseStatus == 201
And match responseType == 'xml'
And def sysID = response.response.result.sys_id
And print response


Given url 'https://dev117006.service-now.com/api/now/table/incident/'+sysID
And header Authorization = 'Basic YWRtaW46VHVuYUAxMjM='
And header accept = 'application/xml' 
#And param sysparm_fields = 'sys_id,number,short_description'
And request {'short_description': 'create incident with body json','category': 'hardware'} 
When method put
#Then status 200
And match responseStatus == 200
And match response.response.result.category == 'hardware'
And match response.response.result.short_description contains 'create incident'
And print response

