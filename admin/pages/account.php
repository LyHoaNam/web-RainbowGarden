<?php

include "../../php/connectDB.php";


if (isset($_POST["btn_submit"])) {

echo "string";

	$username = $_POST["email"];
	$password = $_POST["password"];

	$username = strip_tags($username);
	$username = addslashes($username);
	
	echo "111";
	$sql = "select * from account where username = '$username' and passwords = '$password' ";
	$db=new DataAccessHelper;
	$db->connect();
	$query=$db->executeQuery($sql);
	$num_rows = mysqli_num_rows($query);
	echo $num_rows; 
	if ($num_rows!=0) {
		echo "1";
		$form=mysqli_fetch_assoc($query);
		if($form["form"]=="admin")
			header('Location: index.html');
		else
			echo "client";
	}else{
		echo "sai roi!";
			//header('Location: index.html');

	}

	echo "string";
}
?>