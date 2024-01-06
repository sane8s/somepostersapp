<?php
include 'db/dbconnection.php';

$query = "SELECT * FROM genre ORDER BY genre_title";
$result = mysqli_query($link, $query);

echo "<ul class='list-inline '><li class='list-inline-item p-1 h5'><a href='/'>ALL</a></li>";
if (mysqli_num_rows($result) > 0){
  /*output data of each row*/
  while($row = mysqli_fetch_assoc($result)){
    $genre = $row["genre_title"];
    $genredef = $row["genre_description"];
    $g = $row["genre_id"];
    echo "<li class='list-inline-item p-1 h5'><a href='index.php?Gid=$g' title='$genre'>" . $genre . "</a></li>";
 
  }
} else {
  echo "0 results";
}
echo "</ul>";
/* close connection */
include 'db/dbclose.php';
?>