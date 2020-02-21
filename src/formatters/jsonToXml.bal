import ballerina/io;
import ballerina/http;
import ballerina/xmlutils;

public function formatResponse (http:Caller outboundEp, http:Response res) {
	var jsonPayLoad = res.getJsonPayload();
	res.setContentType("application/xml");

	if (jsonPayLoad is json) {
		xml | error xmlPayLoad = xmlutils:fromJSON(jsonPayLoad);
		if (xmlPayLoad is error) {
			io:println("Error during json to xml conversion.");
		} else {
			res.setPayload(<@untainted> xmlPayLoad);                
		}
	}
}
