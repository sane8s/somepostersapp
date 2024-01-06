<?php

include 'db/dbconnection.php';

$query = "SELECT * FROM poster, film, `poster-film`
WHERE film.film_id = `poster-film`.film_id
AND poster.poster_id = `poster-film`.poster_id
ORDER by RAND() LIMIT 1;";
$result = mysqli_query($link, $query);

if (mysqli_num_rows($result) > 0){
  /*output data of each row*/
  while($row = mysqli_fetch_assoc($result)){
      $imagepath = "/images/medium/";
      $posterimage = $imagepath. $row["PosterImage_file"];
      $filmtitle = $row["film_title"];
      $description = $row["poster_description"];
    echo "<p><strong>" . $filmtitle. "</strong></p>";
    echo "<p>". $description. "</p>";
    //echo "<div>". "<img src='$posterimage'/>". "</div>";
    //echo "<img src='$posterimage' class='img-fluid' alt=...'/>";
    //echo "<img src='$posterimage' class='img-thumbnail' alt=...'/>";
  
  }
} else {
  echo "0 results";
}

/* close connection */
include 'db/dbclose.php';
?>