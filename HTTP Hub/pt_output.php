<?php 
$con = mysqli_connect("localhost","root","");
mysqli_select_db($con,"atombit");


$res = mysqli_query($con,"SELECT state FROM portao WHERE n = 1");
while ($vreg = mysqli_fetch_row($res)) {
	echo "$vreg[0]";
}








mysqli_close($con);
 ?>