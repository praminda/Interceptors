import ballerina/io;
import ballerina/http;
import ballerina/jsonutils;

public function formatRequest (http:Caller outboundEp, http:Request req) {
	var xmlPayLoad = req.getXmlPayload();
	var result = req.setContentType("application/json");

	if (result is () && xmlPayLoad is xml) {
		json | error jsonPayLoad = jsonutils:fromXML(xmlPayLoad);
		if (jsonPayLoad is error) {
			io:println("Error during xml to json conversion.");
		} else {
			req.setPayload(<@untainted> jsonPayLoad);                
		}
	}
}
