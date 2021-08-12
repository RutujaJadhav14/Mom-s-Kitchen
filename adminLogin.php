<?php
include("configuration.php");
session_start();
if(isset($_SESSION['id']))
{
	header("location:adminHome.php");
}
$id=$_POST['id'];
$password=$_POST['password'];
if($id==NULL || $_POST['password']==NULL)
{
	/* Designed &amp; Developed by Tech Vegan YouTube 
 Subscribe for More Projects Download Source Codes
 Channel Link https://bit.ly/2MFT35Q
 
 Don't Share this Project on any Blog or YouTube 
 All Projects &amp; Tech Vegan Contents are Managed by Bumble Tech(TM) Solutions (Registered by Government of India).
 You can use this Project
 You can submit this Project in College/Schools
 You cannot Sell this Project
 Thank you!
 */
}
else
{
	$sql=mysqli_query($al,"SELECT * FROM admin WHERE id='".mysqli_real_escape_string($al,$id)."' AND password='".mysqli_real_escape_string($al,sha1($password))."'");	
	if(mysqli_num_rows($sql)==1)
	{
		$_SESSION['id']=$_POST['id'];
		header("location:adminHome.php");
	}
	else
	{
		$info="Incorrect ID or Password";
	}
}
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Welcome to Chatter Box</title>
<link href="scripts/styleSheet.css" rel="stylesheet" type="text/css" />
</head>

<body>
<div align="center"><br />
<span class="heading">Welcome to Chatter Box Admin Panel | Tech Vegan</span><br />
<br /><br />
<br />
<form method="post" action="">
<table class="table" cellpadding="4" cellspacing="4">
<tr><td align="center" colspan="2" class="tableHead">User Login</td></tr>
<tr><td align="center" class="info" colspan="2"><?php echo $info;?></td></tr>
<tr><td class="labels">ID : </td><td><input type="text" name="id" class="fields" size="30" required="required" /></td></tr>
<tr><td class="labels">Password : </td><td><input type="password" name="password" class="fields" size="30" required="required" /></td></tr>
<tr><td colspan="2" align="center"><input type="submit" value="Login" class="commandButton" /></td></tr>
</table>
</form>
<br />

<br />
<span class="text">Main Page </span><a href="index.php">Click Here</a>

</div>
</body>
<!-- 
Property of Tech Vegan Not For Sell/Not for Selling through any Blog/Website
Designed &amp; Developed by:
								Ashish Labade - https://www.ashishvegan.com 
                                Tech Vegan YouTube Channel Link: https://bit.ly/2MFT35Q
                                Copyright 2020 - Tech Vegan
-->
</html>