public class Snowflake_Callout{
    public void oauth(){
        Http http = new Http();
  		HttpRequest req = new HttpRequest();
        String token = 'ver:1-hint:19676872976175110-ETMsDgAAAYD4tCOsABRBRVMvQ0JDL1BLQ1M1UGFkZGluZwEAABAAEAxQIYJKG74htGDxhYV/bcMAAABgHZVRJT+pX4NExQ4Zzc+Wv8pa9PutrJciuxk4dkNU0yXDVuML9AeVcgMQq3dlGmahLlcqWv3/A3iIATVVw+RU2P8e4eQld6PeuztZJ/274HthxXaeGZVF2p+hSudoSW1yABQ7txcGWeGC+ZabucfJ3ZoP7WcYjg==';
        req.setEndpoint('https://sfsenorthamerica-cnayak.snowflakecomputing.com/api/v2/statements');
        req.setMethod('POST');
		req.setHeader('Content-Type', 'application/json');
        req.setHeader('Accept','application/json');
        req.setHeader('Snowflake-Account','ija44251');
		req.setHeader('Authorization','Bearer ' + token);
        req.setBody('{"statement": "select current_version()", "timeout": 60, "database":"CRM_DB", "warehouse":"ADMIN_CONNECTOR_WH", "role":"SQLAPIROLE", "resultSetMetaData": {"format":"json"} }');
		HttpResponse response = http.send(req);
        String respBody = response.getBody();
//        System.debug(respBody);
//        Snow_Response__c snow_Response_o = (Snow_Response__c)JSON.deserialize(respBody, Snow_Response__c.class);
//        Database.insert(Snow_Response);
//        String s = (String)JSON.deserialize(respBody, String.class);
//        System.debug(snow_Response_o);
        JSONParser parser = JSON.createParser(respBody);
        String numRows;
        while (parser.nextToken() != null) {
            if ((parser.nextToken() == JSONToken.FIELD_NAME) && (parser.getText() == 'numRows')){
                parser.nextToken();
                numRows = parser.getText();
            }
            
        }
        System.debug(numRows); 
        Snow_Response__c Snow_Obj = new Snow_Response__c(Response_1__c=numRows);
        Database.insert(Snow_Obj);
    }
}
