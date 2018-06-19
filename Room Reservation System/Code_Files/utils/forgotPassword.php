<?php
include 'dblinker.php';

function register(){
    try {
        $username = $_POST['username'];
        $password = $_POST['password'];
        $securityQuestionID = $_POST['securityQuestionID'];
        $securityQuestionAnswer = $_POST['securityQuestionAnswer'];
        $link = linkToUBRS();
        $handle=$link->prepare("SELECT * FROM `users` WHERE `Username` =:username AND `SecurityQuestion`=:securityQuestionID AND `SecurityQuestionAnswer`=:securityQuestionAnswer");
        $handle->bindParam(':username', $username, PDO::PARAM_STR);
        $handle->bindParam(':securityQuestionID', $securityQuestionID, PDO::PARAM_STR);
        $handle->bindParam(':securityQuestionAnswer', $securityQuestionAnswer, PDO::PARAM_STR);
        $handle->execute();
        if($handle->rowCount() != 1){
            echo "fail";
        }else{
            $handle=$link->prepare("UPDATE `users` SET `Password`=:password WHERE `username`=:username  AND `SecurityQuestion`=:securityQuestionID AND `SecurityQuestionAnswer`=:securityQuestionAnswer");
            $handle->bindParam(':username', $username, PDO::PARAM_STR);
            $handle->bindParam(':password', $password, PDO::PARAM_STR);
            $handle->bindParam(':securityQuestionID', $securityQuestionID, PDO::PARAM_STR);
            $handle->bindParam(':securityQuestionAnswer', $securityQuestionAnswer, PDO::PARAM_STR);
            $handle->execute();
            echo "success";
        }
    }

    catch(Exception $e){
        echo $e;
    }
}
echo register();
?>