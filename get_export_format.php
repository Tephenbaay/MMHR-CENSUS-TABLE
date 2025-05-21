<?php
require 'config.php'; 

$query = $pdo->query("SELECT export_formats FROM settings LIMIT 1");
$row = $query->fetch(PDO::FETCH_ASSOC);

$formats = $row ? explode(',', $row['export_formats']) : [];

echo json_encode(['formats' => $formats]);
?>
