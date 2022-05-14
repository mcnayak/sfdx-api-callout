public class Snowflake_Callout{
    public void oauth(){
        Http http = new Http();
  		HttpRequest req = new HttpRequest();
        String token = 'ver:1-hint:19676872976175110-ETMsDgAAAYDBCEcQABRBRVMvQ0JDL1BLQ1M1UGFkZGluZwEAABAAEAjHA7Uh8zkuX0qjDAkdA4MAAABg2oObGoOHN2/TApwi4MgceKCBeixx0rXGTvUkPGnFYihwOpHmCERhFbcttJMRNPFA3IjhEij/rYeJ+Br8Mkimoq2Flt2Pv23+uqNJGlbmRfVv//7kNn9s64C5jk2YXZ56ABS4sMdbF0IV+xjeGjWgFsBCaOCPhw==';
        req.setEndpoint('https://sfsenorthamerica-cnayak.snowflakecomputing.com/api/v2/statements');
        req.setMethod('POST');
		req.setHeader('Content-Type', 'application/json');
        req.setHeader('Accept','application/json');
        req.setHeader('Snowflake-Account','ija44251');
		req.setHeader('Authorization','Bearer ' + token);
        req.setBody('{"statement": "select current_version()", "timeout": 60, "database":"CRM_DB", "warehouse":"ADMIN_CONNECTOR_WH", "role":"SQLAPIROLE", "resultSetMetaData": {"format":"json"} }');
		HttpResponse response = http.send(req);
//        String respBody = response.getBody();
//        String s = (String)JSON.deserialize(respBody, String.class);
//        System.debug(res.getBody());
    }
}
