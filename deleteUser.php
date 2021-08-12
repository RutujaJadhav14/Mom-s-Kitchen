<?php
include("configuration.php");
session_start();
if(!isset($_SESSION['id']))
{
	header("location:adminLogin.php");
}
$del=$_GET['del'];
mysqli_query($al,"DELETE FROM users WHERE id='$del'");
header("location:manageUsers.php");

?>