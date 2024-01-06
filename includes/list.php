<?php
include 'db/dbconnection.php';

if (isset($_GET['id'])) {
    $letterFilter = $_GET['id'];
  echo "<div class='alert alert-dark text-center' role='alert'><h3>" . $letterFilter . "</h3></div>";
  $query = "SELECT * FROM ((poster INNER JOIN `poster-film` ON poster.poster_id = `poster-film`.poster_id) INNER JOIN film ON `poster-film`.film_id = film.film_id) WHERE film_title LIKE '$letterFilter%' ORDER BY film_title";

} elseif (isset($_GET['Cid'])) {
    $colorFilter = $_GET['Cid'];
  echo "<div class='alert alert-dark text-center' role='alert'><h3>" . ucwords($colorFilter). "</h3></div>";
  $query = "SELECT * FROM ((((color INNER JOIN `poster-color` ON color.color_id = `poster-color`.color_id) INNER JOIN poster ON `poster-color`.poster_id = poster.poster_id) INNER JOIN `poster-film` ON poster.poster_id = `poster-film`.poster_id) INNER JOIN film ON `poster-film`.film_id = film.film_id) WHERE color.color_name LIKE '$colorFilter' ORDER BY film_title";

} elseif (isset($_GET['SLid'])) {
    $starFilter = $_GET['SLid'];
  echo "<div class='alert alert-dark text-center' role='alert'><h3>" . $starFilter. "</h3></div>";
  $query = "SELECT *, CONCAT_WS(' ', star_first, star_middle, star_last, star_suffix) AS star_name FROM ((((star INNER JOIN `poster-star` ON star.star_id = `poster-star`.star_id) INNER JOIN poster ON `poster-star`.poster_id = poster.poster_id) INNER JOIN `poster-film` ON `poster-film`.poster_id = poster.poster_id) INNER JOIN film ON `poster-film`.film_id = film.film_id) WHERE star_last LIKE '$starFilter%' ORDER BY star_last";

} elseif (isset($_GET['style'])) {
    $styleFilter = $_GET['style'];
  echo "<div class='alert alert-dark text-center' role='alert'><h3>" . $styleFilter. "</h3></div>";
  $query ="SELECT * FROM (((style INNER JOIN poster ON style.style_id = poster.style_id) INNER JOIN `poster-film` ON `poster-film`.poster_id = poster.poster_id) INNER JOIN film ON `poster-film`.film_id = film.film_id) WHERE style_name LIKE '$styleFilter%' ORDER BY style_name";

} elseif (isset($_GET['Gid'])) {
    $genreFilter = $_GET['Gid'];
  echo "<div class='alert alert-dark text-center' role='alert'><h3>" . $genreFilter. "</h3></div>";
  $query = "SELECT * FROM ((((genre INNER JOIN `film-genre` ON genre.genre_id = `film-genre`.genre_id) INNER JOIN film ON `film-genre`.film_id = film.film_id) INNER JOIN `poster-film` ON `poster-film`.film_id = film.film_id) INNER JOIN poster ON `poster-film`.poster_id = poster.poster_id) WHERE genre.genre_id = '$genreFilter' ORDER BY film.film_title";

} else {
  $query = "SELECT * FROM ((poster INNER JOIN `poster-film` ON poster.poster_id = `poster-film`.poster_id) INNER JOIN film ON `poster-film`.film_id = film.film_id) ORDER BY film_title";
}

$result = mysqli_query($link, $query);

if (mysqli_num_rows($result) > 0){

  /*output data of each row*/
  while($row = mysqli_fetch_assoc($result)){
    $imagepath = "/images/thumbnail/";
    $posterimage = $imagepath. $row["PosterImage_file"];
    $filmtitle = $row["film_title"];
    $filmyear = $row["film_year"];
    $keywords = $row["poster_keywords"];
    $p = $row["poster_id"];
    //echo "<p><strong>" . $filmtitle . " </strong>". $filmyear ." <em>Film Synopsis: " . $filmsynopsis."</em></p>";
    //echo "<div class='card mb-3'>"."<div class='row g-0'>"."<div class='col-md-4'>"."<img src='$posterimage' class='img-fluid img-thumbnail rounded-start' alt='...'>"."</div>"."<div class='col-md-8'>"."<div class='card-body'>"."<h5 class='card-title'>$filmtitle $filmyear</h5>"."<p class'card-text'>$keywords</p>"."</div>"."</div>"."</div>"."</div>";
    echo "<a href='poster.php?Pid=$p'><img src='$posterimage' class='image-fluid img-thumbnail' title='$filmtitle, $filmyear' alt='$keywords'/></a>";
  }
} else {
  echo "0 results";
}

/* close connection */
include 'db/dbclose.php';
?>