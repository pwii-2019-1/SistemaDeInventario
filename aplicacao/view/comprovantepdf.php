<?php 
    include('../../vendor/autoload.php');
    require_once('../controller/FuncionarioController.php');

    $data = date ("d-m-Y");
    foreach (listaFuncionarios() as $funcionarios){
        $funcionarios->nome;
    }
    $html = "
    <fieldset>
        <h1>Comprovante de Devolução</h1>
        <p class='center sub-titulo'>
            <strong>Sistema de Invetário</strong>   
        </p>
        <p>Recebemos de <strong>  $funcionarios->nome</strong></p>
        <p>o(s) item:  <strong>Nome do Item</strong></p>
        <p>Correspondente ao setor de <strong>nome do setor..<strong></p>
        <p>e para clareza firmo(amos) que foi entregue de acordo com as regras da empresa.</p>
        <p class='direita'>Sistema de Inventário, $data</p>
        <p> ......................................................................................................................................</p>
        <p class='center'>
            <strong>Assinatura do Coordenador</strong>   
        </p>
        <p>......................................................................................................................................</p>
        <p class='center'>
       
        <strong>Assinatura do Funcionário</strong>   
    </p>
    </fieldset>";
 
	$mpdf=new \Mpdf\Mpdf();
	$mpdf->SetDisplayMode('fullpage');
	$css = file_get_contents("../assets/css/estilo.css");
	$mpdf->WriteHTML($css,1);
	$mpdf->WriteHTML($html);
	$mpdf->Output();
 
	exit;