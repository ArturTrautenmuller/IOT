<?php
$con = mysqli_connect("localhost","root","");
mysqli_select_db($con,"atombit");

$n = $_REQUEST['n'];

$res = mysqli_query($con,"SELECT state FROM lampada WHERE n = $n");
while ($vreg = mysqli_fetch_row($res)) {
	echo "$vreg[0]";
}




mysqli_close($con);



  ?>