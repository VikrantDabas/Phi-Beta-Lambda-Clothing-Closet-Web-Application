<?php
error_reporting(0);
session_start();
if(!isset($_SESSION['Cartid']))
{
   header('Location:index.php');
}
include('authen.php');

?>


    <html>

    <head>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

        <!-- Optional theme -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

        <style>
            .center {
                margin: auto;
                width: 50%;
                padding: 10px;
            }
            
            body {
                padding-top: 70px;
            }
        </style>

    </head>

    <body>

        <!--start of the navgation bar-->
        <nav class="navbar navbar-default navbar-fixed-top">
            <div class="container-fluid">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
                    <a class="navbar-brand" href="index.php">Catawba Clothing</a>
                </div>

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">

                        <li class="dropdown">
                            <a>Welcome <?php echo $_SESSION['name']; ?></a>
                        </li>

                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <?php if(isset($_SESSION['role'])) {
                        echo "<li><a href='admin.php'>
                        <button class='btn btn-info btn-sm''>
                        Dashboard
                        </button>
                        </a></li>";
                        }
                        ?>
                        <li><a href="logout.php">Log Out</a></li>
                    </ul>
                </div>
                <!-- /.navbar-collapse -->
            </div>
            <!-- /.container-fluid -->
        </nav>


        <?php    
    $cart_id = $_SESSION['Cartid'];

    $sql = "SELECT products.product_name, products.product_price,products.product_id
FROM products
INNER JOIN shoppingcart_item
ON products.product_id=shoppingcart_item.product_id WHERE shoppingcart_item.Cart_id = '$cart_id'";
    
 $result = mysqli_query($conn, $sql); 
                        if (mysqli_num_rows($result) > 0) {
                            echo "<div class='container'>";
                            echo "<table class='table table-hover'  cellpadding='10' >";


echo "<tr><th>Cart Items</th></tr>";
echo "<tr><th>Product Name</th><th>Price</th></tr>";
?>

        <?php
$total_cost = 0;
                            while($row = mysqli_fetch_array($result)) {
                                echo "<tr class='table-row'>";
                                 ?>

            <?php
                                $username = $row['product_name'];
                                $price = $row['product_price'];

                                echo "<td>" . $username .  "</td>";
                               echo "<td>$" . $price .  "</td>";
                                $total_cost = $total_cost+$price;
                               ?>
                <input type="hidden" name="item_id" value="<?php echo $row['product_id'] ?>">

                <?php echo "<td><a href='delete_cart.php?product_id=" . $row['product_id'] ."'>
         
         <button class='btn btn-danger glyphicon glyphicon-trash ' style='width:100px;'>
  Delete
</button>
                </a></td></tr>
                
"; 
    
    
?>

                <?php
$tCost = $total_cost;
                            }
                            echo "                <tr> 
                    <td> <br><b>Total Cost</b> </td>
                    <td> <br>$".$tCost."  </td>
               <td><br><a href='./checkout.php?cost=".$tCost."'>
         
         <button class='btn btn-info' style='width:100px;'>
  Checkout
</button>
                </a></td> </tr>";
                            echo"</table>";
                           // echo "<td><a class='addbutton' href='add_category.php'>Add</a></td>";
                            
                            }
    else {
        
        echo "<p style='margin-left:550px;margin-top:300px;font-weight:bold;'>There are no items in your cart!</p>";
    }
    
   
    
    
    ?>


                    <!-- Latest compiled and minified JavaScript -->
                    <script src="jquery-3.1.1/jquery-3.1.1.min.js"></script>
                    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

    </body>

    </html>