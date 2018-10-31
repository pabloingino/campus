<?php 
    $conn = new mysqli('10.0.10.90', 'rlsnjhzx_campus_user', 'C4m9u5_9455', 'rlsnjhzx_campus');
    
    if($conn->connect_error) {
      echo $error -> $conn->connect_error;
    }
    
    $conn->set_charset("utf8");
 ?>
