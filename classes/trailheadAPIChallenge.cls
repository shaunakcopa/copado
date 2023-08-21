public class trailheadAPIChallenge {
    public String result{get;set;}//= new List<String>();    
    
    // method for obtaining an access token via OAuth 2.0 - returns a string access_token
    public static string accessToken(){ 
     
     // initialize and clear out the access_token variable
     string access_token = '';
     
     // create new HTTP request to get the access_token from the Salesforce OAuth service
     HttpRequest req = new HttpRequest();
            
     // initialize a series of variables that will be used to get the access token
     // make sure to replace all of the <'FILL_ME_IN'> for your code to work 
     string clientId = 'FILL_ME_IN';
     string clientSecret = 'FILL_ME_IN';
     string username = 'FILL_ME_IN';
     string password = 'FILL_ME_IN';
     string loginUri = 'https://login.salesforce.com';
     
     // get user's access token
     req.setMethod('POST');
     
     // for this endpoint to work, you will need to add a remote site setting in your org for https://login.salesforce.com
     req.setEndpoint(loginUri+'/services/oauth2/token');
     req.setBody('grant_type=password' 
                 + '&client_id=' + clientId 
                 + '&client_secret=' + clientSecret 
                 + '&username='+ EncodingUtil.urlEncode(username, 'UTF-8') 
                 + '&password=' + EncodingUtil.urlEncode(password, 'UTF-8'));
     
     Http http = new Http();
     HTTPResponse res = http.send(req);
     
     // check the results (res) from the request (req) by printing to log
     System.debug('BODY: '+res.getBody());
     System.debug('STATUS:'+res.getStatus());
     System.debug('STATUS_CODE:'+res.getStatusCode());
          
     // Parse JSON response to get the access_token field value.
        JSONParser parser = JSON.createParser(res.getBody());

        while (parser.nextToken() != null) {
            if ((parser.getCurrentToken() == JSONToken.FIELD_NAME) && 
                (parser.getText() == 'access_token')) {
                // Get the access token value
                parser.nextToken();
                access_token = parser.getText();
            }
        }
        //system.debug('access_token=' + access_token); 
        
        // return access_token to calling method
        return access_token;
        
    }
    
    // method for calling out to Trailhead API
    public static void getTrail(){
         
        // prepare the http request that will be made
        HttpRequest req = new HttpRequest(); 
        
        // initialize and clear out the access_token variable
        string access_token = '';

        // call out to the accessToken() method to get the access_token and set it to local variable
        access_token=accessToken();
        //System.debug('access_token in apiCallout: '+access_token); 
        
            // extend timeout to 20 seconds for slow responses
            req.setTimeout(20000);
            
            // create new response object for collecting the callout results
            HttpResponse res = new HttpResponse();
            Http http = new Http();
            
            // based on remote setting in setup for Trailhead API:
            req.setEndpoint('FILL_ME_IN');
            req.setMethod('FILL_ME_IN');
            req.setHeader('Content-Type', 'application/json; charset=utf-8');
            req.setHeader('X-API-Key', 'FILL_ME_IN');
            req.setBody('{"FILL_ME_IN":["FILL_ME_IN"],"FILL_ME_IN":"FILL_ME_IN"}');
            
            // set the access token from the same org
            req.setHeader('Authorization', 'Bearer '+ access_token); 
            
            // try to callout to the Trailhead API Rest API and if it doesn't work, catch the errors for debugging
            try {
                
                // send the http request and collect it in a response
                res = http.send(req);
                
                // serialize the resulting String into a map of name-value pairs (String-Object)
                Map<String, Object> jsonMap = (Map<String, Object>) JSON.deserializeUntyped(res.getBody()); 
                
                // get the total_count from the map
                Integer totalCount = (Integer)jsonMap.get('total_count');               
                
                // makes sure these are true
                System.assert(totalCount > 0);
                System.assertEquals(200, res.getStatusCode());

                // output to the logs in case you want to view the results
                System.debug('request: '+ req.toString());
                System.debug('response: '+ res.toString());
            
            } catch(System.CalloutException e) {
                System.debug('Callout error: '+ e);
                System.debug(res.toString());
            }
     }
}