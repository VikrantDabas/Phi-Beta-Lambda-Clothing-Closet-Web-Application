<?php

include('authen.php');

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
} 
echo "Connected successfully";

$var_username = $_POST['uname'];

$var_password = $_POST['psw'];

echo "The user name entered is $var_username \n";
echo"\n";
echo "The password entered is $var_password \n";
$sql = "select username,passwrd from user where username='$var_username'";
$result = $conn->query($sql);
if ($result->num_rows > 0) {
    // output data of each row
    while($row = $result->fetch_assoc()) {
        echo  $row["username"]. "  " . $row["passwrd"]. " ". "<br>";
		//echo "id: " . $row["id"]. " - Name: " . $row["firstname"]. " " . $row["lastname"]. "<br>";
    }
} else {
    echo "0 results";
}



?>