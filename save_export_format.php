<?php
require 'config.php';

$formats = isset($_POST['formats']) ? implode(',', $_POST['formats']) : '';

$query = $pdo->prepare("UPDATE settings SET export_formats = ? LIMIT 1");
$query->execute([$formats]);

echo "Export format preferences saved successfully!";
?>
