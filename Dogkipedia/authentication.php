<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST, GET, OPTIONS");
header("Access-Control-Allow-Headers: *");

$servername = "localhost";
$username = "root";
$password = "root";
$database = "dogkipedia_db";

// Create connection
$conn = new mysqli($servername, $username, $password, $database);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Function to handle user login
function loginUser($username, $password) {
    global $conn;

    // Use prepared statement to prevent SQL injection
    $sql = "SELECT * FROM users WHERE username = ? AND password = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ss", $username, $password); // Assuming both username and password are strings

    // Execute the prepared statement
    $stmt->execute();

    // Get the result
    $result = $stmt->get_result();

    // Check if there is a row in the result (login successful)
    if ($result->num_rows > 0) {
        $stmt->close(); // Close the statement
        return true; // Login successful
    } else {
        $stmt->close(); // Close the statement
        return false; // Login failed
    }
}

// Handle POST requests
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $action = $_POST['action'];

    switch ($action) {
        case 'login':
            $username = $_POST['username'];
            $password = $_POST['password'];

            $loginResult = loginUser($username, $password);

            if ($loginResult) {
                echo 'success';
            } else {
                echo 'failure';
            }
            break;

        // Add other actions as needed

        default:
            // Handle unknown action
            break;
    }
}

$conn->close();
?>
