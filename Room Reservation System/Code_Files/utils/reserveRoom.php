<?php
include 'dblinker.php';

function register(){
    try {
        $username = $_SESSION['username'];
        $reservedTime = date('Y-m-d H:i:s',time());
        $roomID = $_POST['roomID'];
        $link = linkToUBRS();
        $handle=$link->prepare("SELECT * FROM `roomreservation` INNER JOIN `users` ON `users`.`Username`=:username WHERE `roomreservation`.`UBId` =`users`.`UBId` AND `roomreservation`.`EndTime` IS NULL");
        $handle->bindParam(':username', $username, PDO::PARAM_STR);
        $handle->execute();
        if($handle->rowCount() != 0){
            echo "fail";
        }else{
            $handle=$link->prepare("SELECT `UBId`,`Semester` FROM `users` WHERE `Username`=:username");
            $handle->bindParam(':username', $username, PDO::PARAM_STR);
            $handle->execute();
            $result = $handle->fetchAll(PDO::FETCH_OBJ);
            $userId=$result[0]->UBId;
            $semester=$result[0]->Semester;

            $handle=$link->prepare("UPDATE `users` SET `RoomID`=:roomID WHERE `username`=:username");
            $handle->bindParam(':username', $username, PDO::PARAM_STR);
            $handle->bindParam(':roomID', $roomID, PDO::PARAM_STR);
            $handle->execute();
            $handle=$link->prepare("INSERT INTO `roomreservation`(`RoomID`, `ReservedTime`, `UBId`, `Semester`, `EndTime`) VALUES (:roomId,:reservedTime,:userId,:semester,NULL)");
            $handle->bindParam(':roomId', $roomID, PDO::PARAM_STR);
            $handle->bindParam(':reservedTime', $reservedTime, PDO::PARAM_STR);
            $handle->bindParam(':userId', $userId, PDO::PARAM_STR);
            $handle->bindParam(':semester', $semester, PDO::PARAM_STR);
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