<?php

include "/Applications/AMPPS/www/databaseCRUD/conn.php";

$type_id = $_POST['type_id'];;
$type_id = !empty($type_id) ? "$type_id" : "1";


try{
    $queryResult=$connect->query("SELECT `tea_name`.`name_value`,`tea_name`.`type_id` FROM `tea_name` INNER JOIN `tea_type` ON `tea_type`.`type_id` = `tea_name`.`type_id`;");
}catch (Exception $e){
    echo "something went wrong";
}

$result=array();

while($fetchData=$queryResult->fetch_assoc()){
    $result[] = $fetchData;
}

echo json_encode($result);

?>