<?php
include 'db/dbconnection.php';

if (isset($_GET['Pid'])) {
    $pid = $_GET['Pid'];

  $query = "SELECT * FROM ((poster INNER JOIN `poster-film` ON poster.poster_id = `poster-film`.poster_id) INNER JOIN film ON `poster-film`.film_id = film.film_id) WHERE poster.poster_id = $pid";

} else {
  echo "<p>Something went wrong. Couldn't pull details for poster with that ID</p>";
}

$result = mysqli_query($link, $query);

if (mysqli_num_rows($result) > 0){

  /*output data of each row*/
  while($row = mysqli_fetch_assoc($result)){
    $imagepath = "/images/";
    $posterimage = $imagepath. $row["PosterImage_file"];
    $filmtitle = $row["film_title"];
    $filmyear = $row["film_year"];
    $keywords = $row["poster_keywords"];
    //echo "<p><strong>" . $filmtitle . " </strong>". $filmyear ." <em>Film Synopsis: " . $filmsynopsis."</em></p>";
    //echo "<div class='card mb-3'>"."<div class='row g-0'>"."<div class='col-md-4'>"."<img src='$posterimage' class='img-fluid img-thumbnail rounded-start' alt='...'>"."</div>"."<div class='col-md-8'>"."<div class='card-body'>"."<h5 class='card-title'>$filmtitle $filmyear</h5>"."<p class'card-text'>$keywords</p>"."</div>"."</div>"."</div>"."</div>";
    echo "<div class='alert alert-dark text-center' role='alert'><h3>" . "$filmtitle, $filmyear" . "</h3></div>";
    echo "<img src='$posterimage' class='image-fluid img-thumbnail' title='$filmtitle, $filmyear' alt='$keywords'/>";
    echo "<p>$keywords";

  }
} else {
  echo "0 results";
}

/* close connection */
include 'db/dbclose.php';
?>