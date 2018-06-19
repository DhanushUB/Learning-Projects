<?php
include 'dblinker.php';

function register(){
    try {
        $username = $_SESSION["username"];
        $roomID = $_POST["roomID"];
        $occupancy = $_POST["occupancy"];
        $floorNumber = $_POST["floorNumber"];
        $link = linkToUBRS();

        $handle=$link->prepare("SELECT * FROM `room` WHERE `ID` =:roomID");
        $handle->bindParam(':roomID', $roomID, PDO::PARAM_STR);
        $handle->execute();
        if($handle->rowCount() > 0){
            echo "Room Number Already Exists";
        }else{
            $handle=$link->prepare("SELECT * FROM `users` WHERE `Username` =:username");
            $handle->bindParam(':username', $username, PDO::PARAM_STR);
            $handle->execute();
            $result=$handle->fetch(PDO::FETCH_ASSOC);
            if($result['Role'] != "Admin"){
                echo "Unauthorized User";
            }
            $handle=$link->prepare("INSERT INTO `room`(`ID`, `Occupancy`, `FloorNumber`) VALUES (:roomID, :occupancy, :floorNumber)");
            $handle->bindParam(':roomID', $roomID, PDO::PARAM_STR);
            $handle->bindParam(':occupancy', $occupancy, PDO::PARAM_STR);
            $handle->bindParam(':floorNumber', $floorNumber, PDO::PARAM_STR);
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