<?php
session_start();
if (!isset($_SESSION["user_id"])) {
    header("Location: index.php");
    exit;
}

$host = "localhost";
$user = "root";
$pass = "";
$dbname = "mmhr_census";

$conn = new mysqli($host, $user, $pass, $dbname);
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$date = date("Y-m-d_H-i-s");
$sqlFile = $dbname . "_" . $date . ".sql";
$zipFile = $dbname . "_" . $date . ".zip";

$tables = array();
$result = $conn->query("SHOW TABLES");
while ($row = $result->fetch_row()) {
    $tables[] = $row[0];
}

$sqlScript = "";

foreach ($tables as $table) {
    $result = $conn->query("SHOW CREATE TABLE `$table`");
    $row = $result->fetch_row();
    $sqlScript .= "\n\n" . $row[1] . ";\n\n";

    $result = $conn->query("SELECT * FROM `$table`");
    $columnCount = $result->field_count;

    while ($row = $result->fetch_row()) {
        $sqlScript .= "INSERT INTO `$table` VALUES(";
        for ($i = 0; $i < $columnCount; $i++) {
            $row[$i] = $row[$i] !== null ? addslashes($row[$i]) : "NULL";
            $row[$i] = isset($row[$i]) ? "'{$row[$i]}'" : "NULL";
            $sqlScript .= $row[$i];
            if ($i < ($columnCount - 1)) {
                $sqlScript .= ",";
            }
        }
        $sqlScript .= ");\n";
    }
    $sqlScript .= "\n";
}

file_put_contents($sqlFile, $sqlScript);

$zip = new ZipArchive();
if ($zip->open($zipFile, ZipArchive::CREATE) === TRUE) {
    $zip->addFile($sqlFile);
    $zip->close();
} else {
    die("Failed to create ZIP file.");
}

unlink($sqlFile);

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Backup Created</title>
    <script>
        function downloadBackup() {
            alert("✅ Backup created successfully! Downloading now...");
            window.location.href = "<?= $zipFile ?>";

            setTimeout(function() {
                fetch('delete_backup.php?file=<?= urlencode($zipFile) ?>')
                .then(response => console.log('Temporary backup deleted.'));
            }, 5000); 
        }
    </script>
</head>
<body onload="downloadBackup()">
</body>
</html>
