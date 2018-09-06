<?php 
$con = mysqli_connect("localhost","root","");
mysqli_select_db($con,"atombit");
$s = $_REQUEST['s'];
$r = $_REQUEST['r'];
$g = $_REQUEST['g'];
$b = $_REQUEST['b'];
$n = $_REQUEST['n'];



mysqli_query($con,"UPDATE lampada SET state = $s, red = $r, green = $g, blue = $b WHERE n = $n");





mysqli_close($con);


 ?>