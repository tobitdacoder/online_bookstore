 
<?php

// you can use this $server='127.0.0.1' instead of $servername='localhost';
$servername = "localhost";
$username = "toby";
$password = "Tobitbush@101299";
$dbname = "online_bookstore";

// Create connection
$conn = mysqli_connect($servername, $username, $password, $dbname);

// Check connection
if (!$conn) {
  die("Connection failed: " . mysqli_connect_error());
}

?>








