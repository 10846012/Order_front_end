<?php

$connect = new mysqli('127.0.0.1','root','mysql','order_data');


if($connect){
    
}else{
    echo '連接失敗';
    exit();
}

?>