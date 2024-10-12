import ballerina/io;
import ballerina/http;
import ballerinax/mysql;
import ballerinax/mysql.driver as _;
import ballerina/sql;

configurable string password = ?;

public function main() {
    io:println("Starting User Service...");
    
}

// Initialize the listener for user service on port 8081, forcing it to bind to IPv4 (127.0.0.1)
listener http:Listener userListener = new(8080, config = {host: "127.0.0.1"});


function initDatabase(mysql:Client dbClient) returns error? {
    _ = check dbClient->execute(`CREATE TABLE IF NOT EXISTS users (ID INT AUTO_INCREMENT PRIMARY KEY, NAME VARCHAR(255), EMAIL VARCHAR(255), USERNAME VARCHAR(255), PASSWORD VARCHAR(255), ROLE VARCHAR(255))`);
}

type User record {|
    readonly int id;
    string name;
    string email;
    string username;
    string password;
    string role;
|};

mysql:Client myClient = check new ("localhost", "root", password, "test", 3306);

type NewUser record {|
    string name;
    string email;
    string username;
    string password;
    string role;
|};

service /api on new http:Listener(9090) {
    
    //private final mysql:Client dbClient;

    // function init() returns error? {
    //     // self.dbClient = check new jdbc:Client("jdbc:mysql://localhost:3306/projectballerina", {
    //     //     username: "root",
    //     //     password: "root",
    //     //     dbOptions: { useSSL: false }
    //     // });
    //     self.dbClient = check new ("localhost", "root", password, "test", 3306);
    //     check initDatabase(self.dbClient);
    // }

    resource function get users/[int id]() returns User|http:NotFound|error {
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
    resource function post User(NewUser newUser) returns http:Created|error {
        _ = check myClient->execute(
            `INSERT INTO users (NAME, EMAIL, USERNAME, PASSWORD, ROLE) VALUES (${newUser.name}, ${newUser.email}, ${newUser.username}, ${newUser.password}, ${newUser.role})`);

        return http:CREATED;
    }

    
}

// service /user on userListener {
//     *userModule:UserService;
// }