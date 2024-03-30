<?php
// Start the session
session_start();

// Check if the user is logged in
if (!isset($_SESSION['username'])) {
    // Redirect to the login page if not logged in
    header("Location:login.php");
    exit();
}

// If the user is logged in, continue with the page content
?>
<?php
// Include the database connection file
include('../connect.php');

// Fetch total ads count from the database
$sqlAds = "SELECT COUNT(*) as total_ads FROM ads";
$resultAds = $conn->query($sqlAds);
$rowAds = $resultAds->fetch_assoc();
$totalAds = isset($rowAds['total_ads']) ? $rowAds['total_ads'] : 0;

// Fetch total clicks from the user_actions table
$sqlClicks = "SELECT COUNT(*) as total_clicks FROM user_actions WHERE action_type = 'click'";
$resultClicks = $conn->query($sqlClicks);
$rowClicks = $resultClicks->fetch_assoc();
$totalClicks = isset($rowClicks['total_clicks']) ? $rowClicks['total_clicks'] : 0;

// Fetch total earnings from the user_actions table
$sqlEarnings = "SELECT SUM(earnings) as total_earnings FROM user_actions";
$resultEarnings = $conn->query($sqlEarnings);
$rowEarnings = $resultEarnings->fetch_assoc();
$totalEarnings = isset($rowEarnings['total_earnings']) ? $rowEarnings['total_earnings'] : 0;

// Fetch total users count from the users table
$sqlUsers = "SELECT COUNT(*) as total_users FROM users";
$resultUsers = $conn->query($sqlUsers);
$rowUsers = $resultUsers->fetch_assoc();
$totalUsers = isset($rowUsers['total_users']) ? $rowUsers['total_users'] : 0;
?>

<!DOCTYPE html>
<html lang="en">
<head>
   
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
    <style>
    /* Common styles for all screen sizes */
    body {
        font-family: 'Arial', sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f4f4f4;
    }

    header {
        background-color: #333;
        color: #fff;
        padding: 15px;
        text-align: center;
    }

    .container {
        display: flex;
        flex-wrap: wrap;
        justify-content: space-around;
        margin: 20px;
    }

    .card {
        background-color: #fff;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        margin: 15px;
        padding: 20px;
        flex: 1;
        min-width: 300px;
    }

    .profile-card {
        background-color: #007bff;
        color: #fff;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        margin: 15px;
        padding: 20px;
        flex: 1;
        min-width: 300px;
    }

    nav {
        background-color: #333;
        color: #fff;
        padding: 10px;
        justify-content: space-between;
        align-items: center;
        flex-wrap: wrap; /* Allow items to wrap to the next line on smaller screens */
    }

    .menu-btn {
        display: none;
        flex-direction: column;
        cursor: pointer;
    }

    .menu-btn div {
        width: 25px;
        height: 3px;
        background-color: #fff;
        margin: 5px 0;
        transition: 0.4s;
    }

    nav a {
        color: #fff;
        text-decoration: none;
        padding: 10px;
        margin: 5px 0;
    }

    .dropdown-content {
        display: none;
        position: absolute;
        background-color: #333;
        min-width: 160px;
        box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        z-index: 1;
    }

    .dropdown-content a {
        color: #fff;
        padding: 12px 16px;
        text-decoration: none;
        display: block;
    }

    .dropdown:hover .dropdown-content {
        display: block;
    }

    .offers {
        flex: 1;
        width: auto;
        height: auto;
    }

    .content {
        display: flex;
        flex-direction: column;
        width: 100%; /* Occupy full width of the viewport */
    }

    /* Media queries for responsive design */
    @media only screen and (max-width: 768px) {
        .container {
            flex-direction: column; /* Stack items vertically on smaller screens */
            align-items: center; /* Center items on smaller screens */
        }
    }
</style>

</head>
</head>
<body>
    <header>
        <h1>Dashboard</h1>
    </header>
    <nav>
        <div class="menu-btn" onclick="toggleMenu()">
            <div></div>
            <div></div>
            <div></div>
        </div>
        <p></p>
        <div class="dropdown">
            <a href="#">Menu</a>
            <div class="dropdown-content">
                <a href="index.php">Dashboard</a>
                <a href="Ad-create.php">Ad Create</a>
                <a href="click.php">Clicks</a>
                <a href="Adverts.php">Ads</a>
                <a href="withdraw.php">Withdraw</a>
                <a href="withdrawal_history.php">Withdraw History</a>
                <a href="update.php">Update profile</a>
                <a href="../logout.php">Logout</a>
            </div>
        </div>
    </nav>
    <div class="container">
        <div class="card">
            <h2>Users Earnings: $<?php echo $totalEarnings; ?></h2>
        </div>
        <div class="card">
            <h2>Users: <?php echo $totalUsers; ?></h2>
        </div>
        <div class="card">
            <h2>Payouts:</h2>
        </div>
        <div class="card">
            <h2>Users clicks: <?php echo $totalClicks; ?></h2>
        </div>
        <div class="card">
            <h2>Total ads: <?php echo $totalAds; ?></h2>
        </div>
        <div class="profile-card">
            <h2>User Profile</h2>
            <p>Welcome, User123!</p>
            <p>Email: user@example.com</p>
            <p>Role: Admin</p>
        </div>
    </div>
    <!-- Your other HTML content goes here -->
</body>
</html>
