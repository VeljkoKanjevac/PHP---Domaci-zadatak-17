<?php

    if(!isset($_POST["email"]) || empty($_POST["email"]))
    {
        die("Email adresa nije prosledjena");
    }
    if(!isset($_POST["lozinka"]) || empty($_POST["lozinka"]))
    {
        die("Lozinka nije prosledjena");
    }

    require_once "baza.php";

    $email = mysqli_real_escape_string($baza, $_POST["email"]);
    $lozinka = mysqli_real_escape_string($baza, $_POST["lozinka"]);

    $rezultat = $baza -> query(" SELECT * FROM korisnici WHERE email = '$email' ");

    if(session_status() == PHP_SESSION_NONE)
    {
    session_start();
    }

    if($rezultat -> num_rows == 1)
    {
        $korisnik = $rezultat -> fetch_assoc();
        $lozinkaIzBaze = $korisnik["sifra"];
        
        $ispravnaLozinka = password_verify($lozinka, $lozinkaIzBaze);
        

        if($ispravnaLozinka)
        {
            
            $_SESSION["ulogovan"] = true;
            $_SESSION["id"] = $korisnik["id_korisnika"];
            $_SESSION["email"] = $korisnik["email"];
            $_SESSION["ime"] = $korisnik["ime"];
            $_SESSION["prezime"] = $korisnik["prezime"];

           header("Location: ../index.php");
        }
        else
        {
            $_SESSION["pogresnaLozinka"] = true;
            header("Location: ../login.php");
        }
    }
    else
    {   
        $_SESSION["nepostojeciEmail"] = true;
        header("Location: ../login.php");
    }