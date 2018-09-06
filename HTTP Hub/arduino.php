<?php  
$temp = $_GET["temp"];
$umid = $_GET["umid"];

$con = mysqli_connect("localhost","root","");
mysqli_select_db($con,"atombit");

mysqli_query($con,"UPDATE sensor SET temp = $temp, umid = $umid WHERE n = 1");

$res = mysqli_query($con,"SELECT state , red , green , blue FROM lampada");
$i = 1;
echo "?init=1&";
while ($vreg = mysqli_fetch_row($res)) {
	echo "s".$i."=$vreg[0]&r".$i."=$vreg[1]&g".$i."=$vreg[2]&b".$i."=$vreg[3]&";
	$i++;
}
$res2 = mysqli_query($con,"SELECT state FROM ar"); 
while ($vreg2 = mysqli_fetch_row($res2)) {
	echo "sar=$vreg2[0]&";
}

$res3 = mysqli_query($con,"SELECT state FROM portao"); 
while ($vreg3 = mysqli_fetch_row($res3)) {
	echo "p=$vreg3[0]&";
}


mysqli_close($con);

?>