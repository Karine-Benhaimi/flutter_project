<!DOCTYPE html>
<html>
<head>
    <title>Registration Form</title>
    <script>
        function validateForm() {
            var password1 = document.getElementById("password1").value;
            var password2 = document.getElementById("password2").value;

            if (password1 !== password2) {
                alert("Passwords do not match!");
                return false;
            }
        }
    </script>
</head>
<body>
<h1>modifier mot de passe</h1>
<form action="modif.php" onsubmit="return validateForm()" method="post">

    <label for="password1">Password:</label>
    <input type="password" name="password1" id="password1">

    <label for="password2">Confirm Password:</label>
    <input type="password" name="password2" id="password2">
    <input hidden="hidden" name="email" value="<?php echo $_GET['email'] ?>">

    <input type="submit" value="Register">
</form>
</body>
</html>