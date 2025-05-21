<?php
include 'config.php';

if (isset($_GET['id'])) {
    $id = $_GET['id'];

    $stmt = $conn->prepare("DELETE FROM updates WHERE id = ?");
    $stmt->bind_param("i", $id);
    $stmt->execute();

    echo "<p class='success-message'>✅ Update deleted successfully!</p>";
    header("Location: admin_dashboard.php");
    exit();
}
?>
