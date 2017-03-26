<html>
<head>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

    
    <style>
    body { padding-top: 70px; background-image: url(images/logo2.png); background-repeat: no-repeat; background-position: right}
    </style>
</head>
<body>
<!--    <?php
    session_start();
    $msg = $_SESSION['errorMessage'];
    $_SESSION['errorMessage']='';
    if($msg != '') {
    echo "<script type='text/javascript'>alert('$msg');</script>";
    }
    ?>
-->   <!--start of the navgation bar--> 
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
         
        </li>
          
          <li class="dropdown">
        
        </li>
          
          <li class="dropdown">
         
        </li>
      </ul>

      <ul class="nav navbar-nav navbar-right">
        <li class="dropdown">

        </li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>   
     <div class="container">
  <form action="controller.php" method="post">
      
      <div class="form-group row">
      <label for="userName" class="col-sm-2 col-form-label">Login ID</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" id="loginId" name="loginId" placeholder="Login ID" style="width:300px" required="required">
      </div>
    </div>
      
      <div class="form-group row">
      <label for="inputPassword3" class="col-sm-2 col-form-label">Password</label>
      <div class="col-sm-10">
        <input type="password" class="form-control" id="password" name="password" placeholder="Password" style="width:300px" required="required">
      </div>
    </div>     
      
    <div class="form-group row">
      <label class="col-sm-2 col-form-label">First Name</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" id="inputEmail3" name="firstName" placeholder="First Name" style="width:300px" required="required">
      </div>
    </div>
    <div class="form-group row">
      <label class="col-sm-2 col-form-label">Last Name</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" id="inputPassword3" name="lastName" placeholder="Last Name" style="width:300px" required="required">
      </div>
    </div>
      
      <div class="form-group row">
      <label class="col-sm-2 col-form-label">SSN</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" id="ssn" name="ssn" maxlength="9" placeholder="SSN" style="width:150px" required="required">
      </div>
    </div>
      
      <div class="form-group row">
      <label class="col-sm-2 col-form-label">Phone Number</label>
      <div class="col-sm-10">
        <input type="tel" class="form-control" maxlength="10" id="phoneNumber" name="phoneNumber" placeholder="5555555555"  style="width:120px" required="required">
          </div>
    </div>
      
      <div class="form-group row">
      <label class="col-sm-2 col-form-label">Email</label>
      <div class="col-sm-10">
        <input type="email" class="form-control" id="email" name="email" placeholder="Email" style="width:300px" required="required">
      </div>
    </div>      
      
      <div class="form-group row">
      <label for="inputPassword3" class="col-sm-2 col-form-label">Address</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" id="address" name="address" placeholder="Address" style="width:500px" required="required">
      </div>
    </div>
      
      <fieldset class="form-group row">
      <label for="inputPassword3" class="col-sm-2 col-form-label">Gender</label>
      <div class="col-sm-10">
        <div class="form-check">
          <label class="form-check-label">
            <input class="form-check-input" type="radio" name="gender" id="gender" value="yes" checked>
            Male
          </label>
            <label class="form-check-label">
            <input class="form-check-input" type="radio" name="gender" id="gender" value="no">
            Female
          </label>
        </div>
      </div>
    </fieldset>
      
      <div class="form-group row">
      <label class="col-sm-2 col-form-label">Date of Birth</label>
      <div class="col-sm-10">
        <input class="form-check-input" type="date" name="dateOfBirth" id="dateOfBirth" value="yes" required="required">
          </div>
    </div>
      
    <fieldset class="form-group row">
      <label for="inputPassword3" class="col-sm-2 col-form-label">News Letter</label>
      <div class="col-sm-10">
        <div class="form-check">
          <label class="form-check-label">
            <input class="form-check-input" type="radio" name="newsLetter" id="newsLetter" value="yes" checked>
              
            Yes
          </label>
            <label class="form-check-label">
            <input class="form-check-input" type="radio" name="newsLetter" id="newsLetter" value="no">
            No
          </label>
        </div>
      </div>
    </fieldset>
      
    <div class="form-group row">
      <div class="offset-sm-2 col-sm-10">
        <button type="submit" class="btn btn-primary">Sign Up</button>
      </div>
    </div>
  </form>
</div>    
  
    
    
    
    
    
    
<!-- Latest compiled and minified JavaScript -->
    <script src="jquery-3.1.1/jquery-3.1.1.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    
</body>
</html>    