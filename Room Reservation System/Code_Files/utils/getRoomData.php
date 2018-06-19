<?php
include 'dblinker.php';

function getRoomData(){
    try {
        $roomID = $_POST['roomID'];
        $link = linkToUBRS();
        $handle=$link->prepare("SELECT room.*, COUNT(roomreservation.RoomID) as currentOccupancy, AVG(rating.Rating) as averageRoomRating FROM `room` LEFT JOIN roomreservation ON roomreservation.RoomID=room.ID AND roomreservation.EndTime IS NULL LEFT JOIN rating ON rating.RoomID=room.ID WHERE room.ID=:roomID GROUP BY room.ID");
        $handle->bindParam(':roomID', $roomID, PDO::PARAM_STR);
        $handle->execute();
        $result=$handle->fetchAll(PDO::FETCH_ASSOC);
        $array = [];
        $array["roomDetails"] = $result;
        $handle=$link->prepare("SELECT * FROM `roomreservation` INNER JOIN `users` ON `users`.`UBId`=`roomreservation`.`UBId` WHERE `roomreservation`.`RoomID`=:roomID AND `roomreservation`.`EndTime` IS NULL");
        $handle->bindParam(':roomID', $roomID, PDO::PARAM_STR);
        $handle->execute();
        $result=$handle->fetchAll(PDO::FETCH_ASSOC);
        $array["reservations"] = $result;
        $handle=$link->prepare("SELECT * FROM `queries` INNER JOIN `users` ON `users`.`UBId`=`queries`.`UBId` WHERE `queries`.`RoomID`=:roomID");
        $handle->bindParam(':roomID', $roomID, PDO::PARAM_STR);
        $handle->execute();
        $result=$handle->fetchAll(PDO::FETCH_ASSOC);
        $array["queries"] = $result;
        return json_encode($array);
    }

    catch(Exception $e){
        echo $e;
    }
}
session_start();
if (!isset($_SESSION['username'])){
    return "fail";
}
echo getRoomData();
?>