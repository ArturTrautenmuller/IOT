<?php
$con = mysqli_connect("localhost","root","");
mysqli_select_db($con,"atombit");

if(isset($_GET["s"]))
{
	$s = $_GET["s"];
	$w = $_GET["w"];
	$l1 = $_GET["l1"];
	$l2 = $_GET["l2"];
	$l3 = $_GET["l3"];
    mysqli_query($con,"UPDATE ar SET state = $s , work = $w WHERE n = 1");
    mysqli_query($con,"UPDATE lampada SET state = $l1 WHERE n = 1");
    mysqli_query($con,"UPDATE lampada SET state = $l2 WHERE n = 2");
    mysqli_query($con,"UPDATE lampada SET state = $l3 WHERE n = 3");



}
mysqli_close($con);

  ?>