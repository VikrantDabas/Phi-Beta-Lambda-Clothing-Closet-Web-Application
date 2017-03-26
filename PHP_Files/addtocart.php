<?php
error_reporting(0);
session_start();
include('authen.php');
if(!isset($_SESSION['Cartid']))
{
    echo "<script>
alert('Cannot add items to cart-- login');
window.location.href='index.php';
</script>";

}
$cartid = $_SESSION['Cartid'];
// get the product id
$id = $_GET['prod_id'];
$name = $_GET['prod_name'];

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
} 

/*if(!empty($_POST['submit']))
{*/

else{
$sqll = "SELECT * FROM shoppingcart_item WHERE Cart_id='$cartid' and product_id='$id'";
$result = mysqli_query($conn, $sqll); 
  if (mysqli_num_rows($result) > 0)
  {
  	
echo "<script>
alert('Cannot add more that one similar items in the cart');
window.location.href='index.php';
</script>";
      
  }
  else{
    $sql = "INSERT INTO shoppingcart_item
VALUES ('$cartid','$id');";
 // mysql_query($sql, $con);
if ($conn->query($sql) === TRUE) {
    echo "<script>
alert('Successfully added to cart!');
window.location.href='index.php';
</script>";
  //echo $fname;
  }
      else {
          echo "unable to insert";
      }
}

    


mysqli_close($conn);
}




?>