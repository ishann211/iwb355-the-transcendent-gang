import ballerina/http;
import ProjectBallerina.userModule;

// service / on new http:Listener(9090) {
//     resource function get user(int id) returns User {
//         User user1 = getUser(id);
//         return user1;
//     }
// }

service /hello on new http:Listener(9090) {

    resource function get sayHello(string name) returns string {
        // Call the greet function from the my_module module
        return userModule:greet(name);
    }
}