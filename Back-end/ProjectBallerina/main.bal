import ballerina/io;
import ballerina/http;
import ballerinax/mysql;
import ballerinax/mysql.driver as _;


// Configurable values for database setup
configurable string databaseusername = ?;
configurable string password = ?;
configurable string databasename = ?;
configurable int databaseport = ?;

public function main() {
    io:println("Starting User Service...");
}

// Initialize the listener for user service on port 8081, forcing it to bind to IPv4 (127.0.0.1)
// listener http:Listener userListener = new(9090, config = {host: "127.0.0.1"});


function initDatabase(mysql:Client dbClient) returns error? {
    _ = check dbClient->execute(`CREATE TABLE IF NOT EXISTS users (ID INT AUTO_INCREMENT PRIMARY KEY, NAME VARCHAR(255), EMAIL VARCHAR(255), USERNAME VARCHAR(255), PASSWORD VARCHAR(255), ROLE VARCHAR(255))`);
}

service /api on new http:Listener(9091) {
    
    private final mysql:Client dbClient;

    function init() returns error? {
        // self.dbClient = check new jdbc:Client("jdbc:mysql://localhost:3306/projectballerina", {
        //     username: "root",
        //     password: "root",
        //     dbOptions: { useSSL: false }
        // });
        self.dbClient = check new ("localhost", databaseusername , password, databasename, databaseport);
        check initDatabase(self.dbClient);
    }
}