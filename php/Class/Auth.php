<?php
class Auth{

    private $session;

    public function __construct($session = FALSE ){
        $this->session = $session;
    }

    public function NewPass($length = 8) {
        $str = '123456789';
        for ($i = 0, $passwd = ''; $i < $length; $i++)
            $passwd .= substr($str, mt_rand(0, strlen($str) - 1), 1);
        return $passwd;
    }

}