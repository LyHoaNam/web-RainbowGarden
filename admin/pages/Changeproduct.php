<?php
@session_start();
include "../../php/connectDB.php";



if (isset($_POST["btn_submit"])) {

	$namepd = $_POST["name"];
	$pricepd= $_POST["price"];
	$saleoffpr= $_POST["saleoff"];
	$imgulrpr= $_POST["imagiUrl"];
	$categorypr= $_POST["category"];
	
	$db=new DataAccessHelper;
	$db->connect();
	$sql="INSERT INTO `product`( `name`, `saleoff`, `category`, `price`, `imagiUrl`) VALUES ('$namepd',$saleoffpr,$categorypr,$pricepd,'$imgulrpr')";

	if($db->executeNonQuery($sql))
	{
		$_SESSION["sussect"] = "thêm thành công";
	}
	else
		$_SESSION["error"]="Có lỗi trong quá trình thêm!";


	header("Location: viewproduct.php");
}
if(isset($_POST["btn_submitDel"]))
{
	$idPrDel=$_POST["idDel"];
	$sql= "DELETE FROM `product` WHERE id= $idPrDel";
	$db=new DataAccessHelper;
	$db->connect();
	if($db->executeNonQuery($sql))
	{
		$_SESSION["DelSS"] = "Xóa thành công";
	}
	else
		$_SESSION["DelErr"] = "Có lỗi trong quá trình xóa";

	header("Location: viewproduct.php");
}

?>