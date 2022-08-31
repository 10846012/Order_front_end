
<?php

include "/Applications/AMPPS/www/databaseCRUD/conn.php";

$queryResult=$connect->query("SELECT `order_item_value`, `order_item_size`, `order_item_adjust`, `order_item_price`, `order_item_count`,`order_list_id` FROM `order_items` WHERE 1");

$result=array();

while($fetchData=$queryResult->fetch_assoc()){
    $result[] = $fetchData;
}

echo json_encode($result);


?>