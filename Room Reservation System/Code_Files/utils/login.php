<?php
include 'dblinker.php';

function login(){
    try {
        $username = $_POST['username'];
        $password = $_POST['password'];
        $link = linkToUBRS();
        $handle=$link->prepare("SELECT * FROM `users` WHERE `Username` =:username AND `Password`=:password");
        $handle->bindParam(':username', $username, PDO::PARAM_STR);
        $handle->bindParam(':password', $password, PDO::PARAM_STR);
        $handle->execute();
        if($handle->rowCount() == 1){
            $result=$handle->fetch(PDO::FETCH_ASSOC);
            $_SESSION["username"] = $result['Username'];
            $role = $result['Role'];
            echo $role;
        }else{
            echo "fail";
        }
    }

    catch(Exception $e){
        echo "F";
    }
}
session_start();
echo login();
?>