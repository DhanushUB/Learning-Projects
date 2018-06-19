<?php
include 'dblinker.php';

function getRoomData(){
    try {
        $link = linkToUBRS();
        $handle=$link->prepare("SELECT `queries`.*,`users`.`FirstName`,`users`.`LastName`,`users`.`Contact` FROM `queries` INNER JOIN `users` ON `users`.`UBId`=`queries`.`UBId`");
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