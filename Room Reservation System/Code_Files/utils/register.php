<?php
include 'dblinker.php';

function register(){
    try {
        $username = $_POST['usernamereg'];
        $password = $_POST['passwordreg'];
        $firstname = $_POST['fname'];
        $lastname = $_POST['lname'];
        $dob = $_POST['dob'];
        $gender = $_POST['gender'];
        $contact = $_POST['contact'];
        $departmentID = $_POST['dept'];
        $semester = $_POST['sem'];
        $locationID = $_POST['loc'];
        $securityQuestionID = $_POST['que'];
        $securityQuestionAnswer = $_POST['ans'];
        $link = linkToUBRS();
        $handle=$link->prepare("SELECT * FROM `users` WHERE `Username` =:username");
        $handle->bindParam(':username', $username, PDO::PARAM_STR);
        $handle->execute();
        if($handle->rowCount() == 1){
            echo "fail";
        }else{
            $handle=$link->prepare("INSERT INTO `users`(`Username`, `Password`, `FirstName`, `LastName`, `DOB`, `Gender`, `Contact`, `DepartmentID`, `Semester`, `OriginLocation`, `SecurityQuestion`, `SecurityQuestionAnswer`, `Role`, `RoomID`) VALUES (:username,:password,:firstname,:lastname,:dob,:gender,:contact,:departmentID,:semester,:locationID,:securityQuestionID,:securityQuestionAnswer,'student', NULL)");
            $handle->bindParam(':username', $username, PDO::PARAM_STR);
            $handle->bindParam(':password', $password, PDO::PARAM_STR);
            $handle->bindParam(':firstname', $firstname, PDO::PARAM_STR);
            $handle->bindParam(':lastname', $lastname, PDO::PARAM_STR);
            $handle->bindParam(':dob', $dob, PDO::PARAM_STR);
            $handle->bindParam(':gender', $gender, PDO::PARAM_STR);
            $handle->bindParam(':contact', $contact, PDO::PARAM_STR);
            $handle->bindParam(':departmentID', $departmentID, PDO::PARAM_STR);
            $handle->bindParam(':semester', $semester, PDO::PARAM_STR);
            $handle->bindParam(':locationID', $locationID, PDO::PARAM_STR);
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