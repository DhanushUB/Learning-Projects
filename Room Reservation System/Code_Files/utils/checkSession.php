<?php
session_start(); 
if (!isset($_SESSION['username'])){
    echo "fail";
}
else{
    echo "success";
}
?>