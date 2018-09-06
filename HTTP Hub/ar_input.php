<?php
$con = mysqli_connect("localhost","root","");
mysqli_select_db($con,"atombit");
$w = $_REQUEST['w'];
mysqli_query($con,"UPDATE ar SET work = $w WHERE n = 1;");








mysqli_close($con);



  ?>