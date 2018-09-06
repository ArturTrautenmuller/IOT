<?php 
$con = mysqli_connect("localhost","root","");
mysqli_select_db($con,"atombit");

$s = $_REQUEST['s'];
mysqli_query($con,"UPDATE portao SET state = $s WHERE n = 1;");





mysqli_close($con);

 ?>