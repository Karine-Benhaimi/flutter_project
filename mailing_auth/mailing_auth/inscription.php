<?php

// Générez un QR code unique
$qr_code = uniqid();
$mdp  = password_hash($_POST['mdp'], PASSWORD_DEFAULT);;
// Définir les informations de connexion à la base de données
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "users";
// Créer une nouvelle connexion PDO
$pdo = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);

// Vérifier les erreurs de connexion
$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

// Enregistrez le nouveau compte dans la base de données
$stmt = $pdo->prepare('INSERT INTO users (email, mdp) VALUES (:email, :mdp)');
$stmt->execute(['email' => $_POST['email'], 'mdp' => $mdp]);


// Envoyez un email au nouvel utilisateur avec son QR code

$file = 'clients.json';
$data = file_exists($file) ? json_decode(file_get_contents($file), true) : array();

$user = array(
    'email' => $_POST['email'],
    'password' => $mdp
);

array_push($data, $user);

file_put_contents($file, json_encode($data));

$to = $_POST['email'];
$subject = 'Votre compte a bien été crée';
$message = 'Bonjour, voici votre email et mot de passe : '."\r\n".
           'email : '.$_POST['email']. "\r\n" .
           'mot de passe : '.$_POST['mdp']. "\r\n";
$headers = 'From: authentification.mail.web@gmail.com' . "\r\n" .
    'Reply-To: authentification.mail.web@gmail.com' . "\r\n" .
    'X-Mailer: PHP/' . phpversion();

 mail($to, $subject, $message, $headers);

// Retournez un message de succès
 echo 'Compte créé avec succès. Veuillez vérifier votre email pour votre QR code de connexion.';
 echo json_encode("Compte créé avec succès. Veuillez vérifier votre email pour votre QR code de connexion.");
header('Location: connexion.html');
exit;