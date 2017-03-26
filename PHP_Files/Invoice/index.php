<?php
error_reporting(0);
session_start();
if(!isset($_SESSION['Cartid']))
{
   header('Location:index.php');
}

$servername = "localhost";
	$username = "root";
	$password = "";
	$dbname = "catawaba";
	$conn = new mysqli($servername, $username, $password, $dbname);

$cid = $_SESSION['Cartid'];
$result = mysqli_query($conn,"SELECT Order_id,Date FROM invoice WHERE Cart_id=$cid");
while($row = mysqli_fetch_array($result)) {
    $date = $row['Date'];
}
    $oid = $_GET['id'];

 $sql2 = mysqli_query($conn,"SELECT products.product_name, products.product_price,products.product_id
FROM products
INNER JOIN ordersplaced o
ON products.product_id= o.product_id
INNER JOIN invoice i
ON i.Order_id = o.Order_id
WHERE i.Cart_id = '$cid' AND i.Order_id='$oid'");
if(mysqli_num_rows($sql2) === 0) {
    echo "<p style='margin-left:550px;margin-top:300px;font-weight:bold;'>The requested page cannot be accessed!!!</p>";
    exit(0);
}
?>




<!doctype html>
<html>
	<head>
		<meta charset="utf-8">
		<title>Invoice</title>
		<link rel="stylesheet" href="style.css">
	</head>
	<body>
		<header>
			<h1>Invoice</h1>
			<address  >
                <!-- Database Query-->
                <?php
                    $cartid = $_SESSION['Cartid'];
                    $sql = mysqli_query($conn,"SELECT p.Ssn AS ssn, p.First_name AS Fname, p.Last_name AS Lname, p.Address AS address, p.Phone_number AS number, p.Email AS email FROM person AS p INNER JOIN buyer AS b ON p.Ssn = b.Ssn WHERE b.Cart_id='$cartid' ");
                $row = mysqli_fetch_array($sql);
                ?>
                
                <!-- Database Query-->
				<p><?php echo $row['Fname']; ?></p>
				<p><?php echo $row['address']; ?></p>
				<p><?php echo $row['email']; ?></p>
                <p><?php echo $row['number']; ?></p>
			</address>
			<span><img alt="" src="logo.png"><input type="file" accept="image/*"></span>
		</header>
		<article>
			<h1>Recipient</h1>

			<table class="meta">
				<tr>
					<th><span  >Order Id</span></th>
					<td><span  ><?php echo $oid;?></span></td>
				</tr>
				<tr>
					<th><span  >Date</span></th>
					<td><span  ><?php echo $date;?></span></td>
				</tr>
			</table>
			<table class="inventory">
				<thead>
					<tr>
						<th><span  >ProductId</span></th>
						<th><span  >Description</span></th>
						<th><span  >Price</span></th>
					</tr>
				</thead>
                <?php
                $total_cost = 0;
                while($row = mysqli_fetch_array($sql2)) { 
                $Pid  = $row['product_id'];
                 $Pname = $row['product_name'];
                $Pprice = $row['product_price'];
                    $total_cost = $total_cost + $Pprice;
                ?>
				<tbody>
					<tr>
						<td><span  ><?php echo $Pid; ?></span></td>
						<td><span  ><?php echo $Pname; ?></span></td>

						<td><span data-prefix>$</span><span><?php echo $Pprice; ?></span></td>
					</tr>
				</tbody>
                
                <?php } ?>
			</table>
			
			<table class="balance">
				<tr>
					<th><span >Total</span></th>
					<td><span data-prefix>$</span><span><?php echo $total_cost; ?></span></td>
				</tr>
				<tr>
					<th><span  >Amount Paid</span></th>
					<td><span data-prefix>$</span><span  ><?php echo $total_cost; ?></span></td>
				</tr>

			</table>
		</article>
		<aside>
			<h1><span  ></span></h1>

		</aside>
	</body>
</html>