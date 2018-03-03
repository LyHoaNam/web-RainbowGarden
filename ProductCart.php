<?php
@session_start();

$data = json_decode(stripslashes($_REQUEST['p']));
$count=0;
//$i=0; $j=0;
/*
while($i<count($data))
{

	$_SESSION['product'][$j]['id']=$data[$i];
	$_SESSION['product'][$j]['name']=$data[$i++];
	$_SESSION['product'][$j]['summary']=$data[$i++];
	$_SESSION['product'][$j]['price']=$data[$i++];
	$_SESSION['product'][$i]['quantity']=$data[$i++];
	$_SESSION['product'][$i]['image']=$data[$i++];
	
	$i++;

}*/
$_SESSION['product']=$data;


?>