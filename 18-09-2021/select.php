<?php
    require 'vendor/autoload.php';
    $server = new MongoDB\Client("mongodb://localhost:27017/test");
    
 
    
    
 
    $data  = "<table style='border:1px solid red;";
    $data .= "border-collapse:collapse' border='1px'>";
    $data .= "<thead>";
    $data .= "<tr>";
    $data .= "<th>title</th>";
    $data .= "<th>description</th>";
    $data .= "<th>likes</th>";
    $data .= "<th>url</th>";
    $data .= "<th>by</th>";
    $data .= "</tr>";
    $data .= "</thead>";
    $data .= "<tbody>";
 
    try{
        $db = $server->test123;
        $collection = $db->sample;
        $cursor = $collection->find();
        foreach($cursor as $document){
            $data .= "<tr>";
            $data .= "<td>" . $document["title"] . "</td>";
            $data .= "<td>" . $document["description"]."</td>";
            $data .= "<td>" . $document["likes"]."</td>";
            $data .= "<td>" . $document["url"]."</td>";
            $data .= "<td>" . $document["by"]."</td>";
            $data .= "</tr>";
        }
        $data .= "</tbody>";
        $data .= "</table>";
        echo $data;
 
    }catch(MongoException $mongoException){
        print $mongoException;
        exit;
    }