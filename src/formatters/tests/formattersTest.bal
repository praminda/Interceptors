import ballerina/test;
import ballerina/http;

@test:Config {}
function testFormatRequest() {
	xml xmlPayLoad = xml `<fruit>apple</fruit>`;
	http:Caller outboundEp = new;
	http:Request req = new;

	req.setXmlPayload(<@untainted> xmlPayLoad);
	formatRequest(outboundEp, req);
	var response = req.getJsonPayload();

	test:assertTrue(response is json, msg = "XML to JSON Conversion Failed");
}

@test:Config {}
public function testFormatResponse () {
	json jsonPayload = { name: "apple", color: "red", price: 100 };
	http:Caller outboundEp = new;
	http:Response res = new;

	res.setJsonPayload(<@untainted> jsonPayload);
	formatResponse(outboundEp, res);
	var response = res.getXmlPayload();
         
	test:assertTrue(response is xml, msg = "JSON to XML Conversion Failed");
}


