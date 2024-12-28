#!/usr/bin/env perl
my (%left_col, %right_col);
for (<>) {
    my ($l, $r) = split;
    $left_col{$l}++;
    $right_col{$r}++;
}

my $similarity;
$similarity += $left_col{$_} * $_ * $right_col{$_} for (keys %left_col);
print $similarity, "\n";
