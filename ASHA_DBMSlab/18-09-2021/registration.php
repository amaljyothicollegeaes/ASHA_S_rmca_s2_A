<?php
   // connect to mongodb
   require 'vendor/autoload.php';

  

$m = new MongoDB\Client("mongodb://localhost:27017");
   echo "Connection to database successfully";
	
   
   $db = $m->test123;
   echo "Database mydb selected";
   $collection = $db->sample;
   echo "Collection selected successfully";
?>
<!DOCTYPE html>
  <html lang="en">
    <head>
        
        <style>
            body{
                margin-left: 35%;
                margin-right:35% ;
            }
            .wrapper{
                background-color: aliceblue;
                align-items: center;
                padding-left: 20%;
                padding-right: 20%;
                padding-top: 5%;
                margin-top: 20%;
                padding-bottom: 10%;
            }
            form{
                justify-self: center;

            }
            label{
              float: left;
            }
            input{
              float: right;
            }
            select{
              float: right;
              padding-left: 35px;
              padding-right: 55px;
            }
            .gen input{
              float: right;
              margin-left: 50%;
              text-align: right;
            }
            .gen label{
              float: left;
            }
            .custom_select select{
              padding-left: 20px;
            }
        </style>	
    </head>
<body>

<div class="wrapper">
      <h1>Registration Form </h1>
      <form name="myform" action="registration.php" method="POST" onsubmit="return(validate());" enctype="multipart/form-data">
      
          <label>First Name</label>
          <input type="text"  name="firstname" class="input">
          <br><br>
          <label>Last Name</label>
          <input type="text" name="lastname" class="input">
          <br><br>
          <label>Username</label>
          <input type="text" name="username"  class="input">
          <br><br>
          <label> Password</label>
          <input type="password" name="password" class="input">
          <br><br>
          <label>email</label>
          <input type="email" name="email" class="input">
          <br><br>
          <input type = "submit" value = "submit" name="click" class="btn">
        
         </div>
   </form>
</div>	


	
</body>
</html>

<?php
   if(isset($_POST["click"])){
 
      $fname=$_POST["firstname"];
  
      $lname=$_POST["lastname"];
      $user=$_POST["username"];
      $pwd=$_POST["password"];
     
      
      $emp=$_POST["email"];
      
      $document = array( 
        "title" => "$fname", 
        "description" => "$lname", 
        "likes" => "$user",
        "url" => "$pwd",
        "by" => " $emp"
     );
      
     $collection->insertOne($document);
     
    }



?> 


