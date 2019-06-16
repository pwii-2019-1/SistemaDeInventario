<?php
class DB {
	private static $instance;
	static function getInstance(){
		if(!isset(self::$instance))	{
			try{

				self::$instance = new PDO("mysql:host=127.0.0.1;dbname=sistema_inventario", 'root', "1");
				self::$instance->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
				self::$instance->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_OBJ);
			} catch (PDOException $e){
				echo $e->getMessage();
			}
		}
		return self::$instance;
	}
	public static function prepare($sql) {
		return self::getinstance()->prepare($sql);
	}

	static function verificaSessao(){
		if ((!isset($_SESSION['dados_usuario']))) {
			header('Location: ../view/login.php');
		}
	}
}

?>