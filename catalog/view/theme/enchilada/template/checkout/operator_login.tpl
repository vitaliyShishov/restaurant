<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title></title>

    <!--<link rel="stylesheet" href="catalog/view/theme/enchilada/stylesheets/jquery.custom-scrollbar.css">-->
    <link rel="stylesheet" href="catalog/view/theme/enchilada/stylesheets/style_admin.css">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

    <!--<script defer src="catalog/view/theme/enchilada/js/jquery.custom-scrollbar.min.js"></script>-->
    <script defer src="catalog/view/theme/enchilada/js/script_admin.js"></script>
</head>
<header>
    <div class="wrapper">
        <br><br>
        <br><br>
        <br><br>
        <br><br>
        <br><br>
        <br><br>
        <br><br>

        <img src="catalog/view/theme/enchilada/images/logo.png" alt=" " class="logo">
        <h1 class="main_h"><?php echo $heading_title; ?></h1>
    </div>

</header>

<div class="wrapper">
    <div class="content">
        <section class="order">
            <div class="single_proposal">
                <h1 class="panel-title"><?php echo $text_login; ?></h1>
            </div>
            <div class="info">
                <?php if ($success) { ?>
                <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
                    <button type="button" class="close" data-dismiss="alert">&times;</button>
                </div>
                <?php } ?>
                <?php if ($error_warning) { ?>
                <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
                    <button type="button" class="close" data-dismiss="alert">&times;</button>
                </div>
                <?php } ?>
                <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
                    <div class="manage_info">
                        <label for="input-username"><?php echo $entry_username; ?></label>
                        <div class="general_info""><span class="input-group-addon"><i class="fa fa-user"></i></span>
                            <input type="text" name="username" value="<?php echo $username; ?>" placeholder="<?php echo $entry_username; ?>" id="input-username" class="form-control" />
                        </div>

                    <div class="form-group">
                        <label for="input-password"><?php echo $entry_password; ?></label>
                        <div class="input-group"><span class="input-group-addon"><i class="fa fa-lock"></i></span>
                            <input type="password" name="password" value="<?php echo $password; ?>" placeholder="<?php echo $entry_password; ?>" id="input-password" class="form-control" />
                        </div>
                    </div>

                        <button type="submit" class="btn close_order_button"><?php echo $button_login; ?></button>

                    <?php if ($redirect) { ?>
                    <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
                    <?php } ?>
                </form>
            </div>
        </section>
    </div>
</div>

</html>
<!--
<form action="" method="POST">
    <?php echo $entry_username; ?><input type="text" name="username"><br>
    <?php echo $entry_password; ?><input type="password" name="password"><br>
    <input type ="submit"><?php echo $button_login; ?></button>
    <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
</form>-->
