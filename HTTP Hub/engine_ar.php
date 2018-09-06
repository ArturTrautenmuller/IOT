<?php
$con = mysqli_connect("localhost","root","");
mysqli_select_db($con,"atombit");







$sql = "SELECT * FROM scda1";

$result = mysqli_query($con,$sql);
echo "?";
while ($vreg = mysqli_fetch_row($result)) {
	echo "ls=$vreg[1]&lh=$vreg[2]&lm=$vreg[3]&ds=$vreg[4]&dh=$vreg[5]&dm=$vreg[6]&";
}
$result2 = mysqli_query($con,"SELECT state , work , temp FROM ar");
while ($vreg2 = mysqli_fetch_row($result2)) {
	echo "stg=$vreg2[0]&wk1=$vreg2[1]&tp1=$vreg2[2]&";
}
$result3 = mysqli_query($con,"SELECT temp FROM sensor");
while ($vreg3 = mysqli_fetch_row($result3)) {
	echo "tps=$vreg3[0]&";
	
}

$result4 = mysqli_query($con,"SELECT state FROM lampada");
while ($vreg4 = mysqli_fetch_row($result4)) {
	echo "lmps=$vreg4[0]&";
}
$result5 = mysqli_query($con,"SELECT * FROM scd1");
while ($vreg5 = mysqli_fetch_row($result5)) {
	echo "ls1=$vreg5[1]&lh1=$vreg5[2]&lm1=$vreg5[3]&ds1=$vreg5[4]&dh1=$vreg5[5]&dm1=$vreg5[6]&";
}
$result6 = mysqli_query($con,"SELECT * FROM scd2");
while ($vreg6 = mysqli_fetch_row($result6)) {
	echo "ls2=$vreg6[1]&lh2=$vreg6[2]&lm2=$vreg6[3]&ds2=$vreg6[4]&dh2=$vreg6[5]&dm2=$vreg6[6]&";
}
$result7 = mysqli_query($con,"SELECT * FROM scd3");
while ($vreg7 = mysqli_fetch_row($result7)) {
	echo "ls3=$vreg7[1]&lh3=$vreg7[2]&lm3=$vreg7[3]&ds3=$vreg7[4]&dh3=$vreg7[5]&dm3=$vreg7[6]&";
}


echo "@";



mysqli_close($con);

  ?>