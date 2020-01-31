import ballerina/io;
import ballerina/http;
import ballerina/xmlutils;

public function validateResponse (http:Caller outboundEp, http:Response res) returns @tainted string{

var jsonPayLoad = res.getJsonPayload();
if (jsonPayLoad is json) {
	xml | error xmlPayLoad = xmlutils:fromJSON(jsonPayLoad);
	if (xmlPayLoad is error) {
		io:println("Error during json to xml conversion.");
	} else {
		res.setPayload(<@untainted> xmlPayLoad);                
	}
}
string contentType = res.getContentType();
return contentType;
}

