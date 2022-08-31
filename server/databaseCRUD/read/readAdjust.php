<?php

include "/Applications/AMPPS/www/databaseCRUD/conn.php";

$queryResult=$connect->query("SELECT DISTINCT * FROM tea_adjust");

$result=array();

while($fetchData=$queryResult->fetch_assoc()){
    $result[] = $fetchData;
}

echo json_encode($result);

?>