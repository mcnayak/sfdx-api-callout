public class Snowflake_Callout{
    public void oauth(){
        Http http = new Http();
  		HttpRequest req = new HttpRequest();
        String token = 'ver:1-hint:19676872976293894-ETMsDgAAAYIjM9BrABRBRVMvQ0JDL1BLQ1M1UGFkZGluZwEAABAAEKAMU0jGVm/J3j4+oeOAyTUAAABgip3R3Vna8mWA543+Ltc5JVL9am3s02SX//iQ3HPYbTXQQExUnrt7DTmLl5sKyy98UOGJphP0B/cpVn/X+GHxXihoIjLsego+nIFVRmupMwrhkkaTeSuo5JKbk3+34IKqABT0stzh6Bbl6VUhECacy/85SXGHQQ==';
        req.setEndpoint('https://sfsenorthamerica-cnayak.snowflakecomputing.com/api/v2/statements');
        req.setMethod('POST');
		req.setHeader('Content-Type', 'application/json');
        req.setHeader('Accept','application/json');
        req.setHeader('Snowflake-Account','ija44251');
		req.setHeader('Authorization','Bearer ' + token);
        req.setBody('{"statement": "select lifetime_value from customer where customer_id=101", "timeout": 60, "database":"CRM_DB", "warehouse":"ADMIN_CONNECTOR_WH", "role":"SQLAPIROLE", "resultSetMetaData": {"format":"json"} }');
		HttpResponse response = http.send(req);
        String respBody = response.getBody();
        System.debug(respBody);
//        Snow_Response__c snow_Response_o = (Snow_Response__c)JSON.deserialize(respBody, Snow_Response__c.class);
//        Database.insert(Snow_Response);
//        String s = (String)JSON.deserialize(respBody, String.class);
//        System.debug(snow_Response_o);
        JSONParser parser = JSON.createParser(respBody);
        JSONToken key_value = JSONToken.VALUE_STRING;
        String ltv = '';
        while (parser.nextToken() != null) {
            if (
                (parser.getCurrentToken() == JSONToken.FIELD_NAME) && (parser.getText() == 'data')
                )
                { 
                    //code to parse through the array until a value is found 
					//  do {  parser.nextValue();
    	            //  } while (parser.getText() != key_value);
                    parser.nextValue();
                    parser.nextValue();
	                parser.nextValue();
                    ltv = parser.getText();
                }
        }
        System.debug(ltv); 
    }
}