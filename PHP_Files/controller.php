<?php

$loginId= htmlspecialchars($_POST["loginId"]);
$password1= htmlspecialchars($_POST["password"]);
$firstName= htmlspecialchars($_POST["firstName"]);
$lastName= htmlspecialchars($_POST["lastName"]);
$ssn= htmlspecialchars($_POST["ssn"]);
$phoneNumber= htmlspecialchars($_POST["phoneNumber"]);
$email= htmlspecialchars($_POST["email"]);
$address= htmlspecialchars($_POST["address"]);
$gender= htmlspecialchars($_POST["gender"]);
$dateOfBirth= htmlspecialchars($_POST["dateOfBirth"]);
$newsLetter= htmlspecialchars($_POST["newsLetter"]);


$role = "customer";


include('authen.php');

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
} 


$sqll = "SELECT * FROM person WHERE Ssn='$ssn'";
$result = mysqli_query($conn, $sqll); 
  if (mysqli_num_rows($result) > 0) 
  {
       die("user already exists!!!!!");
  }
  else
  {
      //echo $fname;

    $sql = mysqli_query($conn,"INSERT INTO person
VALUES ('$ssn','$loginId','$password1','$firstName','$lastName','$address','$phoneNumber','$email','$gender','$dateOfBirth','$role')");
    
      
      mysqli_query($conn,"INSERT INTO shoppingcart VALUES ('$ssn',0.0)");
      
    mysqli_query($conn,"INSERT INTO buyer VALUES ('$ssn','$newsLetter','$ssn')");

      
      echo "<script>
alert('successfully registered...Please login to continue');
window.location.href='index.php';
</script>";
      
            mysqli_close($conn);
}
/*
$sql = "select Login_id,Ssn from person";
$result = $conn->query($sql);
if ($result->num_rows > 0) {
    // output data of each row
    while($row = $result->fetch_assoc()) {
        
        if($row['Login_id']==$loginId){
            $url='register.php';
            session_start();
            $_SESSION['errorMessage'] = 'The user with Login ID already Exists! Please Change the Login ID';
            $msg= 'The user with Login ID already Exists! Please Change the Login ID';
            header('Location: register.php');
            
        }else{
                if($row['Ssn']==$ssn){
                    $url='register.php';
            $_SESSION['errorMessage'] = 'The user with SSN already Exists! Please verify the SSN!';
            header('Location: ' . $url);   
                }
            }
        
    
        
       // echo  $row[First_name].  " ". "<br>";
		//echo "id: " . $row["id"]. " - Name: " . $row["firstname"]. " " . $row["lastname"]. "<br>";
    }
} else {
    echo "0 results";
}
*/    

?>