#!/usr/bin/env perl
use warnings;
use strict;
my $total = 0;
{
    local $/ = undef;
    $_ = <>;
}
# for (<>) {
for (split m/do\(\)/) {
    $_ = (split m/don't\(\)/)[0];
    while (/mul\(([[:digit:]]{1,3}),([[:digit:]]{1,3})\)/g) {
        $total += $1 * $2;
    }
}
# }
print $total, "\n";
