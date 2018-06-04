<?php 
include "../../php/connectDB.php";
$db=new DataAccessHelper;
$db->connect();

$query1 =$db->executeQuery ("SELECT totalAmounts(CURRENT_DATE, CURRENT_DATE, {$category}) as totalAmounts ");
if($query1->num_rows>0)
{
	$row1=mysqli_fetch_assoc($query1);
	$totalDay =$row1["totalAmounts"] ;
}
$query2 =$db->executeQuery ("SELECT totalAmounts(concat(YEAR(now()),'-',month(now()),'-1'), LAST_DAY(now()),{$category}) as totalAmounts");
if($query2->num_rows>0)
{
	$row2=mysqli_fetch_assoc($query2);
	$totalMonth =$row2["totalAmounts"] ;
}		
$query3 =$db->executeQuery ("SELECT totalAmounts(concat(YEAR(now()),'-1','-1'),concat(year(now()),'-12-31') ,{$category}) as totalAmounts");
if($query3->num_rows>0)
{
	$row3=mysqli_fetch_assoc($query3);
	$totalYear =$row3["totalAmounts"] ;
}		
?>