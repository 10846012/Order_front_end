<?php


include "/Applications/AMPPS/www/databaseCRUD/conn.php";

$obj = json_decode(file_get_contents('php://input'), true);
// $obj = json_decode('{"login_id":"127.0.0.1","login_pw":"12345678"}',true);

$queryResult=$connect->query("SELECT `login`.`login_id`,`login`.`login_pw` FROM `login` WHERE 1");

$result=array();

while($fetchData=$queryResult->fetch_assoc()){
    $result[] = $fetchData;
}



if(isset($obj) == true){
    for($i = 0;$i<count($result);$i++){
        if($obj['login_id'] == $result[$i]['login_id']){
            if($obj['login_pw'] == $result[$i]['login_pw']){
                echo json_encode('Sign in suceesfully');
            }
        }
    }
}

?>