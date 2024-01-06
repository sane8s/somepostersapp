<?php 
include 'db/dbconnection.php';

$query = "SELECT * from poster";
  
    if ($result = mysqli_query($link, $query)) {
  
    // Return the number of rows in result set
    $postercount = mysqli_num_rows( $result );
      
    // Display result
    echo "<h2>$postercount Posters & counting...</h2>";
    echo "<hr>";
}
 
/* close connection */
include 'db/dbclose.php';
?>