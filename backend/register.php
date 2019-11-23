<?php

include_once 'conexao.php';

$name = $_POST['name'];
$gender = $_POST['sexo'];
$birthdate = $_POST['nascimento'];
$cep = $_POST['cep'];

//Dando REPLACE na MASK para o INSERT
    $cep = str_replace("-","",$cep);

$state = $_POST['state'];
$city = $_POST['city'];
$district = $_POST['district'];
$street = $_POST['street'];
$number = $_POST['number'];
$complement = $_POST['complement'];

$tel1 = $_POST['tel1'];
$tel2 = $_POST['tel2'];

//Dando REPLACE na MASK para o INSERT
    $tel1 = str_replace("(","",$tel1);
    $tel1 = str_replace(")","",$tel1);
    $tel1 = str_replace(" ","",$tel1);
    $tel1 = str_replace("-","",$tel1);

//Dando REPLACE na MASK para o INSERT
    $tel2 = str_replace("(","",$tel2);
    $tel2 = str_replace(")","",$tel2);
    $tel2 = str_replace(" ","",$tel2);
    $tel2 = str_replace("-","",$tel2);

$cel1 = $_POST['cel1'];
$cel2 = $_POST['cel2'];

//Dando REPLACE na MASK para o INSERT
    $cel1 = str_replace("(","",$cel1);
    $cel1 = str_replace(")","",$cel1);
    $cel1 = str_replace(" ","",$cel1);
    $cel1 = str_replace("-","",$cel1);

//Dando REPLACE na MASK para o INSERT
    $cel2 = str_replace("(","",$cel2);
    $cel2 = str_replace(")","",$cel2);
    $cel2 = str_replace(" ","",$cel2);
    $cel2 = str_replace("-","",$cel2);


$email2 = $_POST['email2'];
$pass = $_POST['password'];


$user = $_POST['user'];
$cpf = $_POST['cpf'];

//Dando REPLACE na MASK para o INSERT
    $cpf = str_replace(".","",$cpf);
    $cpf = str_replace("-","",$cpf);

$email = $_POST['email1'];

//Cria a condição de pesquisa
$query = "SELECT * 
FROM employies
WHERE username='" . $_POST["user"] . "'";

//Resultado da condição e casos
$result = mysqli_query($conexao, $query);

//Retorna número de linhas
$num_rows = mysqli_num_rows($result);

//Condições com o retorno de linhas
if($num_rows == 0) {
    $query = "SELECT * 
    FROM providers 
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
FROM employies
WHERE cpfEmployee='" . $_POST["cpf"] . "'";

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
FROM employies 
WHERE emailEmployee='" . $_POST["email1"] . "'";

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
(nameUser, sexUser, dateBornUser, cepUser, stateUser, cityUser, neighborhoodUser, streetUser, numberHouseUser, adjunctUser ,cpfUser ,telephoneUser ,telephone2User ,cellphoneUser ,cellphone2User ,
emailUser ,email2User ,username ,password, idAccess)
VALUES ('$name', '$gender', '$birthdate', '$cep', '$state', '$city', '$district', '$street','$number', '$complement', '$cpf', 
'$tel1', '$tel2', '$cel1', '$cel2', '$email', '$email2', '$user', '$pass', 2)";

//Mysqli query faz a query no banco
mysqli_query ($conexao, $query);
if(!mysqli_query ($conexao, $query)){
    echo mysqli_errno($conexao) . ": " . mysqli_error($conexao) . "\n";
}
header ('location: ../frontend/index.html');

?>
