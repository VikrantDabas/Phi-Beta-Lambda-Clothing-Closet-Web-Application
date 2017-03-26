<?php
session_start();
include('authen.php');

if ($conn->connect_error) {
	die("Connection failed: " . $conn->connect_error);
}


$cartid = $_SESSION['Cartid'];
$orderid = rand(111111,999999);
$totalcost = $_GET['cost'];


mysqli_query($conn,"INSERT INTO invoice VALUES ('$orderid','$cartid','$totalcost',CURDATE())");

$result = mysqli_query($conn,"SELECT product_id FROM shoppingcart_item WHERE Cart_id='$cartid' ");

while($row = mysqli_fetch_array($result)) {
    $pid = $row['product_id'];
    mysqli_query($conn,"INSERT INTO ordersplaced VALUES ('$orderid','$pid')");
}


$r = mysqli_query($conn,"SELECT product_id FROM shoppingcart_item WHERE Cart_id= $cartid");

while($row = mysqli_fetch_array($r)){
 
    $pid = $row['product_id'];
    mysqli_query($conn,"UPDATE  `products` SET status= 1 WHERE product_id =$pid");
}


    
    
$result = "DELETE FROM shoppingcart_item WHERE Cart_id = $cartid";
mysqli_query($conn,$result);



header("Location: ./Invoice/index.php?id=$orderid");

?>