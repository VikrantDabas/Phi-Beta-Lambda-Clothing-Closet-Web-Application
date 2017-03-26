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
      </ul>
      <form class="navbar-form navbar-left">
        <div class="form-group">
          <input type="text" class="form-control" placeholder="Search">
        </div>
        <button type="submit" class="btn btn-default">Submit</button>
      </form>
      <ul class="nav navbar-nav navbar-right">
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown"><b>Login</b> <span class="caret"></span></a>
			<ul id="login-dp" class="dropdown-menu">
				<li>
					 <div class="row">
							<di  v class="col-md-12">
								
								 <form class="form" role="form" method="post" action="login" accept-charset="UTF-8" id="login-nav">
										<div class="form-group">
											 <label class="sr-only" for="exampleInputEmail2">User Name</label>
											 <input type="text" class="form-control" id="userName" placeholder="User Name" required>
										</div>
										<div class="form-group">
											 <label class="sr-only" for="exampleInputPassword2">Password</label>
											 <input type="password" class="form-control" id="exampleInputPassword2" placeholder="Password" required>
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
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>   
     <div class="container">
  <form>
      
      <div class="container">
  <form>
    <div class="form-group row">
      <label class="col-sm-2 col-form-label">First Name</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" id="inputEmail3" placeholder="First Name" style="width:300px">
      </div>
    </div>
    <div class="form-group row">
      <label class="col-sm-2 col-form-label">Last Name</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" id="inputPassword3" placeholder="Last Name" style="width:300px">
      </div>
    </div>
      
      <div class="form-group row">
      <label class="col-sm-2 col-form-label">SSN</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" id="inputPassword3" placeholder="SSN" style="width:150px">
      </div>
    </div>
      
      <div class="form-group row">
      <label class="col-sm-2 col-form-label">Phone Number</label>
      <div class="col-sm-10">
        <input type="tel" class="form-control" maxlength="10" id="inputPassword3" placeholder="5555555555"  style="width:120px">
          </div>
    </div>
      
      <div class="form-group row">
      <label class="col-sm-2 col-form-label">Email</label>
      <div class="col-sm-10">
        <input type="email" class="form-control" id="inputPassword3" placeholder="Email" style="width:300px">
      </div>
    </div>      
      
      <div class="form-group row">
      <label for="inputPassword3" class="col-sm-2 col-form-label">Address</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" id="inputPassword3" placeholder="Address" style="width:500px">
      </div>
    </div>
      
      <div class="form-group row">
      <label for="inputPassword3" class="col-sm-2 col-form-label">User Name</label>
      <div class="col-sm-10">
        <input type="password" class="form-control" id="inputPassword3" placeholder="User Name" style="width:300px">
      </div>
    </div>
      
      <div class="form-group row">
      <label for="inputPassword3" class="col-sm-2 col-form-label">Password</label>
      <div class="col-sm-10">
        <input type="password" class="form-control" id="inputPassword3" placeholder="Password" style="width:300px">
      </div>
    </div>
      
    <fieldset class="form-group row">
      <label for="inputPassword3" class="col-sm-2 col-form-label">News Letter</label>
      <div class="col-sm-10">
        <div class="form-check">
          <label class="form-check-label">
            <input class="form-check-input" type="radio" name="gridRadios" id="gridRadios1" value="yes" checked>
            Yes
          </label>
            <label class="form-check-label">
            <input class="form-check-input" type="radio" name="gridRadios" id="gridRadios2" value="no">
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
  </form> 

    </div>
    
    
    
    
    
    
<!-- Latest compiled and minified JavaScript -->
    <script src="jquery-3.1.1/jquery-3.1.1.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    
</body>
</html>    