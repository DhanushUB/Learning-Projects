<?php
include 'dblinker.php';

function register(){
    try {
        $username = $_SESSION['username'];
        $checkoutTime = date('Y-m-d H:i:s',time());
        if($_SESSION['username'] != $username){
            return "fail";
        }
        $link = linkToUBRS();
        $handle=$link->prepare("SELECT DISTINCT `users`.`UBId`,`users`.`Semester` FROM `roomreservation` INNER JOIN `users` ON `users`.`Username`=:username WHERE `roomreservation`.`UBId` =`users`.`UBId` AND `roomreservation`.`EndTime` IS NULL");
        $handle->bindParam(':username', $username, PDO::PARAM_STR);
        $handle->execute();
        if($handle->rowCount() != 1){
            echo "fail";
        }else{
            $result = $handle->fetchAll(PDO::FETCH_OBJ);
            $userId=$result[0]->UBId;

            $handle=$link->prepare("UPDATE `users` SET `RoomID`=NULL WHERE `username`=:username");
            $handle->bindParam(':username', $username, PDO::PARAM_STR);
            $handle->execute();
            $handle=$link->prepare("UPDATE `roomreservation` SET `EndTime`=:checkoutTime WHERE `UBId`=:userId AND `EndTime` IS NULL");
            $handle->bindParam(':checkoutTime', $checkoutTime, PDO::PARAM_STR);
            $handle->bindParam(':userId', $userId, PDO::PARAM_STR);
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