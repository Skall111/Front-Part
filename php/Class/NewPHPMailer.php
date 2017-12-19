<?php

$PHPmail = new PHPMailer;

$PHPmail->isSMTP();                                                          // Set mailer to use SMTP
$PHPmail->Host = 'in-v3.mailjet.com';                                        // Specify main and backup SMTP servers
$PHPmail->SMTPAuth = true;                                                   // Enable SMTP authentication
$PHPmail->Username = '3f73d08edbecb38e5a3a666fdd75d4b1';                     // SMTP username
$PHPmail->Password = '468dc714994c9f2300af881bee9e329d';                     // SMTP password
$PHPmail->SMTPSecure = 'tls';                                                // Enable TLS encryption, `ssl` also accepted
$PHPmail->Port = 587;                                                        // TCP port to connect to
$PHPmail->Priority = "1";
?>