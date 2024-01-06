<?php
include 'includes/header.php';
?>          
<!-- sidebar -->          
<div class="container py-4">
    <div class="row mb-3">
        <?php include 'includes/sidebar.php';?>
<!-- dynamic content -->        
        <div class="col-md-8 themed-grid-col">
             <?php include 'includes/posterdetails.php';?>
        </div>
       <!--poster image, about the poster, about the film, other poster for film, other poster with stars -->
    </div>
    <?php 
    include 'includes/footer.php';
    ?>