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
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Men<span class="caret"></span></a>
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
                    </li>

                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Actions<span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="#">Add an Item</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="#">Update Item</a></li>
                            <li><a href="#">Delete Item</a></li>
                        </ul>
                    </li>


                </ul>

                <ul class="nav navbar-nav navbar-right">
                    <li><a href="#">View Cart</a></li>
                    <li><a href="#">Log Out</a></li>
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
    $arr = array(1, 2, 3, 4, 5,6,7, 2, 3, 4, 5, 2, 3, 4, 5, 2, 3, 4, 5);
    foreach ($arr as &$value) {
        ?>
                <div class="col-sm-3 col-md-2">
                    <div class="thumbnail">
                        <img src="images/blu-jeans-680x680.jpg" alt="Blue Jeans">
                        <div class="caption">
                            <h3>Blue Jeans</h3>
                            <p>Its a blue jeans!!!!</p>
                            <button class="btn btn-danger btn-sm">
     <img src="images/cart%20icon.png" width="20" /> Add to Cart
</button>
                        </div>
                    </div>
                </div>

                <!-- End of an item-->

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