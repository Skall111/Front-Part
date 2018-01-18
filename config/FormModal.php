<?php
if (isset($_POST['type'])) {
    if ($_POST['type'] == 1) {
        $name = $db->quote($_POST['firstname']);
        $surname = $db->quote($_POST['lastname']);
        $mail = $db->quote($_POST['youremail']);
        $pass = md5($_POST['password']);
        $db->query("INSERT INTO User(Name , Surname , Password , Mail) VALUES ($name , $surname , '$pass' , $mail )", ['1', '2']);
        $valid = 1;
    } elseif ($_POST['type'] == 2) {
        $mail = $db->quote($_POST['email']);
        $pass = md5($_POST['password']);
        $connect = $db->query("SELECT * FROM User WHERE Mail = $mail AND Password = '$pass' ")->fetch();
        if ($connect) {
            $_SESSION['User'] = $connect['Id'];
            $success[] = 'Connexion Reussi';
        } else {
            $errors[] = 'Connexion Echoué';
        }
    } elseif ($_POST['type'] == 3) {
        $mail = $db->quote($_POST['email']);
        $connect = $db->query("SELECT * FROM User WHERE Mail = $mail")->fetch();
        if ($connect) {
            $id = $connect['Id'];
            include 'Class/NewPHPMailer.php';
            $PHPmail->setFrom('contact@bendezign.ovh', 'PMH');
            $PHPmail->addAddress('contact@bendezign.ovh', 'Teboul Ben');
            $PHPmail->addAddress($_POST['email'], 'Contact');
            $user = new Auth();
            $newpass = $user->NewPass();
            $newpasscrypt = md5($newpass);
            $msg = 'Votre Nouveau Mot de passe est : ' . $newpass;
            $PHPmail->CharSet = 'UTF-8';
            $PHPmail->isHTML(true);
            $PHPmail->Subject = "Récuperation Email";
            $PHPmail->Body = $msg;
            if (!$PHPmail->send()) {
                echo 'Le message n\'a pas pu être envoyé.';
                echo 'Mailer Error: ' . $PHPmail->ErrorInfo;
                $error[] = 'Le message n\'a pas pu être envoyé.';
                $error[] = 'Mailer Error: ' . $PHPmail->ErrorInfo;
            } else {
                $error[] = 'Un nouveau mot de passe vous a été envoyer ';
                $db->query("UPDATE User Set Password = '$newpasscrypt' WHERE Id = $id ", ['1', '2']);
            }
        } else {
            $error[] = 'Aucun utilisateur n\'a été toruvé avec cette Email ';
        }
    }
}
?>