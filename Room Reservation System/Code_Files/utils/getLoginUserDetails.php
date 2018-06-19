<?php
include 'dblinker.php';

function login(){
    try {

        $link = linkToUBRS();
        $username = $_SESSION["username"];
        if($_SESSION['username'] != $username){
            echo "fail";
        }
        $handle=$link->prepare("SELECT * FROM `users` WHERE `Username` =:username");
        $handle->bindParam(':username', $username, PDO::PARAM_STR);
        $handle->execute();
        if($handle->rowCount() == 1){
            $result=$handle->fetch(PDO::FETCH_ASSOC);
            echo json_encode($result);
        }else{
            echo "fail";
        }
    }

    catch(Exception $e){
        echo "F";
    }
}
session_start();
if (!isset($_SESSION['username'])){
    echo "fail";
}
echo login();
?>