use warnings;
#use diagnostics;
use 5.20.1;

select(STDOUT); $| = 1; # DO NOT REMOVE

chomp(my $n = <STDIN>);
my @strengths = <STDIN>;
map {chomp} @strengths;

@strengths = sort {$a <=> $b} @strengths;

#print STDERR join(", ", @strengths), "\n";

my $min = $strengths[1] - $strengths[0];
for my $i (1 .. $n-2) {
    my $d = $strengths[$i + 1] - $strengths[$i];
    if ($d < $min) {
        $min = $d;
    }
}

print $min, "\n";

# To debug: print STDERR "Debug messages...\n";

# Cool solution by someone else
#
# use strict;
# use warnings;
# use List::Util qw(min);
# use feature 'say';
#
# select(STDOUT); $| = 1; # DO NOT REMOVE
#
# # Auto-generated code below aims at helping you parse
# # the standard input according to the problem statement.
#
# <>;						# I'm guessing this is basically the same as chomp(my $n = <STDIN>);
#
# my @strengths;
#
# while (<>) {
#     chomp;
#     push @strengths, $_;
# }
#
# @strengths = sort { $a <=> $b } @strengths;
# say STDERR "@strengths";
#
# my @diffs = map { $strengths[$_] - $strengths[$_-1] } 1 .. $#strengths; 	# The fact that $_ is the index is what I was missing, thought it would be value
# say STDERR "@diffs";
#
# say min @diffs;

###
# <>;
# push @horses, $_ for <>;
# @horses = sort{$a-$b}@horses;
# $min=@horses[0];
# $sum=@horses[$_+1]-@horses[$_],$min > $sum ? $min = $sum : 0 for (0..~~@horses-2);
# print $min
