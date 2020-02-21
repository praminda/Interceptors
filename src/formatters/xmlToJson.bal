import ballerina/http;
import ballerina/jsonutils;

public function formatRequest (http:Caller outboundEp, http:Request req) {
	var xmlPayLoad = req.getXmlPayload();
	var content = req.setContentType("application/json");

	if (content is () && xmlPayLoad is xml) {
		json | error jsonPayLoad = jsonutils:fromXML(xmlPayLoad);
		if (jsonPayLoad is error) {
			http:Response res = new;
			res.statusCode = 400;
			res.setJsonPayload({msg: "Error while formatting request"});
			var result = outboundEp->respond(res);
		} else {
			req.setJsonPayload(<@untainted> jsonPayLoad);
		}
	} else {
		http:Response res = new;
		res.statusCode = 400;
		res.setJsonPayload({msg: "Error while formatting request"});
		var result = outboundEp->respond(res);
	}
}
