<?php
include 'dblinker.php';

function getMetaData(){
    try {
        $link = linkToUBRS();
        $handle=$link->prepare("SELECT * FROM `location`");
        $handle->execute();
        $result=$handle->fetchAll(PDO::FETCH_ASSOC);
        $array = [];
        $array["locations"] = $result;
        $handle=$link->prepare("SELECT * FROM `department`");
        $handle->execute();
        $result=$handle->fetchAll(PDO::FETCH_ASSOC);
        $array["departments"] = $result;
        $handle=$link->prepare("SELECT * FROM `securityquestion`");
        $handle->execute();
        $result=$handle->fetchAll(PDO::FETCH_ASSOC);
        $array["securityquestions"] = $result;
        return json_encode($array);
    }

    catch(Exception $e){
        echo $e;
    }
}
session_start();
echo getMetaData();
?>