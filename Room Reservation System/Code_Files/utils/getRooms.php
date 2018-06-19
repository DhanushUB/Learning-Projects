<?php
include 'dblinker.php';

function getRoomData(){
    try {
        $link = linkToUBRS();
        $handle=$link->prepare("SELECT room.*, COUNT(DISTINCT `roomreservation`.ReservationID) as currentOccupancy, AVG(rating.Rating) as averageRoomRating FROM `room` LEFT JOIN roomreservation ON roomreservation.RoomID=room.ID AND roomreservation.EndTime IS NULL LEFT JOIN rating ON rating.RoomID=room.ID GROUP BY room.ID");
        $handle->execute();
        $result=$handle->fetchAll(PDO::FETCH_ASSOC);
        return json_encode($result);
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