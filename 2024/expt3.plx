#!/usr/bin/env perl
# Experiment
# See https://perldoc.perl.org/perlop#/PATTERN/msixpodualngc
# in particular check out the interaction of /c option with /g.
for (<>) {
    /mul\(([[:digit:]]+),([[:digit:]]+)\)/g;
    print $1, ' ', $2, "\n";
    /mul\(([[:digit:]]+),([[:digit:]]+)\)/g;
    print $1, ' ', $2, "\n";
}