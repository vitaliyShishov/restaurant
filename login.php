<?php

include 'config_operator.php';

if (isset($_POST['login']) && isset($_POST['password'])) {
    if(!empty($_POST['login']) && !empty($_POST['password'])) {
        if(($_POST['login'] == ADMIN_LOGIN) && (md5($_POST['password']) == ADMIN_PASSWORD)) {
            session_start();
            $_SESSION['operator_login'] = ADMIN_LOGIN;
            $_SESSION['operator_password'] = ADMIN_PASSWORD;

            header('Location: index.php?route=checkout/operator');
} else {
    echo "Доступ к операторскому разделу запрещен!";
        }
    }
}

if(isset($_GET['action']) && ($_GET['action'] == 'logout')) {
    session_start();
    unset($_SESSION['operator_password']);
    unset($_SESSION['operator_login']);
    unset($_POST['login']);
    unset($_POST['password']);
    header('Location: login.php');
}

if (strripos($_SERVER['HTTP_REFERER'], 'checkout/operator')){

    echo "Вы успешно вышли, авторизуйтесь заново для доступа к операторской!";
}


//echo "<br>".ADMIN_LOGIN.' - '.ADMIN_PASSWORD;
//
//echo $_POST['login'].' - '.md5($_POST['password']).'<br>';
?>

<form action="" method="POST">
    Введите логин<input type="text" name="login">
    Введите пароль<input type="password" name="password">
    <input type ="submit" value="Войти">
</form>