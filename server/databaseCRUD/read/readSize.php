<?php

include "/Applications/AMPPS/www/databaseCRUD/conn.php";

$queryResult=$connect->query("SELECT `tea_name`.`name_value`, `size_value`, `price` FROM `tea_size` INNER JOIN `tea_name` ON `tea_name`.`name_id` = `tea_size`.`name_id`");

$result=array();

while($fetchData=$queryResult->fetch_assoc()){
    $result[] = $fetchData;
}

echo json_encode($result);

?>