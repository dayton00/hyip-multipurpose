<?php
// Database configuration
$host = "localhost";  // Replace with your actual database host
$username = "root";  // Replace with your actual database username
$password = "";  // Replace with your actual database password
$database = "hyip";  // Replace with your actual database name

// Create connection
$conn = mysqli_connect($host, $username, $password, $database);

// Check connection
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

// Uncomment the line below if you want to set the character set (optional)
// mysqli_set_charset($conn, "utf8");

?>
