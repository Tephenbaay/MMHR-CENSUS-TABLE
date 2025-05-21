<?php
include 'config.php';

if (isset($_GET['id'])) {
    $user_id = $_GET['id'];
    $stmt = $conn->prepare("DELETE FROM users WHERE id = ?");
    $stmt->bind_param("i", $user_id);
    $stmt->execute();

    header("Location: admin_dashboard.php#manage-users");
    exit;
} else {
    echo "<div class='alert alert-danger'>Invalid user ID.</div>";
    exit;
}
  if (isset($_GET['id'])) {
      $userId = $_GET['id'];

      echo "<script>
              var confirmation = confirm('Are you sure you want to delete this user?');
              if (confirmation) {
                  window.location = 'delete_user_process.php?id={$userId}';
              } else {
                  window.location = 'admin_dashboard.php';
              }
            </script>";
  }
?>