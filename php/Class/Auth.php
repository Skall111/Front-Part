<?php
class Auth{

    private $session;

    public function __construct($session = FALSE ){
        $this->session = $session;
    }

    public function connect($user){
        $this->session->write('userlog', $user);
    }

    public function login($db, $username, $password){
        $user = $db->query('SELECT * FROM conges_users WHERE (username = :username OR email = :username) AND confirmed_at IS NOT NULL', ['username' => $username])->fetch();
        if(password_verify($password, $user->password)){
            $this->connect($user);
            return $user;
        }else{
            return false;
        }
    }

    public function restrict(){
        if(!$this->session->read('userlog')){
            // $this->session->setFlash('danger', "Vous n'avez pas le droit d'accéder à cette page");
            header('Location: Connexion'); 
            exit();
        }
    }
    public function NewPass($length = 8) {
        $str = '123456789';
        for ($i = 0, $passwd = ''; $i < $length; $i++)
            $passwd .= substr($str, mt_rand(0, strlen($str) - 1), 1);
        return $passwd;
    }

    public function connectFromCookie($db)
    {
        if(isset($_COOKIE['remember']) ) 
        {
            $remember_token = $_COOKIE['remember'];
            $parts = explode('01010101010', $remember_token); 
            $user_id = $parts[0];
            $user = $db->query('SELECT * FROM conges_user WHERE Id = ?', [$user_id])->fetch();
 
            if($user)
            {
                // $expected = $user_id . '01010101010' . $user->Token_Key . sha1($user_id . 'Youcoulerler');
                $expected =$user->Token_Key;

                if($expected == $remember_token)
                {
                    // $this->connect($user->Login);
                    // session_start();
                    $_SESSION['userlog'] = $user->Login;
                    setcookie('remember', $remember_token, time() + 60 * 60 * 24 * 7 , '/');
                }
 
                else
                {
                    setcookie('remember', NULL, -1);
                }
            }
 
            else
            {
                setcookie('remember', NULL, -1);
            }
        }
    }
}