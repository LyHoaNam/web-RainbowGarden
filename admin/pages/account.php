<?php
@session_start();
include "../../php/connectDB.php";
$fullname_ac="admin";
$username_ac="LyHoaNam";
if (isset($_POST["btn_submit"])) {

	$username = $_POST["email"];
	$password = $_POST["password"];

	$username = strip_tags($username);
	$username = addslashes($username);
	
	$sql = "select * from account where username = '$username' and passwords = '$password' ";
	$db=new DataAccessHelper;
	$db->connect();
	$query=$db->executeQuery($sql);
	$num_rows = mysqli_num_rows($query);
	echo $num_rows; 
	if ($num_rows!=0) {
		echo "1";
		$row=mysqli_fetch_assoc($query);
		$id_ac=$row["id"];
		$username_ac=$row["username"];
		$fullname_ac=$row["fullname"];
		if($row["form"]=="admin")
		{
			$_SESSION['account'] = $id_ac;
			$_SESSION['fullname'] = $fullname_ac;
			header('Location: index.php');
		}
		else
		{
			$_SESSION['customer'] = $row['id'];
			header('Location: ../../index.html');
		}
	}else{
		
		header('Location: login.html');
	}	
}


?>