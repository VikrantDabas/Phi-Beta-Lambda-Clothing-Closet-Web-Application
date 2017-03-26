<?php
error_reporting(0);
session_start();
if(isset($_SESSION['Cartid']))
{
   header('Location:login.php');
}

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

                        <!-- <li class="dropadown">
          <a href="#">Welcome </a>
          <ul class="dropdown-menu">
            <li><a href="#">Shirts</a></li>
            <li><a href="#">T-Shirts</a></li>
            <li><a href="#">Polos</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#">Jeans</a></li>
            <li><a href="#">Pants and Joggers</a></li>
          </ul>
        </li>
          
          <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Women<span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#">Tops & T-Shirts</a></li>
            <li><a href="#">Jeans</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#">Jackets</a></li>
            <li><a href="#">Coats</a></li>
          </ul>
        </li>
          
          <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Kids<span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#">Shirts</a></li>
            <li><a href="#">Jeans</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#">Tops</a></li>
            <li><a href="#">Jeans</a></li>
          </ul>
        </li>-->
                    </ul>
                    <form class="navbar-form navbar-left" method="POST" action="">
                        <div class="form-group" style="margin-left:810px;">
                            <input type="text" class="form-control" name="search" placeholder="Type the name of product">
                        </div>
                        <button type="submit" class="btn btn-default">Search</button>
                    </form>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="register.php">Register</a></li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown"><b>Login</b> <span class="caret"></span></a>
                            <ul id="login-dp" class="dropdown-menu">
                                <li>
                                    <div class="row">
                                        <div class="col-md-12">

                                            <form class="form" role="form" method="post" action="login_submit.php" accept-charset="UTF-8" id="login-nav">
                                                <div class="form-group">
                                                    <label class="sr-only" for="exampleInputEmail2">User Name</label>
                                                    <input type="text" class="form-control" id="userName" name="username" placeholder="User Name" required>
                                                </div>
                                                <div class="form-group">
                                                    <label class="sr-only" for="exampleInputPassword2">Password</label>
                                                    <input type="password" class="form-control" id="Password" name="password" placeholder="Password" required>
                                                </div>
                                                <div class="form-group">
                                                    <button type="submit" class="btn btn-primary btn-block">Sign in</button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
                <!-- /.navbar-collapse -->
            </div>
            <!-- /.container-fluid -->
        </nav>



        <div class="container">

            <div class="row">





                <!-- Start of an item-->
                <?php
require_once('./authen.php');
   
    $srch = $_POST['search'];
    if(isset($_POST['search'])) {
            $query = "SELECT * FROM `products` WHERE product_name LIKE '%$srch%'  AND status=0 ";
    }
    else {
    $query='SELECT * FROM `products`  WHERE status = 0';
        }
			$res=mysqli_query($conn,$query);
			while($data1=mysqli_fetch_array($res)) {
				?>
                
               <?php 
                $img = "images/".$data1['image'];
             ?>
                    <form action="indexaddproduct.php" method="GET">
                        <input type="hidden" value="<?php echo $data1['product_id']; ?>" name="prod_id" />
                        <input type="hidden" value="item1" name="prod_name" />

                        <div class="col-sm-3 col-md-2">
                            <div class="thumbnail">
                                <img src="<?php echo $img; ?>" alt="Blue Jeans">
                                <div class="caption">
                                    <h5>
                                        <?php echo $data1['product_name']; ?>
                                    </h5>
                                    <p>Price: $
                                        <?php echo $data1['product_price']  ?>
                                    </p>
                                    <button class="btn btn-danger btn-sm">
     <img src="images/cart%20icon.png" width="20" /> Add to Cart
</button>
                                </div>
                            </div>
                        </div>
                    </form>

                    <?php
			}
    ?>

            </div>

        </div>




        <!-- Latest compiled and minified JavaScript -->
        <script src="jquery-3.1.1/jquery-3.1.1.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

    </body>

    </html>