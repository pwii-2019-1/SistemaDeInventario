<?php 

	class Item{

		private $idSetor;
		private $matricula;
		private $modelo;
		private $quantidade;
		private $localizacao;
		private $dataAquisicao;
		private $valorAquisicao;
		private $vidaUtil;
		private $descricaoEstado;
		private $status;

	    public function __get($atributo) {
	        return $this->$atributo;
	    }

	    public function __set($atributo, $valor) {
	        $this->$atributo = $valor;
	    }

	}

 ?>