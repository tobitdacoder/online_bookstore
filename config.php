<?php 

$servername = "localhost";
$username = "toby";
$password = "Tobitbush@101299";
$dbname = "online_bookstore";

// Create connection to the database
$connexion = mysqli_connect($servername, $username, $password, $dbname);

// Check the connection
if (!$connexion) {
  die("Connection failed: " . mysqli_connect_error());
}
?>