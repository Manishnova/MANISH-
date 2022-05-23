<?php
header('Access-Control-Allow-Origin: *');
 header('Access-Control-Allow-Methods: GET, POST, PATCH, PUT, DELETE, OPTIONS');
 header('Access-Control-Allow-Headers: Origin, Content-Type, X-Auth-Token');
 header("Content-type: application/json; charset=utf-8");
 //Define your Server host name here.
 $HostName = "localhost";
 
 //Define your MySQL Database Name here.
 $DatabaseName = "localconnect";
 
 //Define your Database User Name here.
 $HostUser = "root";
 
 //Define your Database Password here.
 $HostPass ="";
 
 
 
 
 
 
 // Creating MySQL Connection.
 $con = mysqli_connect($HostName,$HostUser,$HostPass,$DatabaseName);
 
 // Getting the received JSON into $json variable.
 $json = file_get_contents('php://input');
 
 // Decoding the received JSON and store into $obj variable.
 $obj = json_decode($json,true);
 
 // Getting User email from JSON $obj array and store into $email.
 $username= $obj['username'];
 
 // Getting Password from JSON $obj array and store into $password.
 $password = $obj['password'];
 
 //Applying User Login query with email and password.
 $loginQuery = "select * from login where username = '$username' AND password = '$password' ";
 
 // Executing SQL Query.
 $check = mysqli_fetch_array(mysqli_query($con,$loginQuery));
 
	if(isset($check)){
		
		 // Successfully Login Message.
		 $onLoginSuccess = 'Successfully Logged In';
		 
		 // Converting the message into JSON format.
		 $SuccessMSG = json_encode($onLoginSuccess);
		 
		 // Echo the message.
		 echo $SuccessMSG ; 
	 
	 }
	 
	 else{
	 
		 // If Email and Password did not Matched.
		$InvalidMSG = 'Invalid Username or Password' ;
		 
		// Converting the message into JSON format.
		$InvalidMSGJSon = json_encode($InvalidMSG);
		 
		// Echo the message.
		 echo $InvalidMSGJSon ;
	 
	 }
 
 mysqli_close($con);
?>