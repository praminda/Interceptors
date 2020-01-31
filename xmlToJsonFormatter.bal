import ballerina/io;
import ballerina/http;
import ballerina/jsonutils;

public function validateRequest (http:Caller outboundEp, http:Request req) returns @tainted string{

var xmlPayLoad = req.getXmlPayload();
if (xmlPayLoad is xml) {
	json | error jsonPayLoad = jsonutils:fromXML(xmlPayLoad);
	if (jsonPayLoad is error) {
		io:println("Error during xml to json conversion.");
	} else {
		req.setPayload(<@untainted> jsonPayLoad);                
	}
}
string contentType = req.getContentType();
return contentType;
}

