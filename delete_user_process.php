<?php
  if (isset($_GET['id'])) {
    $userId = $_GET['id'];
    $conn->query("DELETE FROM users WHERE id = $userId");
    header("Location: admin_dashboard.php");
    exit;
  }
?>