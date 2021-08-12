<?php
include("configuration.php");
session_start();
if(!isset($_SESSION['email']))
{
	header("location:index.php");
}
$email=$_SESSION['email'];
$sql=mysqli_query($al,"SELECT * FROM users WHERE email!='$email'");
$receiver=$_POST['user'];
$msg=$_POST['msg'];
$date=date('d-M-Y');
if($receiver==NULL || $msg==NULL)
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
	mysqli_query($al,"INSERT INTO message VALUES('','$email','$receiver','$msg','$date')");
	$info="Message Sent";
}
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Conversation</title>
<link href="scripts/styleSheet.css" rel="stylesheet" type="text/css" />
</head>

<body>
<span class="heading">Private Conversation</span><span style="float:right"><a href="logout.php">
<img src="images/logout.png" height="50" width="100"  /></a></span>
<hr style="border:6px dotted #63C;"/><br />
<br />
<div align="center">
<form method="post" action="">
<table class="table" cellpadding="4" cellspacing="4">
<tr><td class="tableHead" colspan="2" align="center" style="text-decoration:underline;">Send Messages</td></tr>
<tr><td class="info" colspan="2" align="center"><?php echo $info;?></td></tr>
<tr><td class="labels">Select User : </td><td><select name="user" class="fields" style="background-color:#051b18;">
  <option disabled="disabled" selected="selected"> - - - - - - - - - </option>
  <?php while($v=mysqli_fetch_array($sql))
{
?>
  <option value="<?php echo $v['email'];?>"><?php echo $v['name'];?></option>
  <?php } ?>
</select></td></tr>
<tr><td class="labels">Message : </td><td><textarea name="msg" class="fields" rows="2" cols="30" required="required"></textarea></td></tr>
<tr><td colspan="2" align="center"><input type="submit" value="SEND" class="commandButton" /></td></tr>
</table>
</form>
<br />
<br />
<?php
$r=mysqli_query($al,"SELECT * FROM message WHERE receiver='$email' ORDER BY id DESC");
?>
<table cellpadding="4" cellspacing="4" class="table">
<tr><td class="tableHead" align="center" colspan="2" style="text-decoration:underline;">Inbox</td></tr>
<?php while($t=mysqli_fetch_array($r))
{
	$ee=$t['sender'];
	$o=mysqli_query($al,"SELECT * FROM users WHERE email='$ee'");
	$p=mysqli_fetch_array($o);
	$recv=$p['nick'];
	?>
<tr><td class="msg" style="font-size:12px;"><?php echo $t['msg'];?>
<span style="color:#F39;"> ( From <?php echo $recv;?> on <?php echo $t['date'];?>)</span>
</td><td><a href="deleteMessage.php?del=<?php echo $t['id'];?>" style="font-size:12px;">Delete</a></td></tr>
<?php } ?>


</table>
<br />

<?php 
$r=mysqli_query($al,"SELECT * FROM message WHERE sender='$email' ORDER BY id DESC LIMIT 10");
?>
<table cellpadding="4" cellspacing="4" class="table">
<tr><td class="tableHead" align="center" colspan="2" style="text-decoration:underline;">Sent Messages</td></tr>
<?php while($t=mysqli_fetch_array($r))
{
	$ee=$t['receiver'];
	$o=mysqli_query($al,"SELECT * FROM users WHERE email='$ee'");
	$p=mysqli_fetch_array($o);
	$recv=$p['nick'];
	?>
<tr><td class="msg" style="font-size:12px;"><?php echo $t['msg'];?><span style="color:#F39;"> ( To <?php echo $recv;?> on <?php echo $t['date'];?>)</span></td><td><a href="deleteMessage.php?del=<?php echo $t['id'];?>" style="font-size:12px;">Delete</a></td></tr>
<?php } ?>


</table>
<br />
<br />
<a href="home.php">BACK</a>
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