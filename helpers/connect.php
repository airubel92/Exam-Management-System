<?php
$servername = "localhost:3377";
$dbusername = "root";
$dbpassword = "";
$dbname = "exam";

// Create connection
$conn = mysqli_connect($servername, $dbusername, $dbpassword, $dbname);
// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
