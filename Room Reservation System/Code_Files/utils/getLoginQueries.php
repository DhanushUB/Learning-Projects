<?php
include 'dblinker.php';

function register(){
    try {
        $username = $_SESSION["username"];
        $roomID = $_POST["roomID"];
        $link = linkToUBRS();
        $handle=$link->prepare("SELECT `UBId` FROM `users` WHERE `Username` =:username AND `roomID`=:roomID");
        $handle->bindParam(':username', $username, PDO::PARAM_STR);
        $handle->bindParam(':roomID', $roomID, PDO::PARAM_STR);
        $handle->execute();
        if($handle->rowCount() != 1){
            echo "fail";
        }else{
            $result = $handle->fetchAll(PDO::FETCH_OBJ);
            $userId=$result[0]->UBId;
            
            $handle=$link->prepare("SELECT * FROM `queries` INNER JOIN `users` ON `users`.`UBId`=`queries`.`UBId` WHERE `queries`.`RoomID`=:roomID AND `queries`.`UBId`=:userId");
            $handle->bindParam(':roomID', $roomID, PDO::PARAM_STR);
            $handle->bindParam(':userId', $userId, PDO::PARAM_INT);
            $handle->execute();
            $result = $handle->fetchAll(PDO::FETCH_ASSOC);
            echo json_encode($result);
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