type User record {|
    int id;
    string name;
    string email;
    string username;
    string password;
    string role;
|};

// public function getUserName(int id) returns String | error {
//     User user = {id: 1, name: "Ishan", email: "thathsaraishan@gmail.com", username: "e20211", password: "123456"};
//     return user.name;
// }

public function greet(string name) returns string {
    return "Hello, " + name + "!";
}