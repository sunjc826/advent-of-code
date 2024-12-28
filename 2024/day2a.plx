#!/usr/bin/env perl
my $safe_count;
line: for (<>) {
    my @report = split;
    next if ($report[1] == $report[0]);
    if ($report[1] < $report[0]) {
        $_ *= -1 for @report;
    }
    for (0 ... ($#report - 1)) {
        my $diff = $report[$_ + 1] - $report[$_];
        if ($diff < 1 || $diff > 3) {
            next line;
        }
    }
    $safe_count++;
}
print $safe_count, "\n";
