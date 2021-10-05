<?php
   // connect to mongodb
   require 'vendor/autoload.php';

  

$m = new MongoDB\Client("mongodb://localhost:27017");
   echo "Connection to database successfully";
	
   
   $db = $m->test123;
   echo "Database mydb selected";
   $collection = $db->sample;
   echo "Collection selected succsessfully";
	
   $document = array( 
      "title" => "class", 
      "description" => "students", 
      "likes" => 1000,
      "url" => "http://www.apple.com/mongodb/",
      "by" => "apple"
   );
	
   $collection->insertOne($document);
   echo "Document inserted successfully";
?>