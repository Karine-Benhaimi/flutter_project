<?php

// Générez un QR code unique
$qr_code = uniqid();
$email_recup=$_POST['email'];
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

$caracteres = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';

// Génère un code aléatoire de 8 caractères
$longueur_code = 4;
$code = '';
for ($i = 0; $i < $longueur_code; $i++) {
    $code .= $caracteres[rand(0, strlen($caracteres) - 1)];
}

// Affiche le code généré
echo json_encode($code);


$resultat = $req->fetch(PDO::FETCH_ASSOC);
$mot_de_passe_bd = $resultat['mdp'];
//echo $mot_de_passe_bd;
//echo $mdp_recup;
// Envoyez un email au nouvel utilisateur avec son QR code
$to = $_POST['email'];
$subject = 'Récuperation mot de passe';
$message = 'Bonjour, voici votre code pour le mail : '.$email_recup."\r\n".
    'code : '.$code. "\r\n" .

$headers = 'From: authentification.mail.web@gmail.com' . "\r\n" .
    'Reply-To: authentification.mail.web@gmail.com' . "\r\n" .
    'X-Mailer: PHP/' . phpversion();

mail($to, $subject, $message, $headers);


// Retournez un message de succès
header("Location: verifh.php?code=".$code."&email=".$email_recup);
exit;