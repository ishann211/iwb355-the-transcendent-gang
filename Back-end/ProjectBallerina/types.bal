import ballerina/http;

@http:ServiceConfig {
    cors: {
        allowOrigins: ["http://localhost:8080"]
    },
    auth: [
        {
            jwtValidatorConfig: {
                issuer: "wso2",
                audience: "ballerina",
                signatureConfig: {
                    certFile: "/path/to/public.crt"
                },
                scopeKey: "scp"
            },
            scopes: ["admin"]
        }
    ]
}
service /foo on new http:Listener(9091) {
    resource function get bar() returns string {
        return "Hello, World!";
    }
}