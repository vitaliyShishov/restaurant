<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="catalog/view/theme/default/slick/slick.css" />

    <link rel="stylesheet" href="catalog/view/theme/default/stylesheets/style.css">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
 
    <script src="catalog/view/theme/default/js/script.js"></script>

    <script  src="catalog/view/theme/default/js/custom_scroll.js"></script>

    <script src="catalog/view/theme/default/js/modal.js"></script>

    <script defer type="text/javascript" src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
    <script defer type="text/javascript" src="catalog/view/theme/default/slick/slick.min.js"></script>
</head>

<body>

    <?php if($preloader) { ?>
        <?php echo $preloader ; ?>
    <?php } else { ?>
    <section class="menu">

        <header>
            <div class="menu_button"></div>
            <div class="filter_button"></div>
            <div class="header_line"></div>
            <div class="header_logo"><img src="<?php echo $logo; ?>" alt=" "></div>

        </header>
    <?php } ?>




