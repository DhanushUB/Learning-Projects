<?php
include 'dblinker.php';

function register(){
    try {
        $username = $_SESSION['username'];
        $respondedOn = date('Y-m-d H:i:s',time());
        $response = $_POST['response'];
        if($_SESSION['username'] != $username){
            return "fail";
        }
        $queryId = $_POST["queryId"];
        $link = linkToUBRS();

        $handle=$link->prepare("SELECT * FROM `users` WHERE `Username` =:username");
        $handle->bindParam(':username', $username, PDO::PARAM_STR);
        $handle->execute();
        if($handle->rowCount() != 1){
            echo "fail";
        }else{
            $result=$handle->fetch(PDO::FETCH_ASSOC);
            if($result['Role'] != "Admin"){
                return "Unauthorized User";
            }
            $handle=$link->prepare("UPDATE `queries` SET `Response`=:response, `RespondedON`=:respondedOn WHERE `QueryId`=:queryId");
            $handle->bindParam(':respondedOn', $respondedOn, PDO::PARAM_STR);
            $handle->bindParam(':response', $response, PDO::PARAM_STR);
            $handle->bindParam(':queryId', $queryId, PDO::PARAM_STR);
            $handle->execute();
            echo "success";
        }
    }
    catch(Exception $e){
        echo $e;
    }
}
session_start();
if (!isset($_SESSION['username'])){
    return "fail";
}
echo register();
?>