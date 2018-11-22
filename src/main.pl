#!/usr/bin/perl

use utf8;
use v5.26;

use strict;
use warnings;

use bigint;
use bignum;
use bigrat;


# Binary Expansion
#
# Example:
#   my $n = 256;
#   my $b = BinaryExpansion($n);
#
#   say "n: $n";
#   say "b: $b";
#
# Output:
#   n: 256
#   b: 1000000000

sub BinaryExpansion {
    my ($n) = @_;

    return $n if $n == 0 || $n == 1;

    my $k = int($n / 2);
    my $b = $n % 2;

    my $r = BinaryExpansion($k);

    return $r . $b;
}

sub Factorial {
    my ($n) = @_;

    return 1 if $n == 0;

    return Factorial($n - 1) * $n;
}


my @n = (1, 2, 3, 4, 5, 6, 7);

for my $n (@n) {
    say "$n! = " . Factorial($n);
}
