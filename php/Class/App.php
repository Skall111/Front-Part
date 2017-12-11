<?php
class App{

	static $db = null;

	static function getDatabase(){
		if(!self::$db){
			self::$db = new Database('root','','Monument','127.0.0.1');
		}
		return self::$db;
	}

	static function getAuth(){
		return new Auth(Session::getInstance());
	}

}