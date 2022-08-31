<?php

include "/Applications/AMPPS/www/databaseCRUD/conn.php";



$obj = json_decode(file_get_contents('php://input'), true);
// $obj = json_decode('[{"order_item_value":"台灣明月紅","order_item_size":"L","order_item_adjust":"無糖常溫"},{"order_item_value":"蟬吃金針綠茶","order_item_size":"L","order_item_adjust":"2分糖溫"}]',true);


    

// for($i = 0 ;$i<count($obj); $i++){
//     $total += $obj[$i]['order_price'];
// }

try{
    $queryResult=$connect->query("
    INSERT INTO order_list (`order_list_id`, `order_time`, `order_type`, `order_list_price`) 
    VALUES (NULL, CURRENT_TIMESTAMP, '現場', '0');");


    $queryResult=$connect->query("
    SELECT * FROM `order_list`");
    while($fetchData=$queryResult->fetch_assoc()){
        $result[] = $fetchData;
    }
    $queryResult=$connect->query("
    SELECT `tea_name`.`name_value`,`tea_size`.`price` 
    FROM `tea_name` INNER JOIN `tea_size` ON 
    `tea_name`.`name_id` = `tea_size`.`name_id`");
    while($fetchData=$queryResult->fetch_assoc()){
        $getPrice[] = $fetchData;
    }

    
    $total = 0;
    

    for($i =0;$i<count($obj);$i++){  
        for($j =0;$j<count($getPrice);$j++){
            if($getPrice[$j]['name_value'] == $obj[$i]['order_item_value']){
                $queryResult=$connect->query(
                    "INSERT INTO 
                    order_items(`order_item_id`, `order_item_value`, `order_item_size`, `order_item_adjust`,`order_item_count`,`order_item_price`, `order_list_id`) 
                    VALUES (NULL,
                    '".$obj[$i]['order_item_value']."',
                    '".$obj[$i]['order_item_size']."',
                    '".$obj[$i]['order_item_adjust']."',
                    '".$obj[$i]['order_item_count']."',
                    '".$getPrice[$j]['price']."',
                    '".$result[count($result)-1]['order_list_id']."')");
                    $total = $total + $obj[$i]['order_item_count']*$getPrice[$j]['price'];
            }
        }

    }

    $queryResult=$connect->query(
        "UPDATE `order_list` SET `order_list_price` = '".$total."' WHERE `order_list`.`order_list_id` = '".$result[count($result)-1]['order_list_id']."';"
    );
    
    
}catch (Exception $e){
    echo "something went wrong";
}

?>