<?php
if(
    isset($_POST['username']) &&
    isset($_POST['password'])
) {    
    /////////
    session_start();
include('authen.php');

    ////////
    $ssn =  $_POST['username'];
    $pwd = $_POST['password'];
    $sql = "SELECT * FROM person WHERE Ssn='$ssn' AND Password= '$pwd'";
    $result = mysqli_query($conn, $sql); 
  
    
    if (mysqli_num_rows($result) > 0)
  {
      		while($row = mysqli_fetch_array($result)) {	
if($row['Role'] == "admin") {
          $ssn = $row['Ssn'];
    $sql1 = mysqli_query($conn,"SELECT * FROM buyer WHERE Ssn = '$ssn'");
      $row1 = mysqli_fetch_assoc($sql1);
    $_SESSION['Cartid'] = $row1['Cart_id'];
    
    $_SESSION['role'] = "admin";
                    $_SESSION['name'] = $row['First_name'];

header('Location:admin.php');
}
else if($row['Role'] == "customer"){

    $_SESSION['Ssn'] = $row['Ssn'];
      $ssn = $row['Ssn'];
      $sql1 = mysqli_query($conn,"SELECT * FROM buyer WHERE Ssn = '$ssn'");
      $row1 = mysqli_fetch_assoc($sql1);
    $_SESSION['Cartid'] = $row1['Cart_id'];
                $_SESSION['name'] = $row['First_name'];
    header('Location:login.php');

            }else {
    header('Location:staff.php');
}
            }
        
        
  }
    else {
        echo "no rows";
    }
    
    
    
}
else {
    echo "adasd";
}

?>