<?php
@session_start();
include "php/connectDB.php";
$db=new DataAccessHelper;
$db->connect();

$data = json_decode(stripslashes($_REQUEST['p']));
$count=0;
$i=0; $j=0;

foreach($data as $d){
   if($count %2==0)
   {
     $idCus[$i]=$d;
     $i++;
     
   }
   if($count %2!=0)
   {
      $Quanti[$j]=$d;
      $j++;
      
   }
   $count++;
}

$customid=null;
if(isset($_SESSION['customer']))
{
	$customid=$_SESSON['customer'];
}
if(isset($_SESSION['account']))
{
	$customid=$_SESSION['account'];
	
}

if($customid != null)
{
	
	$sqlC="INSERT INTO `cart`( `createdate`, `custom_id`, `fullname`) VALUES (now(),'$customid','Cart_$customid')";
	
	if($db->executeNonQuery($sqlC))
	{
		
		$lastid=$db->lastIdInsert();
		$ij=0; $check=0;
		foreach ($idCus as $Detail) {
			$sqlD="INSERT INTO `cart_detail`(`id_cart`, `id_product`, `quantity`) VALUES ('$lastid','$Detail','$Quanti[$ij]')";
			$ij++;
			if($db->executeNonQuery($sqlD))
				{$check++;}
		}
		if($check==$ij)
			echo "thành công";
		else
			echo "Thất bại";
	}
}
else
	echo "f";
?>