<?php

include "/Applications/AMPPS/www/databaseCRUD/conn.php";

$order_id = $_POST['order_id'];
try{
    $queryResult=$connect->query("DELETE FROM `tea_order_list` WHERE `order_id` = {$order_id}");
}catch (Exception $e){
    echo "something went wrong";
}

?>