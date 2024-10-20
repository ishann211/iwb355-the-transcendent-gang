type User record {|
    readonly int id;
    string name;
    string email;
    string username;
    string password;
    string role;
|};

type NewUser record {|
    string name;
    string email;
    string username;
    string password;
    string role;
|};
