import ballerina/test;
import ballerina/http;

@test:Config {}
function testValidateRequest() {
	xml xmlPayLoad = xml `<name_of_book>Sherlock Holmes</name_of_book>`;

	http:Caller outboundEp = new;
	http:Request req = new;

	req.setXmlPayload(<@untainted> xmlPayLoad);
	string contentType = validateRequest(outboundEp,req);

	test:assertEquals(contentType, "application/json", msg = "XML to JSON Conversion Failed");

}

@test:Config {}
public function testValidateResponse () {
	json jsonPayload = { name: "apple", color: "red", price: 100 };

	http:Caller outboundEp = new;
	http:Response res = new;

	res.setJsonPayload(<@untainted> jsonPayload);
	string contentType = validateResponse(outboundEp,res);
         
        test:assertEquals(contentType, "application/xml", msg = "JSON to XML Conversion Failed");

}


