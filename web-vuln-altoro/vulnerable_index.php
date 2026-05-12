<?php
// Connect to the local database
$conn = mysqli_connect("localhost", "root", "", "altoro_db");
if (!$conn) { die("Connection failed: " . mysqli_connect_error()); }

// SECTION 1: VULNERABLE XSS ATTACK CODE
// The application takes the link_name URL parameter and echoes it directly
// onto the page DOM without HTML entity encoding, allowing script execution.
$link_text = isset($_GET['link_name']) ? $_GET['link_name'] : "Forgot Password?";
echo "<div style='background-color: yellow; padding: 5px'><b>Test Link:</b> <a href='#'>" . $link_text . "</a></div><br>";

// SECTION 2: VULNERABLE SQL INJECTION CODE
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $uid = $_POST['uid'];
    $passw = $_POST['passw'];

    // The inputs are NOT sanitized via prepared statements.
    // They are concatenated directly into the active SQL string.
    $sql = "SELECT * FROM clients WHERE username = '$uid' AND password = '$passw'";
    $result = mysqli_query($conn, $sql);

    if ($result && mysqli_num_rows($result) > 0) {
        echo "<h3>Login Successful. Client Data:</h3>";
        echo "<table border='1'>";
        echo "<tr><th>ID</th><th>Username</th><th>Name</th><th>Balance</th></tr>";

        // This loop iterates through the database array
        // A normal login yields 1 row. An SQL injection forces a dump of ALL rows.
        while($row = mysqli_fetch_assoc($result)) {
            echo "<tr>";
            echo "<td>".$row['id']."</td>";
            echo "<td>".$row['username']."</td>";
            echo "<td>".$row['first_name']." ".$row['last_name']."</td>";
            echo "<td>R".$row['account_balance']."</td>";
            echo "</tr>";
        }
        echo "</table>";
    } else {
        echo "<h3>Login Failed.</h3>";
    }
}
?>
