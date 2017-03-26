<?php

$pname= htmlspecialchars($_POST["inputEmail3"]);
$pprice= htmlspecialchars($_POST["inputPassword3"]);
$pdonor= htmlspecialchars($_POST["inputPassword4"]);
$imageName = $_FILES['fileToUpload']['name'];

echo $imageName;

include('./authen.php');
// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
} 

$pid = rand(10,1000);
    $sql = mysqli_query($conn,"INSERT INTO products
VALUES ('$pid','$pname','$pprice','$pdonor',0,'$imageName')");


      header('Location:addproduct.php');
            mysqli_close($conn);
?>