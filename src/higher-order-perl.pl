#!/usr/bin/perl

use utf8;
use v5.26;

use strict;
use warnings;

#use bigint;
#use bignum;
#use bigrat;


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

# Factorial
#
# Example:
#   my @n = (1, 2, 3, 4, 5, 6, 7);
#
#   for my $n (@n) {
#       say "$n! = " . Factorial($n);
#   }
#
# Output:
#   1! = 1
#   2! = 2
#   3! = 6
#   4! = 24
#   5! = 120
#   6! = 720
#   7! = 5040

sub Factorial {
    my ($n) = @_;

    return 1 if $n == 0;

    return Factorial($n - 1) * $n;
}

# sub SolveTowerOfHanoiProblem0 {
#     my ($n, $start, $end, $extra) = @_;

#     if ($n == 1) {
#         say "Move disk #$n from $start to $end.";
#     } else {
#         SolveTowerOfHanoiProblem0($n - 1, $start, $extra, $end);

#         say "Move disk #$n from $start to $end.";

#         SolveTowerOfHanoiProblem0($n - 1, $extra, $end, $start);
#     }
# }

# SolveTowerOfHanoiProblem0(3, 'A', 'C', 'B');

sub SolveTowerOfHanoiProblem {
    my ($n, $start, $end, $extra, $moveDisk) = @_;

    if ($n == 1) {
        $moveDisk->($n, $start, $end);
    } else {
        SolveTowerOfHanoiProblem($n - 1, $start, $extra, $end, $moveDisk);

        $moveDisk->($n, $start, $end);

        SolveTowerOfHanoiProblem($n - 1, $extra, $end, $start, $moveDisk);
    }
}

sub PrintInstruction {
    my ($disk, $start, $end) = @_;

    say "Move disk #$disk from $start to $end.";
}

my @position = ('', ('A') x 3);

sub CheckMove {
    my ($disk, $start, $end) = @_;

    my $i;

    if ($disk < 1 || $disk > $#position) {
        die "Bad disk number $disk. Should be 1..$#position.\n";
    }
}

SolveTowerOfHanoiProblem(3, 'A', 'C', 'B', \&PrintInstruction);
