<?php
require_once '../vendor/autoload.php';
include '../config/variables.inc.php';
require 'autoload.php';


$loader = new Twig_Loader_Filesystem("../views/");
$twig = new Twig_Environment($loader, array(
    //  "cache" => "/path/to/compilation_cache",
));
$db = App::getDatabase();
include '../config/FormModal.php';
$userlog = $_SESSION['User'];
$errors = [];
$success = [];
$user = $db->query("SELECT * FROM User WHERE Id = $userlog")->fetch();
if(isset($_POST['type'])){
    $name  = $db->quote($_POST['name']);
    $surname = $db->quote($_POST['surname']);
    $mail = $db->quote($_POST['email']);
    if(!empty($_POST['currentPass']) && !empty($_POST['newPass']) && !empty($_POST['confirmPass'])){
        $currentPass = md5($_POST['currentPass']);
        $verif = $db->query("SELECT Name FROM User Where Password = '$currentPass'")->fetch();

        if($_POST['newPass'] != $_POST['confirmPass']) {
            $errors[] = 'Les mots de passe ne corresponde pas';
        }elseif(!$verif){
           $errors[] = 'Mot de passe incorrecte';
        }else{
            $newPass =md5($_POST['newPass']);
            if($db->query("UPDATE User Set Name = $name , Surname =$surname , Mail=$mail ,Password =  '$newPass' WHERE Id = '$userlog'" , ['1', '2'])){
                $success[] =  'Vos informations ont bien été mise a jour';
            }

        }



    }else{
        if($db->query("UPDATE User Set Name = $name , Surname =$surname , Mail=$mail WHERE Id = '$userlog'" , ['1', '2'])){
            $success[] =  'Vos informations ont bien été mise a jour';


        }
    }
}




$parametre =
    [
        'nom' => 'Benj',
        'prenom'=> 'Le Boss',
        'metier'=> 'Developpeur',
        'path'=> $path,
        'session'=>$_SESSION['User'],
        'user' => $user ,
        'errors' => $errors ,
        'success'=> $success

    ];
echo $twig->render("profile.html.twig", $parametre);
?>