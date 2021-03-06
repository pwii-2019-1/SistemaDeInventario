<?php 
include('../../vendor/autoload.php');
require_once('../controller/EmprestimoController.php');
$data = date ("d-m-Y");

$tabelinha = "
<h1>Relátorio de Empréstimo</h1>
<p class='center'>Sistema de Inventário, $data</p>
<table border=2 id='tabela' name='tabela'
    class='table table-striped table-bordered table-hover table-overflow dataTable'>
    <thead>
        <tr>
            <!--Criar uma função para listar apenas esses campos ai--->
            <!--Usei os mesmos dados para filtrar a tabela--->
            <th>Código</th>
            <th>Funcionário</th>
            <th>Data</th>
            <th>Data Devolução</th>
            
           
        </tr>
    </thead>";
    foreach (listarEmprestimo() as $emprestimos){
    $tabelinha .="
    <tbody>
        <tr class='dif'>
            
            <td>$emprestimos->id_emprestimo</td>
            <td>$emprestimos->funcionario</td>
            <td>$emprestimos->data</td>
            <td>$emprestimos->data_devolucao</td>
           

        </tr>
    </tbody>";
     }
 $tabelinha .="
</table>";

$mpdf=new \Mpdf\Mpdf();
$mpdf->SetDisplayMode('fullpage');
$css = file_get_contents("../assets/css/estilo.css");
$mpdf->WriteHTML($css,1);
$mpdf->WriteHTML($tabelinha);
$mpdf->Output();

?>
