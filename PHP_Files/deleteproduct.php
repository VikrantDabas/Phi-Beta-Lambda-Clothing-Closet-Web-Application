<?php
session_start();
include('authen.php');

if ($conn->connect_error) {
	die("Connection failed: " . $conn->connect_error);
}


$id = $_GET['product_id'];

echo $id;
$sql = "DELETE FROM products WHERE product_id = '$id'";
//$result = mysqli_query($conn, $sql); 
if ($conn->query($sql) === TRUE) {
    	header("Location: admin.php");
  //echo $fname;
  }



mysqli_close($conn);
?>