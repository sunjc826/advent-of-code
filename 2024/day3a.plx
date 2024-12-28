#!/usr/bin/env perl

my $total = 0;
for (<>) {
    while (/mul\(([[:digit:]]+),([[:digit:]]+)\)/g) {
        $total += $1 * $2;
    }
    # for (/mul\([[:digit:]]+,[[:digit:]]+\)/g) {
    #     /mul\(([[:digit:]]+),([[:digit:]]+)\)/;
    #     $total += $1 * $2;
    # }
}
print $total, "\n";
