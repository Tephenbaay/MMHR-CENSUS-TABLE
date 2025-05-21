<?php
require 'config.php'; 

$stmt = $pdo->query("SELECT theme_mode, font_size, layout_spacing FROM settings LIMIT 1");
$row = $stmt->fetch(PDO::FETCH_ASSOC);
$response = [
    'theme_mode' => $row['theme_mode'] ?? 'light',
    'font_size' => $row['font_size'] ?? 'medium',
    'layout_spacing' => $row['layout_spacing'] ?? 'comfortable'
];

echo json_encode($response);
