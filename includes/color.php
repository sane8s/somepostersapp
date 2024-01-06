<?php
include 'db/dbconnection.php';

$query = "SELECT * FROM color ORDER BY hexcode";//generate all the colors in the database
$result = mysqli_query($link, $query);

echo "<ul class='list-inline'><a href='/' title='ALL'><li class='list-inline-item' style='border:1px solid black;height:49px;width:49px;margin:2px'></li></a>";

if (mysqli_num_rows($result) > 0){
  /*output data of each row*/
  while($row = mysqli_fetch_assoc($result)){
    $hex = $row["hexcode"];
    $c = $row["color_id"];
    $color = $row["color_name"];
    echo "<a href='index.php?Cid=$color' title='$color'><li class='list-inline-item' style='background-color:#$hex;height:50px;width:50px;margin:2px'></li></a>"; 
  }
} else {
  echo "0 results";
}
echo "</ul>";


/* close connection */
include 'db/dbclose.php';
?>