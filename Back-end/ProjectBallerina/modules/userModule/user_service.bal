import ballerina/http;
import ballerinax/mysql;
import ballerina/sql;
// import ProjectBallerina.userModule;


configurable string databaseusername = ?;
configurable string password = ?;
configurable string databasename = ?;
configurable int databaseport = ?;

service /user on new http:Listener(9090) {

    // resource function get sayHello(string name) returns string {
    //     // Call the greet function from the my_module module
    //     return userModule:greet(name);
    // }

    private final mysql:Client dbClient;

    function init() returns error? {
        // Initialize MySQL connection
        self.dbClient = check new ("localhost", databaseusername , password, databasename, databaseport);
    }

    // Resource to create a user
    resource function post createUser(http:Caller caller, http:Request req) returns error? {
        json newUserJson = check req.getJsonPayload();
        User newUser = check newUserJson.cloneWithType(User);

        _ = check self.dbClient->execute(
            `INSERT INTO users (NAME, EMAIL, USERNAME, PASSWORD, ROLE) VALUES (${newUser.name}, ${newUser.email}, ${newUser.username}, ${newUser.password}, ${newUser.role})`);

        check caller->respond("User created successfully");
    }

    // Resource to get a user by ID
    resource function get getUserById(http:Caller caller, http:Request req, int id) returns error? {
        stream<User, sql:Error?> userStream = self.dbClient->query(`SELECT * FROM users WHERE ID = ${id}`);

        User[] users = check from User user in userStream select user;
        if users.length() > 0 {
            check caller->respond(users[0]);
        } else {
            check caller->respond("User not found");
        }
    }
}