<?php
$con = mysqli_connect("localhost","root","");
mysqli_select_db($con,"atombit");

$res = mysqli_query($con,"SELECT work FROM ar WHERE n = 1");
while ($vreg = mysqli_fetch_row($res)) {
	echo "$vreg[0]";
}

$res1 = mysqli_query($con,"SELECT state FROM lampada WHERE n = 1");
while ($vreg1 = mysqli_fetch_row($res1)) {
	echo "$vreg1[0]";
}

$res2 = mysqli_query($con,"SELECT state FROM portao WHERE n = 1");
while ($vreg2 = mysqli_fetch_row($res2)) {
	echo "$vreg2[0]";
}





mysqli_close($con);

  ?>