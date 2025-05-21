<?php
require 'vendor/autoload.php';

use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;
use PhpOffice\PhpSpreadsheet\Style\Color;
use PhpOffice\PhpSpreadsheet\Style\Fill;

$summary = [
    1 => ['govt' => 1, 'private' => 2, 'self_employed' => 3, 'ofw' => 4, 'owwa' => 5, 'sc' => 6, 'pwd' => 7, 'indigent' => 8, 'pensioners' => 9, 'nhip' => 10, 'non_nhip' => 11, 'total_admissions' => 12, 'total_discharges_nhip' => 13, 'total_discharges_non_nhip' => 14, 'lohs_nhip' => 15, 'lohs_non_nhip' => 16],
    2 => ['govt' => 2, 'private' => 3, 'self_employed' => 4, 'ofw' => 5, 'owwa' => 6, 'sc' => 7, 'pwd' => 8, 'indigent' => 9, 'pensioners' => 10, 'nhip' => 11, 'non_nhip' => 12, 'total_admissions' => 13, 'total_discharges_nhip' => 14, 'total_discharges_non_nhip' => 15, 'lohs_nhip' => 16, 'lohs_non_nhip' => 17],
];

$spreadsheet = new Spreadsheet();
$sheet = $spreadsheet->getActiveSheet();

$sheet->setCellValue('A1', 'Date');
$sheet->setCellValue('B1', 'Employed');
$sheet->setCellValue('C1', 'Self-Employed');
$sheet->setCellValue('D1', 'OFW');
$sheet->setCellValue('E1', 'OWWA');
$sheet->setCellValue('F1', 'SC');
$sheet->setCellValue('G1', 'PWD');
$sheet->setCellValue('H1', 'Indigent');
$sheet->setCellValue('I1', 'Pensioners');
$sheet->setCellValue('J1', 'NHIP');
$sheet->setCellValue('K1', 'NON-NHIP');
$sheet->setCellValue('L1', 'Total Admissions');
$sheet->setCellValue('M1', 'Total Discharges (NHIP)');
$sheet->setCellValue('N1', 'Total Discharges (NON-NHIP)');
$sheet->setCellValue('O1', 'LOHS (NHIP)');
$sheet->setCellValue('P1', 'LOHS (NON-NHIP)');

$headerStyle = [
    'font' => [
        'bold' => true,
        'color' => ['rgb' => 'FFFFFF'],
        'size' => 12,
    ],
    'alignment' => [
        'horizontal' => \PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_CENTER,
        'vertical' => \PhpOffice\PhpSpreadsheet\Style\Alignment::VERTICAL_CENTER,
    ],
    'fill' => [
        'fillType' => Fill::FILL_SOLID,
        'startColor' => ['rgb' => '000000'],
    ],
];

$sheet->getStyle('A1:P1')->applyFromArray($headerStyle);

$sheet->mergeCells('B1:C1'); 

for ($day = 1; $day <= 31; $day++) {
    $sheet->setCellValue('A' . ($day + 1), $day);  
}

$row = 2; 
foreach ($summary as $day => $data) {
    $sheet->setCellValue("A$row", $day); 
    $sheet->setCellValue("B$row", $data['govt'] + $data['private']);
    $sheet->setCellValue("C$row", $data['self_employed']);
    $sheet->setCellValue("D$row", $data['ofw']);
    $sheet->setCellValue("E$row", $data['owwa']);
    $sheet->setCellValue("F$row", $data['sc']);
    $sheet->setCellValue("G$row", $data['pwd']);
    $sheet->setCellValue("H$row", $data['indigent']);
    $sheet->setCellValue("I$row", $data['pensioners']);
    $sheet->setCellValue("J$row", $data['nhip']);
    $sheet->setCellValue("K$row", $data['non_nhip']);
    $sheet->setCellValue("L$row", $data['total_admissions']);
    $sheet->setCellValue("M$row", $data['total_discharges_nhip']);
    $sheet->setCellValue("N$row", $data['total_discharges_non_nhip']);
    $sheet->setCellValue("O$row", $data['lohs_nhip']);
    $sheet->setCellValue("P$row", $data['lohs_non_nhip']);
    $row++;
}
$sheet->getStyle('A2:P' . ($row - 1))->applyFromArray([
    'alignment' => [
        'horizontal' => \PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_CENTER,
        'vertical' => \PhpOffice\PhpSpreadsheet\Style\Alignment::VERTICAL_CENTER,
    ],
]);

$writer = new Xlsx($spreadsheet);
$filename = 'mmhr_summary.xlsx';
header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
header('Content-Disposition: attachment; filename="' . $filename . '"');
$writer->save('php://output');
exit;
?>
