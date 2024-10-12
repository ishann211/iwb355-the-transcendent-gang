import ballerina/http;
import ballerinax/mysql;
import ballerina/sql;
// import ProjectBallerina.userModule;

service /user on new http:Listener(8080) {

    // resource function get sayHello(string name) returns string {
    //     // Call the greet function from the my_module module
    //     return userModule:greet(name);
    // }

    private final mysql:Client dbClient;

    function init() returns error? {
        // Initialize MySQL connection
        self.dbClient = check new ("localhost", "root", "Dasuni#2001", "test", 3306);
        
    }

    resource function get users/[string id]() returns User|http:NotFound|error {
    // Execute simple query to fetch record with requested id.
    User|sql:Error result = self.dbClient->queryRow(`SELECT * FROM user WHERE id = ${id}`);

    // Check if record is available or not
    if result is sql:NoRowsError {
        return http:NOT_FOUND;
    } else {
        return result;
    }
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