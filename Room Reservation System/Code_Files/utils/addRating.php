<?php
include 'dblinker.php';

function register(){
    try {
        $username = $_SESSION['username'];
        $ratedOn = date('Y-m-d H:i:s',time());
        $rating = $_POST['rating'];
        if($_SESSION['username'] != $username){
            return "fail";
        }
        $roomID = $_POST["roomID"];
        $link = linkToUBRS();
        $handle=$link->prepare("SELECT DISTINCT `users`.`UBId`,`users`.`Semester` FROM `roomreservation` INNER JOIN `users` ON `users`.`Username`=:username WHERE `roomreservation`.`UBId` =`users`.`UBId` AND `roomreservation`.`EndTime` IS NULL");
        $handle->bindParam(':username', $username, PDO::PARAM_STR);
        $handle->execute();
        if($handle->rowCount() != 1){
            echo "fail";
        }else{
            $result = $handle->fetchAll(PDO::FETCH_OBJ);
            $userId=$result[0]->UBId;
            $semester=$result[0]->Semester;
        
            $handle=$link->prepare("INSERT INTO `rating`(`UBId`, `Semester`, `RatedOn`, `Rating`, `RoomID`) VALUES (:userId,:semester,:ratedOn,:rating, :roomID)");
            $handle->bindParam(':ratedOn', $ratedOn, PDO::PARAM_STR);
            $handle->bindParam(':rating', $rating, PDO::PARAM_STR);
            $handle->bindParam(':roomID', $roomID, PDO::PARAM_STR);
            $handle->bindParam(':semester', $semester, PDO::PARAM_STR);
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