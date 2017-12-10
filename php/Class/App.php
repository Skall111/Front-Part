<?php
class App{

	static $db = null;

	static function getDatabase(){
		if(!self::$db){
			self::$db = new Database('root','root','Monument','localhost');
		}
		return self::$db;
	}

	static function getAuth(){
		return new Auth(Session::getInstance());
	}

}