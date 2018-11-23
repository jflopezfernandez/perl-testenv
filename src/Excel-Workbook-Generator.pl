#!/usr/bin/perl

use utf8;
use v5.26;

use strict;
use warnings;

use Spreadsheet::WriteExcel;
use Spreadsheet::WriteExcel::Utility;


my $workbook = Spreadsheet::WriteExcel->new("log.xls");

$workbook->compatibility_mode();

$workbook->set_properties(
    utf8 => 1,
    subject => "BusinessThings"
);

my $dateFormat = $workbook->add_format(num_format => 'mm/dd/yyyy');

my @worksheets = ("Reading", "Math", "Computer Science", "Russian", "French");
my @headings = ("Date", "Time", "Minutes", "Total", "Average");

for my $worksheet (@worksheets) {
    my $sheet = $workbook->add_worksheet($worksheet);

    for my $i (0 .. (scalar @headings)) {
        $sheet->write(0, $i, $headings[$i]);
    }

    for my $i (0 .. 10000) {
        for my $j (0 .. (scalar @headings)) {
            
            # Date Column
            if ($j == 0) {
                $sheet->write_date_time($i + 1, $j, '2018-11-23T23:00', $dateFormat);

                # if ($i == 0) {
                #     $sheet->write_date_time($i + 1, $j, '2018-11-23T23:00', $dateFormat);
                # } else {
                #     $sheet->write_formula($i + 1, $j, '=')
                # }
            }
        }
    }
}

#$workbook->save();
$workbook->close();

# my $format = $workbook->add_format();
# $format->set_bold();
# $format->set_color("red");
# $format->set_align("center");

# my $column = 0;
# my $row = 0;



# my @headings = ("Date", "Time", "Pushups");
# my @data = ()

# my $spreadsheet = Spreadsheet::WriteExcel->new;

# $spreadsheet->write_bold_row(\@headings);
# $spreadsheet->write_row(\@data);

# print $spreadsheet->data;

# $spreadsheet->save("test.xls");
