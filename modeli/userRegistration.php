<?php

    if(!isset($_POST["ime"]) || empty($_POST["ime"]))
    {
        die("Ime nije prosledjeno");
    }
    if(!isset($_POST["prezime"]) || empty($_POST["prezime"]))
    {
        die("Prezime nije prosledjeno");
    }
    if(!isset($_POST["email"]) || empty($_POST["email"]))
    {
        die("Email adresa nije prosledjena");
    }
    if(!isset($_POST["lozinka"]) || empty($_POST["lozinka"]))
    {
        die("Lozinka nije prosledjena");
    }
    if(!isset($_POST["lozinkaPonovljeno"]) || empty($_POST["lozinkaPonovljeno"]))
    {
        die("Ponovni unos lozinke nije prosledjen");
    }

    require_once "baza.php";

    $ime = mysqli_real_escape_string($baza, $_POST["ime"]);
    $prezime = mysqli_real_escape_string($baza, $_POST["prezime"]);
    $email = mysqli_real_escape_string($baza, $_POST["email"]);
    $lozinka = mysqli_real_escape_string($baza, $_POST["lozinka"]);
    $lozinkaPonovljeno = mysqli_real_escape_string($baza, $_POST["lozinkaPonovljeno"]);

    $rezultat = $baza -> query(" SELECT * FROM korisnici WHERE email = '$email' ");

    if($rezultat -> num_rows > 0)
    {
        die("Nazalost korisnik sa ovom email adresom vec postoji.");
    }

    if($lozinka === $lozinkaPonovljeno)
    {
        $lozinka = password_hash($lozinka, PASSWORD_BCRYPT);

        $baza -> query(" INSERT INTO korisnici (ime, prezime, email, sifra) 
                                VALUES ('$ime', '$prezime', '$email', '$lozinka') ");

        echo"Korisnik je uspesno dodat u bazu podatka";
    }
    else
    {
        echo "Lozinke koje ste uneli se ne poklapaju. Vratite se i pokusajte opet";
    }