Sample interceptors which are relevant for [WSO2 API Microgateway](https://wso2.com/api-management/api-microgateway/) request and response formatting.

# Module Overview
This module provides two basic interceptors for `json` to `xml` and `xml` to `json` message transformations.

1. The request interceptor (`xmlToJsonFormatter.bal`) will convert a XML payload to a JSON payload.

    **Syntax:**
    ```yaml
    x-wso2-request-interceptor: praminda/formatters/0.4.0:formatRequest
    ```
1. The response interceptor (`jsonToXmlFormatter.bal`) will convert a JSON payload to a XML payload.

    **Syntax:**
    ```yaml
    x-wso2-response-interceptor: praminda/formatters/0.4.0:formatResponse
    ```
