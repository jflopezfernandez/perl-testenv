#!/usr/bin/perl

use utf8;
use v5.26;

use strict;
use warnings;

use XML::Generator ':pretty';


my $gen = XML::Generator->new(':pretty');

my $shoe_size = "shoe-size";

print $gen->person(
    $gen->name("Bob"),
    $gen->age(34),
    $gen->job("Accountant"),
    $gen->$shoe_size("12 1/2")
);
