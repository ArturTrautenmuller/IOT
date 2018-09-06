<?php
$con = mysqli_connect("localhost","root","");
mysqli_select_db($con,"atombit");

$n = $_REQUEST["n"];

if(isset($_REQUEST['s'])){$s = $_REQUEST['s']; mysqli_query($con,"UPDATE lampada SET state = $s WHERE n = $n");}
if(isset($_REQUEST['r'])){$r = $_REQUEST['r']; mysqli_query($con,"UPDATE lampada SET red = $r WHERE n = $n");}
if(isset($_REQUEST['g'])){$g = $_REQUEST['g']; mysqli_query($con,"UPDATE lampada SET green = $g WHERE n = $n");}
if(isset($_REQUEST['b'])){$b = $_REQUEST['b']; mysqli_query($con,"UPDATE lampada SET blue = $b WHERE n = $n");}





$result = mysqli_query($con,"SELECT state, red, green , blue FROM lampada WHERE n = $n");
echo "?int=0";
while ($vreg = mysqli_fetch_row($result)) {
	echo "&s=$vreg[0]&r=$vreg[1]&g=$vreg[2]&b=$vreg[3]&";
}




mysqli_close($con);



  ?>