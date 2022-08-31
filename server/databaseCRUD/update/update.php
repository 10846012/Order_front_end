<?php

include "/Applications/AMPPS/www/databaseCRUD/conn.php";

$order_id = $_POST['order_id'];
$order_value = $_POST['order_value'];
$order_size = $_POST['order_size'];
$order_adjust = $_POST['order_adjust'];
$order_price = $_POST['order_price'];

try{
    $queryResult=$connect->query(
        "UPDATE `tea_order_list` SET
        `order_value`='".$order_value."',
        `order_size`='".$order_size."',
        `order_adjust`='".$order_adjust."',
        `order_price`='".$order_price."'
        WHERE order_id = {$order_id}");
}catch (Exception $e){
    echo "something went wrong";
}

?>