<?php
include 'dblinker.php';
session_start();
function register(){
    try {
        $username = $_POST['username'];
        $password = $_POST['password'];
        $newPassword = $_POST['newPassword'];
        if($_SESSION['username'] != $username){
            return "fail";
        }
        $link = linkToUBRS();
        $handle=$link->prepare("SELECT * FROM `users` WHERE `Username` =:username AND `Password`=:password");
        $handle->bindParam(':username', $username, PDO::PARAM_STR);
        $handle->bindParam(':password', $password, PDO::PARAM_STR);
        $handle->execute();
        if($handle->rowCount() != 1){
            echo "fail";
        }else{
            $handle=$link->prepare("UPDATE `users` SET `Password`=:newPassword WHERE `username`=:username AND `password`=:password");
            $handle->bindParam(':username', $username, PDO::PARAM_STR);
            $handle->bindParam(':password', $password, PDO::PARAM_STR);
            $handle->bindParam(':newPassword', $newPassword, PDO::PARAM_STR);
            $handle->execute();
            echo "success";
        }
    }

    catch(Exception $e){
        echo $e;
    }
}
if (!isset($_SESSION['username'])){
    return "fail";
}
echo register();
?>