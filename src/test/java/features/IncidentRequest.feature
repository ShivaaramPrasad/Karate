Feature: Incident Managemant

  Scenario: Get All Incident
	Given url  'https://dev71161.service-now.com/api/now/table/incident'
	And header Authorization = 'Basic YWRtaW46QTNEMGdTbHpLc2ZM'
	And header accept = 'application/xml'
	And param sysparm_fields = 'sys_id,number,short_description,description'
	When method get
	Then  status 200
	#And match responseStatus == 200
    And match responseType == 'xml'
	And print response
   
   
   
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
	And print response
	