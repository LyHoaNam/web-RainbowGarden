<?php
@session_start();
include "../../php/connectDB.php";



if (isset($_POST["btn_submit"])) {

	$namepd = $_POST["name"];
	$pricepd= $_POST["price"];
	$saleoffpr= $_POST["saleoff"];
	$imgulrpr= $_POST["imagiUrl"];
	$categorypr= $_POST["category"];
	$short_descripsionppr=$_POST["short_descripsion"];
	$inStockpr=$_POST["inStock"];
	$isAvailablepr=$_POST["isAvailable"];
	$db=new DataAccessHelper;
	$db->connect();
	$sql="INSERT INTO `product`( `name`, `saleoff`, `category`, `imagiUrl`,`short_descripsion`, `inStock`, `isAvailable`)
	VALUES ('$namepd',$saleoffpr,$categorypr,'$imgulrpr',$short_descripsionppr,$inStockpr,$isAvailablepr)";

	if($db->executeNonQuery($sql))
	{
		$lastid=$db->lastIdInsert();
		$sql="INSERT INTO `pricelist`( `productID`, `price`, `startdate`, `enddate`) VALUES ($lastid,$price,now(),'2018-10-10');";
		$db->executeNonQuery($sql);
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