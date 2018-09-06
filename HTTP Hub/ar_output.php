<?php
$con = mysqli_connect("localhost","root","");
mysqli_select_db($con,"atombit");

$res1 = mysqli_query($con,"SELECT work FROM ar WHERE n = 1");
while ($vreg1 = mysqli_fetch_row($res1)) {
	echo "$vreg1[0]";
}



$res = mysqli_query($con,"SELECT temp, umid FROM sensor WHERE n = 1");
while ($vreg = mysqli_fetch_row($res)) {
	echo "$vreg[0]/$vreg[1]/";
}






mysqli_close($con);




  ?>