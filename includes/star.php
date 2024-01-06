<?php
include 'db/dbconnection.php';

$SLquery = "SELECT upper(SUBSTRING(star_last, 1, 1)) AS star_lastletter FROM star GROUP BY star_lastletter ORDER BY star_lastletter";
$SLresult = mysqli_query($link, $SLquery);
//$SFquery = "SELECT upper(SUBSTRING(star_first, 1, 1)) AS star_firstletter FROM star GROUP BY star_lastletter ORDER BY star_firstletter";
//$SFresult = mysqli_query($link, $SFquery);

echo "<ul class='list-inline '><li class='list-inline-item p-1 h5'><a href='/'>ALL</a></li>";
if (mysqli_num_rows($SLresult) > 0){
  /*output data of each row*/
  while($row = mysqli_fetch_assoc($SLresult)){
    $lastL = $row["star_lastletter"];
    echo "<li class='list-inline-item p-1 h5'><a href='index.php?SLid=$lastL'>" . $lastL . "</a></li>";
 
  }
} else {
  echo "0 results";
}
echo "</ul>";
/* close connection */
include 'db/dbclose.php';
?>