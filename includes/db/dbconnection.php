<?php
//connect to database.
include 'config.php';
$dbhost = $dbh;
$dbuser = $dbu;
$dbpassword = $dbp;
$dbname = $dbn;
$link = mysqli_connect($dbhost, $dbuser, $dbpassword, $dbname);

mysqli_set_charset($link, "utf8mb4");
//printf("Current character set: %s\n", mysqli_character_set_name($link));

//If no connection, return error.
if (!$link) {
    echo "Error: Unable to connect to MySQL." . PHP_EOL;
    echo "Debugging errno: " . mysqli_connect_errno() . PHP_EOL;
    echo "Debugging error: " . mysqli_connect_error() . PHP_EOL;
    exit;
}

/*
//Test DB Connection. Return successful conneciton. Use test.php.
echo "Success: A proper connection to MySQL was made! The $dbname database is great." . PHP_EOL;
echo "Host information: " . mysqli_get_host_info($link) . PHP_EOL;

// Perform query and return number of rows.
if ($result = mysqli_query($link, "SELECT * FROM routine;")) {
  echo "Returned rows are: " . mysqli_num_rows($result);
  // Free result set
  mysqli_free_result($result);
}
*/
//mysqli_close($link);
?>