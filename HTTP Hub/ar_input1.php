<?php
$con = mysqli_connect("localhost","root","");
mysqli_select_db($con,"atombit");
$t = $_REQUEST['t'];
mysqli_query($con,"UPDATE ar SET temp = $t WHERE n = 1;");








mysqli_close($con);

  ?>