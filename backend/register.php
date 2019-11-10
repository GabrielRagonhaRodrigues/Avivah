<?php

include_once 'conexao.php';

$name = $_POST['name'];
$gender = $_POST['sexo'];
$birthdate = $_POST['nascimento'];
$cep = $_POST['cep'];
$state = $_POST['state'];
$city = $_POST['city'];
$district = $_POST['district'];
$street = $_POST['street'];
$number = $_POST['number'];
$complement = $_POST['complement'];

$tel1 = $_POST['tel1'];
$tel2 = $_POST['tel2'];
$cel1 = $_POST['cel1'];
$cel2 = $_POST['cel2'];

$email2 = $_POST['email2'];

$pass = $_POST['password'];


$user = $_POST['user'];
$cpf = $_POST['cpf'];
$email = $_POST['email1'];

//Cria a condição de pesquisa
$query = "SELECT * 
FROM funcionarios 
WHERE username='" . $_POST["user"] . "'";

//Resultado da condição e casos
$result = mysqli_query($conexao, $query);

//Retorna número de linhas
$num_rows = mysqli_num_rows($result);

//Condições com o retorno de linhas
if($num_rows == 0) {
    $query = "SELECT * 
    FROM fornecedores 
    WHERE username='" . $_POST["user"] . "'";     
    
    $result = mysqli_query($conexao, $query);
    $num_rows = mysqli_num_rows($result);
    
    if($num_rows == 0) {
        $query = "SELECT * 
        FROM users 
        WHERE username='" . $_POST["user"] . "'";
        
        $result = mysqli_query($conexao, $query);
        $num_rows = mysqli_num_rows($result);
        }
    }




//Cria a condição de pesquisa
$query = "SELECT * 
FROM funcionarios 
WHERE cpfFuncionario='" . $_POST["cpf"] . "'";

//Resultado da condição e casos
$result = mysqli_query($conexao, $query);

//Retorna número de linhas
$num_rows = mysqli_num_rows($result);

//Condições com o retorno de linhas
if($num_rows == 0) {
    $query = "SELECT * 
    FROM users 
    WHERE cpfUser='" . $_POST["cpf"] . "'";

    $result = mysqli_query($conexao, $query);
    $num_rows = mysqli_num_rows($result);
    }





//Cria a condição de pesquisa
$query = "SELECT * 
FROM funcionarios 
WHERE emailFuncionario='" . $_POST["email1"] . "'";

//Resultado da condição e casos
$result = mysqli_query($conexao, $query);

//Retorna número de linhas
$num_rows = mysqli_num_rows($result);

//Condições com o retorno de linhas
if($num_rows == 0) {
    $query = "SELECT * 
    FROM users 
    WHERE emailUser='" . $_POST["email1"] . "'";
    
    $result = mysqli_query($conexao, $query);
    $num_rows = mysqli_num_rows($result);
}

$query = "INSERT INTO users 
(nomeUser, sexoUser, dataNascUser, cepUser, estadoUser, cidadeUser, bairroUser, ruaUser, numeroCasaUser, complementoUser ,cpfUser ,telefoneUser ,telefone2User ,celularUser ,celular2User ,
emailUser ,email2User ,username ,password, idAcesso)
VALUES ('$name', '$gender', '$birthdate', '$cep', '$state', '$city', '$district', '$street','$number', '$complement', '$cpf', 
'$tel1', '$tel2', '$cel1', '$cel2', '$email', '$email2', '$user', '$pass', 15)";

//Mysqli query faz a query no banco
mysqli_query ($conexao, $query);

header ('location: ../frontend/index.html');

?>
