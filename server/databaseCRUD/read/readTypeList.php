<?php

include "/Applications/AMPPS/www/databaseCRUD/conn.php";

$queryResult=$connect->query("SELECT * FROM `tea_type`
");

$result=array();

while($fetchData=$queryResult->fetch_assoc()){
    $result[] = $fetchData;
}

echo json_encode($result);

?>