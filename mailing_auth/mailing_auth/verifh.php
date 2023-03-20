<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>recup mdp</title>
</head>
<body>
<h1>mot de passe oublié</h1>
<form action="verif.php" method="post">
  <label >Code :</label>
    <input type="password" name="code" required><br>
    <input name="code_e" hidden="hidden" value="<?php echo $_GET['code'] ?>">
    <input name="email" hidden="hidden" value="<?php echo $_GET['email'] ?>">
    <input type="submit" value="envoyer">
</form>
<h3>Pas inscrit ?</h3>
<a href="index.html"><button>Sign up</button></a>
</body>
</html>