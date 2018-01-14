<?php 
@session_start();
if(isset($_SESSION['product']))
{
	unset($_SESSION['product']);
}
if(isset($_SESSION['customer']))
{
	unset($_SESSION['customer']);
	header('Location: ../index.php');
}
if(isset($_SESSION['account']))
{
	unset($_SESSION['account']);
	header('Location: ../admin/pages/login');
}

?>