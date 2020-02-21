import ballerina/http;
import ballerina/xmlutils;

public function formatResponse (http:Caller outboundEp, http:Response res) {
	var jsonPayLoad = res.getJsonPayload();
	res.setContentType("application/xml");

	if (jsonPayLoad is json) {
		xml | error xmlPayLoad = xmlutils:fromJSON(jsonPayLoad);
		if (xmlPayLoad is error) {
			xml err = xml `<msg>Response</msg>`;
			res.statusCode = 500;
			res.setXmlPayload(err);
		} else {
			res.setXmlPayload(<@untainted> xmlPayLoad);
		}
	} else {
		xml err = xml `<msg>Error while formatting response</msg>`;
		res.statusCode = 500;
		res.setXmlPayload(err);
	}
}
