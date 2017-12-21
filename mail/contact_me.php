<?php
// Check for empty fields
echo "chay tron mat troi";
@session_start();
include "../php/connectDB.php";
if(isset($_POST["btn_submit"]))
{
	if(empty($_POST['name'])      ||
		empty($_POST['email'])     ||
		empty($_POST['phone'])     ||
		empty($_POST['message'])   ||
		!filter_var($_POST['email'],FILTER_VALIDATE_EMAIL))
	{
		//echo "No arguments Provided!";
		//return false;
		$_SESSION["ContErr"]="Có lỗi trong quá trình gửi!";
	}
	else
	{
		$nameC=$_POST['name'];
		$emailC=$_POST['email'];
		$phoneC=$_POST['phone'];
		$messeC=$_POST['message'];
		$sql="INSERT INTO `feedback`( `name`, `phone`, `email`, `content`) VALUES ('$nameC',$phoneC,'$emailC','$messeC')";
		$db=new DataAccessHelper;
	$db->connect();
	if($db->executeNonQuery($sql))
	{
		$_SESSION["ContSS"] = "Xóa thành công";
	}
	else
		$_SESSION["ContErr"] = "Có lỗi trong quá trình xóa";

	header("Location: ../contact.php");
	}
/*
	$name = strip_tags(htmlspecialchars($_POST['name']));
	$email_address = strip_tags(htmlspecialchars($_POST['email']));
	$phone = strip_tags(htmlspecialchars($_POST['phone']));
	$message = strip_tags(htmlspecialchars($_POST['message']));

// Create the email and send the message
/*
$to = 'lyhoanam@gmail.com'; // Add your email address inbetween the '' replacing yourname@yourdomain.com - This is where the form will send a message to.
$email_subject = "Website Contact Form:  $name";
$email_body = "You have received a new message from your website contact form.\n\n"."Here are the details:\n\nName: $name\n\nEmail: $email_address\n\nPhone: $phone\n\nMessage:\n$message";
$headers = "From: noreply@yourdomain.com\n"; // This is the email address the generated message will be from. We recommend using something like noreply@yourdomain.com.
$headers .= "Reply-To: $email_address";   
mail($to,$email_subject,$email_body,$headers);

return true;   
*/
}      
?>
