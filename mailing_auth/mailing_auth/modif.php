<?php
$email=$_POST['email'];

$mdp  = password_hash($_POST['password1'], PASSWORD_DEFAULT);;
// Définir les informations de connexion à la base de données
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "users";
// Créer une nouvelle connexion PDO
$pdo = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);

// Vérifier les erreurs de connexion
$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
     echo $mdp;
     echo $email;
// Enregistrez le nouveau compte dans la base de données
$stmt = $pdo->prepare('UPDATE users SET mdp = :mdp  WHERE email = :email');
$stmt->execute([':email' => $_POST['email'], ':mdp' => $mdp]);




// Retournez un message de succès
echo 'mdp bien changé';