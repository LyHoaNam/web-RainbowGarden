<?php 
include "../../php/connectDB.php";
$db=new DataAccessHelper;
$db->connect();

$query1 =$db->executeQuery ("SELECT sum(p2.tprice) tday, DAY( p1.createdate) FROM cart p1 JOIN (SELECT d.id_cart, sum( d.quantity * p.price) tprice FROM cart_detail d JOIN product p ON d.id_product = p.id WHERE p.category= {$category} GROUP BY d.id_cart) p2 ON p1.id =p2.id_cart WHERE p1.createdate=CURDATE() GROUP BY p1.createdate ");
if($query1->num_rows>0)
{
	$row1=mysqli_fetch_assoc($query1);
	$totalDay =$row1["tday"] ;
}
$query2 =$db->executeQuery ("SELECT sum(p2.tprice) tmonth,MONTH( p1.createdate) FROM cart p1 JOIN (SELECT d.id_cart, sum( d.quantity * p.price) tprice FROM cart_detail d JOIN product p ON d.id_product = p.id WHERE p.category= {$category} GROUP BY d.id_cart) p2 ON p1.id =p2.id_cart WHERE MONTH(p1.createdate)=MONTH(CURDATE()) AND YEAR(p1.createdate)=YEAR(CURDATE()) GROUP BY MONTH(p1.createdate )");
if($query2->num_rows>0)
{
	$row2=mysqli_fetch_assoc($query2);
	$totalMonth =$row2["tmonth"] ;
}		
$query3 =$db->executeQuery ("SELECT sum(p2.tprice) tyear,YEAR( p1.createdate) FROM cart p1 JOIN (SELECT d.id_cart, sum( d.quantity * p.price) tprice FROM cart_detail d JOIN product p ON d.id_product = p.id WHERE p.category= {$category} GROUP BY d.id_cart) p2 ON p1.id =p2.id_cart WHERE YEAR(p1.createdate)=YEAR(CURDATE()) GROUP BY YEAR(p1.createdate )");
if($query3->num_rows>0)
{
	$row3=mysqli_fetch_assoc($query3);
	$totalYear =$row3["tyear"] ;
}		
?>