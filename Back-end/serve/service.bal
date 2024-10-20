import ballerina/http;

# A service representing a network-accessible API
# bound to port `9090`.
service / on new http:Listener(9090) {

    resource function get greeting(string? name) returns string|error {
        return string `Hello`;
    }
}
