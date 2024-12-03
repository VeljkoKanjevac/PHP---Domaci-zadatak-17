<?php

    if(!isset($_POST["ime"]) || empty($_POST["ime"]))
    {
        die("Ime proizvoda nije prosledjeno.");
    }
    if(!isset($_POST["opis"]) || empty($_POST["opis"]))
    {
        die("opis proizvoda nije prosledjeno.");
    }
    if(!isset($_POST["cena"]) || empty($_POST["cena"]))
    {
        die("Cena proizvoda nije prosledjena.");
    }
    if(!isset($_POST["slika"]) || empty($_POST["slika"]))
    {
        die("Slika proizvoda nije prosledjena.");
    }
    if(!isset($_POST["kolicina"]) || empty($_POST["kolicina"]))
    {
        die("Kolicina proizvoda nije prosledjena.");
    }

    require_once "baza.php";

    $ime = mysqli_real_escape_string($baza, $_POST["ime"]);
    $opis = mysqli_real_escape_string($baza, $_POST["opis"]);
    $cena = mysqli_real_escape_string($baza, $_POST["cena"]);
    $slika = mysqli_real_escape_string($baza, $_POST["slika"]);
    $kolicina = mysqli_real_escape_string($baza, $_POST["kolicina"]);

    $baza -> query(" INSERT INTO proizvodi (ime, opis, cena, slika, kolicina) 
                            VALUES ('$ime', '$opis', $cena, '$slika', $kolicina) ");

    echo "Uspesno ste kreirali novi proizvod."

?>
