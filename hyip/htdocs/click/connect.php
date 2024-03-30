<?php
// Database connection parameters
$servername = "sql110.infinityfree.com";
$username = "epiz_27978100";
$password = "IGjAaxW6pzsC6";
$dbname = "epiz_27978100_clicks";

// Create a database connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
?>
