<?php
include 'includes/header.php';
?>          
<!-- sidebar -->          
<div class="container py-4">
    <div class="row mb-3">
        <?php include 'includes/sidebar.php';?>
<!-- dynamic content -->        
        <div class="col-md-8 themed-grid-col">
            <?php include 'includes/count.php';?>
            <?php include 'includes/list.php';?>
        </div>
    </div>
    <?php 
    include 'includes/footer.php';
    ?>