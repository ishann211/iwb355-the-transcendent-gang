import ballerina/io;
import ballerina/http;
import ballerinax/mysql;
import ballerinax/mysql.driver as _;

import ballerina/sql;

// Configurable values for database setup
configurable string databaseusername = ?;
configurable string password = ?;
configurable string databasename = ?;
configurable int databaseport = ?;

// Main function
public function main() {
    io:println("Starting Services...");
}

// Initialize the listener for user service on port 8081, forcing it to bind to IPv4 (127.0.0.1)
// listener http:Listener userListener = new(8080, config = {host: "127.0.0.1"});



// Function to initialize the database Tables
function initDatabase(mysql:Client dbClient) returns error? {
    _ = check dbClient->execute(`CREATE TABLE IF NOT EXISTS users (ID INT AUTO_INCREMENT PRIMARY KEY, NAME VARCHAR(255), EMAIL VARCHAR(255), USERNAME VARCHAR(255), PASSWORD VARCHAR(255), ROLE VARCHAR(255))`);
}

// Create a new mysql client
mysql:Client myClient = check new ("localhost", databaseusername, password, databasename, databaseport);


// Service to handle operations
service /api on new http:Listener(9090) {


    function init() returns error? {
        // self.dbClient = check new ("localhost", "root", password, "test", 3306);
        check initDatabase(myClient);

    }

    // Resource to get a user by id
    resource function get getUserById/[int id]() returns User|http:NotFound|error {
        // Execute simple query to fetch record with requested id.
        User|sql:Error user = myClient->queryRow(`SELECT * FROM users WHERE id = ${id}`);

        // Check if record is available or not
        if user is sql:NoRowsError {
            return http:NOT_FOUND;
        } else {
            return user;
        }
    }

    // Resource to create a user
    resource function post createUser(NewUser newUser) returns http:Created|error {
        _ = check myClient->execute(
            `INSERT INTO users (NAME, EMAIL, USERNAME, PASSWORD, ROLE) VALUES (${newUser.name}, ${newUser.email}, ${newUser.username}, ${newUser.password}, ${newUser.role})`);

        return http:CREATED;
    }
}

