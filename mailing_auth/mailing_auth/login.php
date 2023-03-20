<?php
 $db = mysqli_connect('localhost','root','','users');
 $email= $_POST['email'];
 $mdp = $_POST['mdp'];
 $sql = "SELECT * FROM users WHERE email = '".$email."' AND mdp = '".$mdp."'";
 $result = mysqli_query($db,$sql);
 $count = mysqli_num_rows($result);
 if($count == 1){
 	echo json_encode("Sucess");
 } 
 else{
 	echo json_encode("Error");
 }
?>