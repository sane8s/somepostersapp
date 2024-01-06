<?php
include 'db/dbconnection.php';

$query = "SELECT * FROM style ORDER BY style_name";
$result = mysqli_query($link, $query);

echo "<ul class='list-inline '><li class='list-inline-item p-1 h5'><a href='/'>ALL</a></li>";
if (mysqli_num_rows($result) > 0){
  /*output data of each row*/
  while($row = mysqli_fetch_assoc($result)){
    $stylename = $row["style_name"];
    $styledef = $row["style_description"];
    echo "<li class='list-inline-item p-1 h5'><a href='index.php?style=$stylename' title='$styledef'>" . $stylename . "</a></li>";
 
  }
} else {
  echo "0 results";
}
echo "</ul>";
/* close connection */
include 'db/dbclose.php';
?>