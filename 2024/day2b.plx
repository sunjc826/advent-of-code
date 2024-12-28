#!/usr/bin/env perl
use warnings;
use strict;
my $safe_count = 0;

sub between($$) {
    my $diff = $_[1] - $_[0];
    1 <= $diff && $diff <= 3;
}

line: for (<>) {
    my @report = split;
    for my $mult (1, -1) {
        $_ *= $mult for @report;
        my $inc_safe_l_to_r = $#report;
        for (1 ... $#report) {
            if (! between $report[$_ - 1], $report[$_]) {
                $inc_safe_l_to_r = $_ - 1;
                last;
            }
        }

        if ($inc_safe_l_to_r == $#report) {
            $safe_count++;
            next line;
        }

        my $inc_safe_r_to_l = -@report;
        for (1 ... $#report) {
            if (! between $report[-$_ - 1], $report[-$_]) {
                $inc_safe_r_to_l = -$_;
                last;
            }
        }
        $inc_safe_r_to_l += @report;

        if ($inc_safe_r_to_l - $inc_safe_l_to_r == 2) {
            if (between $report[$inc_safe_l_to_r], $report[$inc_safe_r_to_l]) {
                $safe_count++;
                next line;
            }
        }
        elsif ($inc_safe_r_to_l - $inc_safe_l_to_r == 1) {
            if (
                $inc_safe_r_to_l == $#report ||
                $inc_safe_l_to_r == 0 ||
                between($report[$inc_safe_l_to_r - 1], $report[$inc_safe_r_to_l]) ||
                between($report[$inc_safe_l_to_r], $report[$inc_safe_r_to_l + 1])
            ) {
                $safe_count++;
                next line;
            }
        }
    }
}
print $safe_count, "\n";
