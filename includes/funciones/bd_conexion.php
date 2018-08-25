<?php 
    $conn = new mysqli('localhost', 'campus_user', 'admin1234', 'gdlwebcamp');
    
    if($conn->connect_error) {
      echo $error -> $conn->connect_error;
    }
    
    $conn->set_charset("utf8");
 ?>
