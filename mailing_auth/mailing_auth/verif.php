<?php
$code_e=$_POST['code_e'];
$code=$_POST['code'];
$email=$_POST['email'];

if($code_e == $code){
    echo json_encode("Sucess");

}else{
    echo json_encode("Error");
}

// Retournez un message de succès
