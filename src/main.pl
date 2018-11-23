#!/usr/bin/perl

use utf8;
use v5.26;

use strict;
use warnings;


my $input = "";

do {
    chomp($input = <STDIN>);

    my $len = length($input);

    say "Length: $len" if $input;
} while ($input);
