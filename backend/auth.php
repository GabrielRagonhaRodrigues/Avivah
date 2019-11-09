<?php

include_once 'conexao.php';

$user = $_POST['user'];
$pass = $_POST['password'];

$query = "SELECT * FROM funcionarios WHERE username='" . $_POST["user"] . "' and password = '". $_POST["password"]."'";

if(!$query){
    
    $query = "SELECT * FROM fornecedores WHERE username='" . $_POST["user"] . "' and password = '". $_POST["password"]."'"; 
    
    if(!$query == false){
        
        $query = "SELECT * FROM users WHERE username='" . $_POST["user"] . "' and password = '". $_POST["password"]."'";
        }
    }
    
$result = mysqli_query($conexao, $query);
$data = (mysqli_fetch_row ($result));

if($data != null) 
{
    print_r("<h1><strong>ACESSO PERMITIDO!</strong></h1>");
} else 
{
    print_r("<h1><strong>ACESSO NEGADO!</strong></h1>");
}
?>
