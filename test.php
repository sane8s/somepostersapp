<?php 
include 'includes/db/dbconnection.php';

//Test DB Connection. Return successful conneciton.
echo "Success: A proper connection to MySQL was made! The $dbname database is great." . PHP_EOL;
echo "Host information: " . mysqli_get_host_info($link) . PHP_EOL;

// Perform query and return number of rows.
if ($result = mysqli_query($link, "SELECT * FROM poster;")) {
  echo "Returned rows are: " . mysqli_num_rows($result);
  // Free result set
  mysqli_free_result($result);
}

/* close connection */
include 'includes/db/dbclose.php';
?>