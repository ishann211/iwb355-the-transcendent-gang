import ballerina/sql;

type User record {|
    @sql:Column {name: "ID"}
    readonly int id;
    @sql:Column {name: "NAME"}
    string name;
    @sql:Column {name: "EMAIL"}
    string email;
    @sql:Column {name: "USERNAME"}
    string username;
    @sql:Column {name: "PASSWORD"}
    string password;
    @sql:Column {name: "ROLE"}
    string role;
|};

