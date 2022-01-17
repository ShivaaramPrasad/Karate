Feature: Incident Managemant


   
   Scenario: Create a new Incident without body
	Given url  'https://dev71161.service-now.com/api/now/table/incident'
	And header Authorization = 'Basic YWRtaW46QTNEMGdTbHpLc2ZM'
	And header accept = 'application/xml'
	#And param sysparm_fields = 'sys_id,number,short_description,description'
	And request {}
	When method post
	Then  status 201
	#And match responseStatus == 201
    And match responseType == 'xml'
    And def sysID = response.response.result.sys_id
	And print response
	
	Given url  'https://dev71161.service-now.com/api/now/table/incident/'+sysID
	And header Authorization = 'Basic YWRtaW46QTNEMGdTbHpLc2ZM'
	And header accept = 'application/xml'
	#And param sysparm_fields = 'sys_id,number,short_description,description'
	And request {'short_description': 'Created from Karate','description': 'Addtional  from Karate', 'category': 'Hardware' }
	When method put
	Then  status 200
	And match response.response.result.short_description == 'Created from Karate'
	#And match responseStatus == 201
    And match responseType == 'xml'
	And print response