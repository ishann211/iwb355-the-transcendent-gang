import ballerina/io;

configurable string password = ?;

public function main() {
    io:println("Hello, Ballerina!");
    io:println("Password: " + password);
}
