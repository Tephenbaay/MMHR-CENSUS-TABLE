<?php
require 'config.php'; 

$stmt = $pdo->query("SELECT retention_days, enable_auto_delete FROM settings LIMIT 1");
$settings = $stmt->fetch(PDO::FETCH_ASSOC);

if (!$settings || $settings['enable_auto_delete'] != 1) {
    exit("Auto-deletion is disabled.");
}

$retentionDays = (int)$settings['retention_days'];
if ($retentionDays <= 0) {
    exit("Invalid retention period.");
}

$cutoffDate = date('Y-m-d H:i:s', strtotime("-$retentionDays days"));

$stmt = $pdo->prepare("SELECT id, file_path FROM uploaded_files WHERE uploaded_at < ?");
$stmt->execute([$cutoffDate]);
$oldFiles = $stmt->fetchAll(PDO::FETCH_ASSOC);

$deletedCount = 0;
foreach ($oldFiles as $file) {
    $filePath = $file['file_path'];

    if (file_exists($filePath)) {
        unlink($filePath);
    }

    $deleteStmt = $pdo->prepare("DELETE FROM uploaded_files WHERE id = ?");
    $deleteStmt->execute([$file['id']]);

    $deletedCount++;
}

echo "Deleted $deletedCount file(s) older than $retentionDays day(s).";