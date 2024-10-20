import ballerina/mysql;
import ballerina/sql;

mysql:Client myClient = check new ("localhost", "root", password, "test", 3306);

function insertUser(User entry) returns sql:ExecutionResult|sql:Error{
    User { NAME, EMAIL, USERNAME, PASSWORD, ROLE} = entry;
    sql:ParameterizedQuery insertUser = ` INSERT INTO users (NAME, EMAIL, USERNAME, PASSWORD, ROLE) VALUES (${newUser.name}, ${newUser.email}, ${newUser.username}, ${newUser.password}, ${newUser.role})`;
    return myClient->execute(insertUser);
}