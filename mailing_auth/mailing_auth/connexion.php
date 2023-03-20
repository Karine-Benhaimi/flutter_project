<?php

// Générez un QR code unique
$qr_code = uniqid();
$email_recup=$_POST['email'];
$mdp_recup=$_POST['mdp'];
// Définir les informations de connexion à la base de données
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "users";
// Créer une nouvelle connexion PDO
$pdo = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);

// Vérifier les erreurs de connexion
$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

$req = $pdo->prepare("SELECT * FROM users WHERE email = :email");
$req->bindParam(':email', $email_recup);
$req->execute();

$resultat = $req->fetch(PDO::FETCH_ASSOC);
$mot_de_passe_bd = $resultat['mdp'];
//echo $mot_de_passe_bd;
//echo $mdp_recup;
if(is_null($resultat)){
    echo'inexistant';
}else{
if (password_verify($mdp_recup, $mot_de_passe_bd)) {
   echo json_encode("Sucess");
}
else {
    echo 'incorrect password';
}}