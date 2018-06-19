<?php
include 'dblinker.php';
session_start();
function register(){
    try {
        $username = $_POST['updateusername'];
        if ($_SESSION['username'] != $username){
            return "fail";
        }
        $firstname = $_POST['updatefname'];
        $lastname = $_POST['updatelname'];
        $dob = $_POST['updatedob'];
        $gender = $_POST['updategender'];
        $contact = $_POST['updatecontact'];
        $departmentID = $_POST['updatedept'];
        $semester = $_POST['updatesem'];
        $locationID = $_POST['updateloc'];
        $link = linkToUBRS();
        $handle=$link->prepare("SELECT * FROM `users` WHERE `Username` =:username");
        $handle->bindParam(':username', $username, PDO::PARAM_STR);
        $handle->execute();
        if($handle->rowCount() != 1){
            echo "fail";
        }else{
            $handle=$link->prepare("UPDATE `users` SET `FirstName`=:firstname,`LastName`=:lastname,`DOB`=:dob,`Gender`=:gender,`Contact`=:contact,`DepartmentID`=:departmentID,`Semester`=:semester,`OriginLocation`=:locationID WHERE `username`=:username");
            $handle->bindParam(':username', $username, PDO::PARAM_STR);
            $handle->bindParam(':firstname', $firstname, PDO::PARAM_STR);
            $handle->bindParam(':lastname', $lastname, PDO::PARAM_STR);
            $handle->bindParam(':dob', $dob, PDO::PARAM_STR);
            $handle->bindParam(':gender', $gender, PDO::PARAM_STR);
            $handle->bindParam(':contact', $contact, PDO::PARAM_STR);
            $handle->bindParam(':departmentID', $departmentID, PDO::PARAM_STR);
            $handle->bindParam(':semester', $semester, PDO::PARAM_STR);
            $handle->bindParam(':locationID', $locationID, PDO::PARAM_STR);
            $handle->execute();
            echo "success";
        }
    }

    catch(Exception $e){
        echo $e;
    }
}
if (!isset($_SESSION['username'])){
    return "fail";
}
echo register();
?>