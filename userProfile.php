<?php


    if(session_status() == PHP_SESSION_NONE)
    {
        session_start();
    }

    $id = $_SESSION["id"];
    $ime = $_SESSION["ime"];
    $prezime = $_SESSION["prezime"];
    $email = $_SESSION["email"];

?>
    

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <?php require_once "index.php"  ?>

    <div>
        <h1> ID: <?= $id ?> </h1>
        <h2> Ime: <?= $ime ?> </h2>
        <h2> Prezime: <?= $prezime ?> </h2>
        <h3> Email: <?= $email ?> </h3>
    </div>

</body>
</html>