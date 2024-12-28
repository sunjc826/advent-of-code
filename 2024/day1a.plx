#!/usr/bin/env perl
my (@left_col, @right_col);
for (<>) {
    my ($l, $r) = split;
    push @left_col, $l;
    push @right_col, $r;
}
@left_col = sort { $a <=> $b } @left_col;
@right_col = sort { $a <=> $b } @right_col;
my $total_dist;
$total_dist += abs($left_col[$_] - $right_col[$_]) for (0 ... $#left_col);
print $total_dist, "\n";
